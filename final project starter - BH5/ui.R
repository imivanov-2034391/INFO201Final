# INFO 201 Final Project -- Final Deliverable
# Section BH
# Group member: Sera Lee, Lele Zhang, Ivette Ivanov, Sohyun Han

library(ggplot2)
library(plotly)
library(dplyr)
library(bslib)
library(shiny)

# Color theme (you can change)
my_theme <- bs_theme(bg = "white", #background
                     fg = "black", #foreground color
                     primary = "#FFBE98", # primary color
)

## OVERVIEW TAB INFO

overview_tab <- tabPanel("Introduction",
   h1("TITLE"),
   p("Group Members: Sohyun Han, Sera Lee, Ivette Immanov, Lele Zhang"),
   h4("INFO 201 BH-5 Final Project"),
   p("March 6th, 2024"),
   h3("Introduction"),
   p("context"),
   p("question1"),
   p("question2"),
   p("question3"),
   h3("Related Work"),
   p("context"),
   h3("Datasets Used"),
   p("context"),
   h3("Related Work"),
   p("context"),
   h3("Implications"),
   p("context"),
   h3("Limitations/Challenges"),
   p("context"),
   
   
)

## VIZ 1 TAB INFO

viz_1_sidebar <- sidebarPanel(
  h2("Options for graph"),
  #TODO: Put inputs for modifying graph here
)

viz_1_main_panel <- mainPanel(
  h2("Interactive 1 Title"),
  # plotlyOutput(outputId = "your_viz_1_output_id")
)

viz_1_tab <- tabPanel("Interactive 1 tab title",
  sidebarLayout(
    viz_1_sidebar,
    viz_1_main_panel
  )
)

## VIZ 2 TAB INFO

viz_2_sidebar <- sidebarPanel(
  h2("Options for graph"),
  #TODO: Put inputs for modifying graph here
)

viz_2_main_panel <- mainPanel(
  h2("Interactive 2 Title"),
  # plotlyOutput(outputId = "your_viz_1_output_id")
)

viz_2_tab <- tabPanel("Interactive 2 tab title",
  sidebarLayout(
    viz_2_sidebar,
    viz_2_main_panel
  )
)

## VIZ 3 TAB INFO

viz_3_sidebar <- sidebarPanel(
  h2("Options for graph"),
  #TODO: Put inputs for modifying graph here
)

viz_3_main_panel <- mainPanel(
  h2("Interactive 3 Title"),
  # plotlyOutput(outputId = "your_viz_1_output_id")
)

viz_3_tab <- tabPanel("Interactive 3 tab title",
  sidebarLayout(
    viz_3_sidebar,
    viz_3_main_panel
  )
)

## CONCLUSIONS TAB INFO

conclusion_tab <- tabPanel("Conclusion",
 h1("Conclusion"),
 h3("Takeaway 1"),
 p("context"),
 h3("Takeaway 2"),
 p("context"),
 h3("Takeaway 3"),
 p("context"),
 h3("Important Insights"),
 p("context"),
 h3("Broader Implications"),
 p("context")
)



ui <- navbarPage("Project Title",
  overview_tab,
  viz_1_tab,
  viz_2_tab,
  viz_3_tab,
  conclusion_tab
)