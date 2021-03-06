# Contents
- 20200917-graphics_group
  - Last modified: 2020-09-23 16:09:31
    - Tables
      - experiment_details
        - **experiment:** provides the graphical experiment name, `emily-log-1`
        - **question:** what question are the participants being asked?, `Which plot is the most different?`
        - **reasons:** options for the participants to select to justify their selection.
        - **lpp:** lineups per participant, `20`.
        - **trials_req:** the number of trials required for the participant to move on to the experiment, `0`.
      - feedback
        - **ip_address** (hashed for privacy): unique identifier for the computer being used to complete the experiment.
        - **nick_name** (hashed for privacy): unique identifier combining the user's ip_address, screen resolution, etc.
        - **start_time:** time in which the participant began evaluating that particular plot
        - **end_time:** time in which the participant completed evaluating that particular plot
        - **pic_id:** the plot being evaluated (can be matched across to `picture_details`)
        - **response_no:** the panel the user selected as the most "different"
        - **conf_level:** the level of confidence the participant had in selecting the target panel for that plot.
        - **choice_reason:** the participants justification for selecting the panel indicated in response_no.
        - **description:** provides the graphical experiment name, `emily-log-1`
      - picture_details
        - **pic_id:** the plot being evaluated (can be matched across to `feedback`)
        - **sample_size:** the number of data points being simulated for each panel.
        - **test_param:** the scale on which the lineup plot is being displayed, `log` or `linear`.
        - **param_value:** the unique combination of parameters used to simulate the dataset (e.g. `target-E-Lv_null-H-Lv_r0` indicates the target panel recieved easy curvature (clear elbow bend) with low variability while the null panels recieved hard curvature (almost linear) with low variability and it is not a rorschach plot (r0), note that r1 indicates it is a rorschach plot)
        - **p_value:** default set to 1. 
        - **obs_plot_location:** which panel the target dataset appears. 
        - **pic_name (hashed):** path to the .png file displaying the lineup plot.
        - **experiment:** provides the graphical experiment name, `emily-log-1`
        - **difficulty:** unique 3 digit number for the test_param x param_value combination, the first digit indicates the scale (1 = linear, 2 = log) and the last two digits uniquely identify a paramter_value.
        - **data_name:** name of the .csv file (generated by `library(nullabor)`) found in the data folder which was mapped to the lineup plot. 
        - **trial:** 0 = test plot; 1 = trial plot.
      - users
        - **nick_name** (hashed for privacy): unique identifier combining the user's ip_address, screen resolution, etc.
        - **age:** indicates the participants age range.
        - **gender:** indicates the gender the participant identifies by.
        - **academic_study:** indicates the level of education the pariticpant has completed.
        - **ip_address** (hashed for privacy): unique identifier for the computer being used to complete the experiment.
- exp_data
  - Last modified: 2020-10-18 14:31:09
    - Tables
      - experiment_details
        - **experiment:** provides the graphical experiment name, `emily-log-1`
        - **question:** what question are the participants being asked?, `Which plot is the most different?`
        - **reasons:** options for the participants to select to justify their selection.
        - **lpp:** lineups per participant, `20`.
        - **trials_req:** the number of trials required for the participant to move on to the experiment, `0`.
      - feedback
        - **ip_address** (hashed for privacy): unique identifier for the computer being used to complete the experiment.
        - **nick_name** (hashed for privacy): unique identifier combining the user's ip_address, screen resolution, etc.
        - **start_time:** time in which the participant began evaluating that particular plot
        - **end_time:** time in which the participant completed evaluating that particular plot
        - **pic_id:** the plot being evaluated (can be matched across to `picture_details`)
        - **response_no:** the panel the user selected as the most "different"
        - **conf_level:** the level of confidence the participant had in selecting the target panel for that plot.
        - **choice_reason:** the participants justification for selecting the panel indicated in response_no.
        - **description:** provides the graphical experiment name, `emily-log-1`
      - picture_details
        - **pic_id:** the plot being evaluated (can be matched across to `feedback`)
        - **sample_size:** the number of data points being simulated for each panel.
        - **test_param:** the scale on which the lineup plot is being displayed, `log` or `linear`.
        - **param_value:** the unique combination of parameters used to simulate the dataset (e.g. `target-E-Lv_null-H-Lv_r0` indicates the target panel recieved easy curvature (clear elbow bend) with low variability while the null panels recieved hard curvature (almost linear) with low variability and it is not a rorschach plot (r0), note that r1 indicates it is a rorschach plot)
        - **p_value:** default set to 1. 
        - **obs_plot_location:** which panel the target dataset appears. 
        - **pic_name (hashed):** path to the .png file displaying the lineup plot.
        - **experiment:** provides the graphical experiment name, `emily-log-1`
        - **difficulty:** unique 3 digit number for the test_param x param_value combination, the first digit indicates the scale (1 = linear, 2 = log) and the last two digits uniquely identify a paramter_value.
        - **data_name:** name of the .csv file (generated by `library(nullabor)`) found in the data folder which was mapped to the lineup plot. 
        - **trial:** 0 = test plot; 1 = trial plot.
      - users
        - **nick_name** (hashed for privacy): unique identifier combining the user's ip_address, screen resolution, etc.
        - **age:** indicates the participants age range.
        - **gender:** indicates the gender the participant identifies by.
        - **academic_study:** indicates the level of education the pariticpant has completed.
        - **ip_address** (hashed for privacy): unique identifier for the computer being used to complete the experiment.