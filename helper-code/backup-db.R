library(DBI)
library(RSQLite)
library(tidyverse)


# Script to backup db files with date/time stamps.
folder <- "/home/susan/Projects/Graphics/2020-log-scales/lineups-pilot-app/"  # Location of dbs
ext <- "\\.db$" # database extension
driver <- dbDriver("SQLite")

# names of columns with identifying data
id_data_names <- c("nick_name", "ip_address", "ip", "nickname", "name")


# --- Functions to help --------------------------------------------------------
# Function to scramble information predictably while preserving NA/"" data
my_digest <- function(x) {
  y <- stringr::str_trim(x)
  dx <- digest::digest(y)
  dx[is.na(x)] <- NA
  dx[y == ""] <- ""
  dx
}


# hash user information that is identifiable
# this assumes certain common column names and may need adjustment
protect_privacy <- function(df) {
  df %>%
    mutate(across(.cols = any_of(id_data_names), ~purrr::map_chr(., my_digest)))
  
}

make_bullet <- function(x) {
  map_chr(x, ~paste("- ", ., sep = ""))
}

indent <- function(x) {
  map_chr(x, ~paste0("  ", .))
}

create_hierarchy <- function(x, y) {
  if (any(stringr::str_sub(stringr::str_trim(y), 1, 1) != "-")) y <- make_bullet(y)
  y <- indent(y)
  x <- make_bullet(x)
  
  c(x, y)
}

add_to_hierarchy <- function(x, y) {
  x <- make_bullet(x)
  c(x, y)
}

# ------------------------------------------------------------------------------

prevwd <- setwd(folder)
files <- tibble(dbfile = list.files(folder, pattern = ext, recursive = F),
       con = purrr::map(dbfile, dbConnect, drv = driver)) %>%
  # Read all tables
  mutate(tables = purrr::map(con, db_list_tables),
         last_updated = purrr::map_chr(dbfile, ~file.mtime(.) %>% as.character()))

# This reads in all of the tables
tables <- files %>%
  select(dbfile, con, tables) %>%
  unnest(tables) %>%
  mutate(data = purrr::map2(con, tables, dbReadTable) %>% purrr::map(protect_privacy)) %>%
  mutate(names = purrr::map(data, names),
         modifications = purrr::map(names, ~ifelse(. %in% id_data_names, " (hashed for privacy)", "")),
         description = purrr::map2(names, modifications, ~sprintf("%s%s:", .x, .y))) %>%
  select(-con, -names, -modifications) %>%
  mutate(filename = file.path(stringr::str_remove(dbfile, ext), paste0(tables, ".csv")))

setwd(prevwd)

# Write out all of the tables
dirs <- tables$filename %>% dirname %>% unique() %>% file.path(prevwd, .)
purrr::walk(dirs, dir.create, showWarnings = F)

tables %>% mutate(out = map2(.$data, .$filename, write_csv))

# Create manifest to fill in
tmp <- tables %>% select(dbfile, tables, filename, description) %>%
  full_join(
    select(files, dbfile, last_updated), 
    .
  ) %>%
  mutate(table_description = purrr::map2(tables, description, create_hierarchy)) %>%
  nest(db_info = -c(dbfile, last_updated)) %>%
  mutate(table_descriptions = map(db_info, ~unlist(.$table_description))) %>%
  mutate(table_descriptions = map(table_descriptions, ~create_hierarchy("Tables", .))) %>%
  mutate(table_descriptions = map2(paste("Last modified:", last_updated), 
                                   table_descriptions, 
                                   create_hierarchy)) %>%
  mutate(dbfile = stringr::str_remove(dbfile, ext)) %>%
  mutate(table_descriptions = map2(dbfile, table_descriptions, create_hierarchy))

c("# Contents", unlist(tmp$table_descriptions)) %>%
  write_lines(path = "data-manifest-auto.md")

