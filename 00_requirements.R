
# title: 00_requirements.R
# author: STAT 107 - Team 20
# purpose: Install and load all required packages
# description: This script installs (if needed) and loads all packages required
#              for the NBA analysis project.

  
packages <- c("tidyverse",  # includes dplyr, ggplot2, readr, tidyr, etc.
              "ggpubr",     # for publication-ready plots
              "broom",      # to tidy up statistical test outputs
              "knitr"       # for knitting RMarkdown files
              )

# check which packages are already installed
# rownames(installed.packages()) returns the names of installed packages
installed <- packeges %in% rownames(installed.packages())

# install any missing packages
if (any(!installed)) {
  install.packages(packages[!installed])
}

# load all required packages
#character.only = TRUE allows using package names stored as strings
lapply(packages, library, character.only = TRUE)
