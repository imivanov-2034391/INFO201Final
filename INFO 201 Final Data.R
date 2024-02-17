rm(list = ls())

# library statements
library(dplyr)
library(stringr)
library(testthat)

# Loads in two data sets
sleep_df <- read.csv("Sleep_health_and_lifestyle_dataset.csv")
job_df <- read.csv("Occupation Employment and Wage Statistics.csv")
<<<<<<< Updated upstream

# Select only columns we need from job_df
job_wages_df <- job_df %>%
  select(OCC_TITLE, H_MEAN, A_MEAN)

=======
#conversion_df <- read.csv("")
  
>>>>>>> Stashed changes
# Data frame combine
combined_df <- sleep_df %>%
# state_name_abv_df <- data.frame(State.Code = state.abb, State.Name = state.name)
  mutate(state_abb = state.abb[match(State, state.name)]) %>%
  left_join(conversion_df, by = c("County" = "County_name", "state_abb" = "State")) 
  left_join(job_df, by = c("Occupation" = "OCC_TITLE"))

# Filter out N/A value which sleep might not have some jobs which wage has

