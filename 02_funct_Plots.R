# title: 02_funct_Plots.R
# author: STAT 107 - Team 20
# purpose: Define all functions for creating project visualizations
# description: This script contains functions for plotting histograms, paired box plots, and correlation scatter plots.
# It is sourced by the main visualization Rmd.

# Visualization functions using ggplot2 and ggpubr
library(tidyverse)
library(ggpubr)

# Plot histograms
plot_distribution_histograms <- function(regular_df, playoff_df, metric_col, plot_title_prefix, bin_width = 2) {
  p1 <- ggplot(regular_df, aes_string(x = metric_col)) +
    geom_histogram(aes(y = after_stat(density)), binwidth = bin_width, fill = "blue", alpha = 0.7) +
    geom_density(color = "blue", size = 1) +
    ggtitle(paste(plot_title_prefix, "Distribution (Regular Season)")) +
    xlab(metric_col) +
    theme_minimal()
  
  p2 <- ggplot(playoff_df, aes_string(x = metric_col)) +
    geom_histogram(aes(y = after_stat(density)), binwidth = bin_width, fill = "red", alpha = 0.7) +
    geom_density(color = "red", size = 1) +
    ggtitle(paste(plot_title_prefix, "Distribution (Playoffs)")) +
    xlab(metric_col) +
    theme_minimal()
  
  ggarrange(p1, p2, ncol = 2)
}

# Plot Paired Comparison Box Plot
plot_paired_boxplot <- function(paired_df, col_reg, col_playoff, plot_title, y_label) {
  paired_long <- paired_df %>%
    select(Player, all_of(col_reg), all_of(col_playoff)) %>%
    pivot_longer(
      cols = c(all_of(col_reg), all_of(col_playoff)),
      names_to = "Season_Type",
      values_to = "Metric_Value"
    ) %>%
    mutate(Season_Type = factor(Season_Type,
                                levels = c(col_reg, col_playoff),
                                labels = c("Regular Season", "Playoffs")))
  
  # Create the plot
  ggplot(paired_long, aes(x = Season_Type, y = Metric_Value, fill = Season_Type)) +
    geom_boxplot() +
    geom_point(position = position_jitter(width = 0.1), alpha = 0.5) +
    # Add lines connecting each player's stats
    geom_line(aes(group = Player), color = "gray", alpha = 0.6) +
    ggtitle(plot_title) +
    xlab("Season Type") +
    ylab(y_label) +
    theme_minimal()
}

# Plot correlation scatter plot
plot_correlation_scatter <- function(paired_df, col_reg, col_playoff, plot_title, x_label, y_label) {
  x_min <- min(paired_df[[col_reg]], na.rm = TRUE)
  y_max <- max(paired_df[[col_playoff]], na.rm = TRUE)
  
  # Use aes_string to pass string column names to aesthetics
  ggplot(paired_df, aes_string(x = col_reg, y = col_playoff)) +
    geom_point(aes(color = Team_reg)) +
    # Add linear regression line
    geom_smooth(method = "lm", se = FALSE, color = "black") +
    # Add y=x line
    geom_abline(intercept = 0, slope = 1, linetype = "dashed", color = "red") +
    ggtitle(plot_title) +
    xlab(x_label) +
    ylab(y_label) +
    theme_minimal() +
    # Add annotation for the y=x line
    annotate("text", x = x_min + 2, y = y_max - 2, 
             label = "Line y=x (No Change)", 
             color = "red", hjust = 0) # hjust=0 for left-align
}