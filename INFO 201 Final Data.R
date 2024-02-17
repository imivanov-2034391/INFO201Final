rm(list = ls())

# library statements
library(dplyr)
library(stringr)
library(testthat)


# Loads in two data sets and the conversion chart
sleep_df <- read.csv("Sleep_health_and_lifestyle_dataset.csv")
job_df <- read.csv("Occupation Employment and Wage Statistics.csv")
conversion_df <- read.csv("Occupation Conversion Chart.csv")

# Cleans job_df and saved as job_wages_df with only job title and wages columns
job_wages_df <- job_df %>% select(OCC_TITLE, H_MEAN, A_MEAN)

#  combine
combined_df <- sleep_df %>%
  #mutate(match(Occupation, Occupation_sleep)) %>%
  left_join(conversion_df, by = c("Occupation" = "Occupation_sleep")) %>%
  left_join(job_wages_df, by = c("Corresponding Occupation_job" = "OCC_TITLE"))
