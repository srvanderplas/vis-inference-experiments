# Visual Inference Experiments

A repository for holding the code and data necessary to run visual inference experiments.

Structure:

```
experiment-name
  | 
  | - README description of the experiment and experimental design with at least one sample lineup. 
  |   Include links to any papers or external repos.
  |
  | + app - subfolder for shiny/testing application code
  |
  | + plots - subfolder for generated plots. Symbolic link to app directory if necessary
  |    + svg
  |    + png
  |    + pdf
  |    + data - subfolder for data used to generate lineups
  |
  | + data - subfolder for anonymized participant data
  |    - data-manifest.md - description of columns in each data file
  |
  | + other folders as necessary
```

helper-code/ contains files that may be useful in generating some of the information automatically.