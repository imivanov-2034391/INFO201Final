# INFO 201 Final Project -- Final Deliverable
# Section BH
# Group member: Sera Lee, Lele Zhang, Ivette Ivanov, Sohyun Han

library(ggplot2)
library(plotly)
library(dplyr)
library(bslib)
library(shiny)

# Load data
combined_df <- read.csv("Comprehensive Physical Health and Occupational Statistics Dataset.csv")



server <- function(input, output){
  
  # TODO Make outputs based on the UI inputs here
  
  
  # Interactive Page 1
  output$phy_occ_plot <- renderPlotly({
    my_plot <- ggplot(combined_df) +
      geom_point(mapping = aes(
        x = Physical.Activity.Level,
        y = Occupation,
        color = Physical.Activity.Level
      ))
    return(ggplotly(my_plot))
  })
  
  
  # Interactive Page 2
  
  
  
  
  
  
  # Interactive Page 3
  
  
  
  
  
  
}