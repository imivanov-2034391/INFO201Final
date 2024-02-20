# INFO 201 Final Project Data Wrangling
# Section BH
# Group member: Sera Lee, Lele Zhang, Ivette Ivanov, Sohyun Han

rm(list = ls())

# library statements
library(dplyr)
library(stringr)
library(testthat)


# Data Joining

# Loads in two data sets and the conversion chart
sleep_df <- read.csv("Sleep Health and Lifestyle Dataset.csv")
job_df <- read.csv("Occupation Employment and Wage Statistics.csv")
conversion_df <- read.csv("Occupation Conversion Chart.csv")


# Cleans job_df and saved as job_wages_df with only job title and wages columns
job_wages_df <- job_df %>% select(OCC_TITLE, H_MEAN, A_MEAN)


# Combines all data frames into one
combined_df <- sleep_df %>%
  left_join(conversion_df, by = c("Occupation" = "Occupation_sleep"), relationship = "many-to-many") %>% 
  left_join(job_wages_df, by = c("Corresponding.Occupation_job" = "OCC_TITLE"), relationship = "many-to-many") %>% 
  distinct(Person.ID, .keep_all = TRUE)
View(combined_df)



# Data Cleaning & Augmentation

# Adding columns

# New Column #1: Is the value above the median sleep hours? (Categorical variable)
# if/else function used from https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/ifelse
sleep_median <- median(combined_df$Sleep.Duration)
combined_df <- combined_df %>% 
  mutate(above_med_hours = ifelse(Sleep.Duration > sleep_median, TRUE, FALSE))


# New Column #2: Percentage above or below 10000 steps daily (Continuous variable)
combined_df <- combined_df %>% 
  mutate(perc_daily_steps = (Daily.Steps / 10000) * 100)


# New summarization data frame:
# To see what percentages of each occupation is in the df
# Percentage of that each occupation takes in the data frame
# n() function from https://learning.oreilly.com/library/view/programming-skills-for/9780135159071/ch11.xhtml
# and https://www.rdocumentation.org/packages/dplyr/versions/0.7.8/topics/n
percentage_occupation <- combined_df %>%
  group_by(combined_df$Occupation) %>%
  summarize(percentage = round(n() / nrow(combined_df) * 100))

