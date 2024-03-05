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
    
    if (input$sle_occ_plot_type == "Best Quality of Sleep") {
      sorted_df <- combined_df %>% arrange(Quality.of.Sleep)
      filtered_df <- head(sorted_df, 10)  
      
      p <- plot_ly(data = filtered_df, x = ~Occupation, y = ~Quality.of.Sleep, type = 'bar', marker = list(color = '#636EFA')) %>%
        layout(title = paste("Occupations with Best Quality of Sleep"))
    } else if (input$sle_occ_plot_type == "Worst Quality of Sleep") {
      sorted_df <- combined_df %>% arrange(desc(Quality.of.Sleep))
      filtered_df <- head(sorted_df, 10)  
      p <- plot_ly(data = filtered_df, x = ~Occupation, y = ~Quality.of.Sleep, type = 'bar', 
                   marker = list(color = '#EF553B')) %>%
        layout(title = paste("Occupations with Worst Quality of Sleep"))
    } else {
      return(NULL)
    }
    
    p
  })
 
  
  
  
  
  # Interactive Page 3
  
  output$sal_phy_plot <- renderPlotly({
  })
  
  
  
  
}
