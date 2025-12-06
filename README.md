# STAT107_Final_Project_Group_20
# Regular Season vs Playoffs: Shooting Efficiency Analysis

Our final project for STAT 107. We are exploring the differences in three-point accuracy and field goal percentage in regular season games and playoff games.

This project analyzes differences in shooting efficiency at both the player and team levels using NBA league-wide datasets for the regular season and playoffs.
<br><br>
__Regular Season.csv__
 Contains player-level NBA regular-season statistics, including field goals (FGM, FGA, FG%), three-point shooting (3PM, 3PA, 3P%), minutes, points, team, and player names.
<br><br>
__Playoffs.csv__
 Contains player-level NBA playoff statistics with the same variables as the regular-season file, including field goals (FGM, FGA, FG%), three-point shooting (3PM, 3PA, 3P%), minutes, points, team, and player names.
<br><br>
__team_accuracy_comparison_R.csv__
 A team-level summary dataset created by the statistical analysis file. It reports each team’s field-goal percentage, three-point percentage, and whether the team made the playoffs. This file is used for boxplots and correlation visualizations in the project.
<br><br>
__00_requirements.R__
 Installs missing packages and loads all libraries needed for the project (tidyverse, ggpubr, broom, knitr). This file must be sourced before running any other scripts.
<br><br>
__02_funct_Plots.R__
 This file defines all custom visualization functions used in the project, including histogram plots for FG% and 3P%, paired boxplots comparing regular-season and playoff performance, and correlation scatterplots with regression and reference lines. It is sourced by the visualization R Markdown script and provides consistent, reusable plotting across the project.
<br><br>
__11_DataCleaning.Rmd__
 Loads the regular-season and playoff datasets, selects the relevant shooting variables, standardizes column names, and combines both datasets into a unified cleaned dataset used for all later analysis.
<br><br>
__31_DataVisualization.Rmd__
 Creates all player-level and team-level visualizations used in the final report. It loads the cleaned data, generates paired datasets, and produces plots such as FG% histograms, paired comparison boxplots, FG% correlation scatterplots, and team-level FG%/3P% comparisons. All figures are saved as PNG files for inclusion in the report.
<br><br>
__41_Statistical_Analysis.Rmd__
 Performs team-level statistical analysis by comparing playoff and non-playoff teams using Welch t-tests for FG% and 3P%. Calculates Cohen’s d effect sizes and exports a team summary dataset (team_accuracy_comparison_R.csv) used in visualization.
