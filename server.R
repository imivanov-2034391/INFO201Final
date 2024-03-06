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
    
    filtered_df <- combined_df %>% filter(Occupation %in% input$user_selection)
    filtered_60_df <- combined_df %>% filter(Physical.Activity.Level > 60)
    
    if (input$phy_occ_plot_60) { # display physical activity level > 60 
      my_plot <- ggplot(filtered_60_df) +
        geom_point(mapping = aes(
          x = Physical.Activity.Level,
          y = Occupation,
          color = Occupation
        ))
      
    } else { # display all physical activity level
      my_plot <- ggplot(filtered_df) +
        geom_point(mapping = aes(
          x = Physical.Activity.Level,
          y = Occupation,
          color = Occupation
        ))
    }
    
    return(ggplotly(my_plot))
  })
  
  
  # Interactive Page 2
  output$sle_occ_plot <- renderPlotly({
    
    if (input$sle_occ_plot_type == "Best Quality of Sleep") {
      sorted_df <- combined_df %>% arrange(Quality.of.Sleep)
      filtered_df <- sorted_df[1:3, ]  
      
      
      if (!"Salesperson" %in% filtered_df$Occupation) {
        filtered_df <- rbind(filtered_df, combined_df[combined_df$Occupation == "Salesperson", ])
      }
      if (!"Scientist" %in% filtered_df$Occupation) {
        filtered_df <- rbind(filtered_df, combined_df[combined_df$Occupation == "Scientist", ])
      }
      
      p <- plot_ly(data = filtered_df, x = ~Occupation, y = ~Quality.of.Sleep, type = 'bar', marker = list(color = '#636EFA')) %>%
        layout(title = "Best Sleep Quality Occupations")
    } else if (input$sle_occ_plot_type == "Worst Quality of Sleep") {
      sorted_df <- combined_df %>% arrange(desc(Quality.of.Sleep))
      filtered_df <- sorted_df[1:3, ] 
      
      p <- plot_ly(data = filtered_df, x = ~Occupation, y = ~Quality.of.Sleep, type = 'bar', 
                   marker = list(color = '#EF553B')) %>%
        layout(title = "Worst Sleep Quality Occupations")
    } else {
      return(NULL)
    }
    
    p
  })
 
  
  # Interactive Page 3 - Salary and Health
  
  output$sal_phy_plot <- renderPlotly({
    
    health_df <- combined_df %>% arrange(A_MEAN)
    
    if(input$viz_3inputid2 == "Average Annual Salary"){
      if (input$viz_3inputid == "Heart Rate") {
        my_plot3 <- plot_ly(data = health_df, x = ~Heart.Rate, y = ~A_MEAN, type = 'scatter',
                            marker = list(color = '#345')) %>%
          layout(title = paste("Heart Rate"),
                 xaxis = list(title = "Heart Rate"),
                 yaxis = list(title = "Average Annual Salary (in U.S. dollars)"))  
      } else if (input$viz_3inputid == "Blood Pressure") {
        my_plot3 <- plot_ly(data = health_df, x = ~A_MEAN, y = ~Blood.Pressure, type = 'scatter', 
                            marker = list(color = '#EF553B')) %>%
          layout(title = paste("Blood Pressure"),
                 xaxis = list(title = "Average Annual Salary (in U.S. dollars)"),      
                 yaxis = list(title = "Blood Pressure"))
      } else if (input$viz_3inputid == "Daily Steps") {
        my_plot3 <- plot_ly(data = health_df, x = ~Daily.Steps, y = ~A_MEAN, type = 'scatter', 
                            marker = list(color = '#32B')) %>%
          layout(title = paste("Daily Steps"),
                 xaxis = list(title = "Daily Steps"),
                 yaxis = list(title = "Average Annual Salary (in U.S. dollars)"))
      } else if (input$viz_3inputid == "Physical Activity Level") {
        my_plot3 <- plot_ly(data = health_df, x = ~Physical.Activity.Level, y = ~A_MEAN, type = 'scatter', 
                            marker = list(color = '#53BBBC')) %>%
          layout(title = paste("Physical Activity Level"),
                 xaxis = list(title = "Physical Activity Level"),
                 yaxis = list(title = "Average Annual Salary (in U.S. dollars)"))
      }
    } else if (input$viz_3inputid2== "Average Hourly Wage"){
      if (input$viz_3inputid == "Heart Rate") {
        my_plot3 <- plot_ly(data = health_df, x = ~Heart.Rate, y = ~H_MEAN, type = 'scatter',
                            marker = list(color = '#345')) %>%
          layout(title = paste("Heart Rate"),
                 xaxis = list(title = "Heart Rate"),
                 yaxis = list(title = "Average Hourly Wage (in U.S. Dollars)"))  
      } else if (input$viz_3inputid == "Blood Pressure") {
        my_plot3 <- plot_ly(data = health_df, x = ~H_MEAN, y = ~Blood.Pressure, type = 'scatter', 
                            marker = list(color = '#EF553B')) %>%
          layout(title = paste("Blood Pressure"),
                 xaxis = list(title = "Average Hourly Wage (in U.S. Dollars)"),      
                 yaxis = list(title = "Blood Pressure"))
      } else if (input$viz_3inputid == "Daily Steps") {
        my_plot3 <- plot_ly(data = health_df, x = ~Daily.Steps, y = ~H_MEAN, type = 'scatter', 
                            marker = list(color = '#32B')) %>%
          layout(title = paste("Daily Steps"),
                 xaxis = list(title = "Daily Steps"),
                 yaxis = list(title = "Average Hourly Wage (in U.S. Dollars)"))
      } else if (input$viz_3inputid == "Physical Activity Level") {
        my_plot3 <- plot_ly(data = health_df, x = ~Physical.Activity.Level, y = ~H_MEAN, type = 'scatter', 
                            marker = list(color = '#53BBBC')) %>%
          layout(title = paste("Physical Activity Level"),
                 xaxis = list(title = "Physical Activity Level"),
                 yaxis = list(title = "Average Hourly Wage (in U.S. Dollars)"))
      }
    }
    
    
    
    
  })
  
  
  
  
  # Interactive Page 4 - Salary and Health
  
  output$sal_phy_plot2 <- renderPlotly({
    
    health_df <- combined_df %>% arrange(A_MEAN)
    
    if(input$viz_4inputid2 == "Average Annual Salary") {
      if (input$viz_4inputid == "Body Mass Index") {
        my_plot4 <- plot_ly(data = health_df, x = ~BMI.Category, y = ~A_MEAN, type = 'bar',
                            marker = list(color = ~A_MEAN, colorscale = 'Greens', reversescale = TRUE)) %>%
          layout(title = paste("Body Mass Index (BMI) and Average Annual Salary"),
                 xaxis = list(title = "BMI"),
                 yaxis = list(title = "Average Annual Salary", showticklabels = FALSE))  
      } else if (input$viz_4inputid == "Has Sleep Disorder") {
        my_plot4 <- plot_ly(data = health_df, x = ~Sleep.Disorder, y = ~A_MEAN, type = 'bar',
                            marker = list(color = ~A_MEAN, colorscale = 'Blues', reversescale = TRUE)) %>%
          layout(title = paste("Sleep Disorder and Average Annual Salary"),
                 xaxis = list(title = "Sleep Disorder"),
                 yaxis = list(title = "Average Annual Salary", showticklabels = FALSE))  
      }
    } else if (input$viz_4inputid2 == "Average Hourly Wage") {
      if (input$viz_4inputid == "Body Mass Index") {
        my_plot4 <- plot_ly(data = health_df, x = ~BMI.Category, y = ~H_MEAN, type = 'bar',
                            marker = list(color = ~A_MEAN, colorscale = 'Greens', reversescale = TRUE)) %>%
          layout(title = paste("Body Mass Index (BMI) and Average Hourly Wage"),
                 xaxis = list(title = "BMI"),
                 yaxis = list(title = "Average Hourly Wage", showticklabels = FALSE))  
      } else if (input$viz_4inputid == "Has Sleep Disorder") {
        my_plot4 <- plot_ly(data = health_df, x = ~Sleep.Disorder, y = ~H_MEAN, type = 'bar',
                            marker = list(color = ~A_MEAN, colorscale = 'Blues', reversescale = TRUE)) %>%
          layout(title = paste("Sleep Disorder and Average Hourly Wage"),
                 xaxis = list(title = "Sleep Disorder"),
                 yaxis = list(title = "Average Hourly Wage", showticklabels = FALSE))  
      }
    }
    
    
  })
  
}
