# STAT107_Final_Project_Group_20
# Regular Season vs Playoffs: Shooting Efficiency Analysis

Our final project for STAT 107. We are exploring the differences in three pointer accuracy and field goal percentage in regular season games and playoff games.

This project analyzes differences in shooting efficiency at both the player and team levels using NBA league-wide datasets for the regular season and playoffs.


__Regular Season.csv__
- Contains player-level NBA regular-season statistics, including field goals (FGM, FGA, FG%), three-point shooting (3PM, 3PA, 3P%), minutes, points, team, and player names.

__Playoffs.csv__
- Contains player-level NBA playoff statistics with the same variables as the regular-season file, including field goals (FGM, FGA, FG%), three-point shooting (3PM, 3PA, 3P%), minutes, points, team, and player names.

__00_requirements.R__
- Installs missing packages and loads all libraries needed for the project (tidyverse, ggpubr, broom, knitr).
- This file must be sourced before running any other scripts.

__02_funct_Plots.R__
- Defines all custom visualization functions used in the project, including:
    - histogram plots for FG% and 3P%,
    - paired boxplots comparing regular-season and playoff performance,
    - correlation scatterplots with regression and reference lines.
- This file is sourced by the visualization R Markdown script and allows consistent, reusable plotting across the project.

__11_DataCleaning.Rmd__
- Loads the regular-season and playoff datasets, selects the relevant shooting variables, standardizes column names, and combines both datasets into a unified cleaned dataset used for all later analysis.

