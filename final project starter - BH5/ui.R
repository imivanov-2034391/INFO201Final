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
   p("In today’s society, where work plays a central role in our daily lives, 
   understanding the impact of specific occupation on individuals’ physical health 
   is a crucial topic. The background of one’s job can severely influence well-being, 
   including the risk factors to necessary lifestyle adjustments. Past studies on work 
   and health have focused on physical safety and mitigating occupational hazards. 
   Although these concerns still remain, this investigation aims to expand the discussion 
   to include deeper factors such as, mental health, stress, and sleep health. 
   By examining and comparing the data collected, we not only enhance our understanding 
   of individual health outcomes but also inform a broader societal discussion on work-life 
   balance, workplace wellness, and public health policies. Our discussion will dive into 
   the compelling questions aimed to investigate the correlation between one’s occupation 
   and physical health and to recognize the quantified pattern that emerges from this exploration."),
   p("1. How do physical activity levels vary among different occupations?"),
   p("2. What occupations among the dataset have the best/worst (average) quality of sleep?"),
   p("3. Does a higher salary in high-stress jobs equate to poorer physical health?"),
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


ui <- navbarPage("INFO 201 Final Project",
  overview_tab,
  viz_1_tab,
  viz_2_tab,
  viz_3_tab,
  conclusion_tab
)