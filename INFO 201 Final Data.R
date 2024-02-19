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


# Adding columns
# View(combined_df)

# Calculate Median Sleep Value
med_sleep <- median(combined_df$Sleep.Duration)

# Is the value above the median sleep hours
# ifelse function used from https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/ifelse
combined_df <- combined_df %>% 
  mutate(above_med_hours = ifelse(Sleep.Duration > med_sleep, TRUE, FALSE))

# Percent above or below 10000 steps daily
combined_df <- combined_df %>% 
  mutate(percent_steps_daily = Daily.Steps/10000)

# New Summarize data frame - to see what percentages of each occupation is in the df
# Percentage of that each Occupation takes in the data frame
# n() function from https://learning.oreilly.com/library/view/programming-skills-for/9780135159071/ch11.xhtml
# and https://www.rdocumentation.org/packages/dplyr/versions/0.7.8/topics/n
percentage_occupation <- combined_df %>%
  group_by(combined_df$Occupation) %>%
  summarize(percentage = round(n() / nrow(combined_df) * 100))
