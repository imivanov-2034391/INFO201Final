# INFO 201 Final Project Data Wrangling
# Section BH
# Group member: Sera Lee, Lele Zhang, Ivette Ivanov, Sohyun Han

rm(list = ls())

# library statements
library(dplyr)
library(stringr)
library(testthat)


# Loads in two data sets and the conversion chart
sleep_df <- read.csv("Sleep_health_and_lifestyle_dataset.csv")
job_df <- read.csv("Occupation Employment and Wage Statistics.csv")
conversion_df <- read.csv("Occupation Conversion Chart one-on-one.csv")

# Cleans job_df and saved as job_wages_df with only job title and wages columns
job_wages_df <- job_df %>% select(OCC_TITLE, H_MEAN, A_MEAN)

# Combines all data frames into one
combined_df <- sleep_df %>%
  left_join(conversion_df, by = c("Occupation" = "Occupation_sleep"), relationship = "many-to-many") %>% 
  left_join(job_wages_df, by = c("Corresponding.Occupation_job" = "OCC_TITLE"), relationship = "many-to-many") %>% 
  distinct(Person.ID, .keep_all = TRUE)


# Another way
# Combine with job conversion chart first
#job_wages_df <- job_df %>%
#  select(OCC_TITLE, H_MEAN, A_MEAN) %>%
#  left_join(conversion_df, by = c("OCC_TITLE" = "Corresponding.Occupation_job"), relationship = "many-to-many") %>%
#  filter(Occupation_sleep != "N/A")
#combined_df <- job_wages_df %>%
#  left_join(sleep_df, by = c("Occupation_sleep" = "Occupation"), relationship = "many-to-many")  %>%
#  distinct(Person.ID, .keep_all = TRUE)

