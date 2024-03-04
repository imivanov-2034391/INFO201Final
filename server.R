# INFO 201 Final Project -- Final Deliverable
# Section BH
# Group member: Sera Lee, Lele Zhang, Ivette Ivanov, Sohyun Han


# Load libraries
library(ggplot2)
library(plotly)
library(dplyr)
library(bslib)
library(shiny)

# Load data
combined_df <- read.csv("Comprehensive Physical Health and Occupational Statistics Dataset.csv")


server <- function(input, output){
  
  
  # Interactive Page 1
  
  output$phy_occ_plot <- renderPlotly({
    
    # filter out data frame that physical activity level > 60
    filtered_df <- combined_df %>% filter(Physical.Activity.Level > 60)
    
    if (input$phy_occ_plot_60) { # display physical activity level > 60 
      my_plot <- ggplot(filtered_df) +
        geom_point(mapping = aes(
          x = Physical.Activity.Level,
          y = Occupation,
          color = Physical.Activity.Level
        ))

    } else { # display all physical activity level
      my_plot <- ggplot(combined_df) +
      geom_point(mapping = aes(
        x = Physical.Activity.Level,
        y = Occupation,
        color = Physical.Activity.Level
      ))
    }
    
    return(ggplotly(my_plot))
  })
  
  
  
  # Interactive Page 2
  
  output$sle_occ_plot <- renderPlotly({
  })
  
  
  
  
  
  # Interactive Page 3
  
  output$sal_phy_plot <- renderPlotly({
  })
  
  
  
  
}