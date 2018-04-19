#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Brook Trout Developmental Index"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      checkboxGroupInput("river" ,
                         "River" , 
                         c("burying groud" , "four mile" , "pond" , "roaring" , "sanderson" , "west whately" ) , 
                         "pond"),
      selectInput("year" , 
                  "Year" , 
                  c("2013" , "2014" , "2015" , "2016" , "2018") , "2016"),
      
       sliderInput("burying ground",
                   "Buring Ground",
                   min = 240,
                   max = 365,
                   value = 300) ,
      sliderInput("four mile",
                  "Four Mile",
                  min = 240,
                  max = 365,
                  value = 300) ,
      sliderInput("pond",
                  "Pond",
                  min = 240,
                  max = 365,
                  value = 300) ,
      sliderInput("roaring",
                  "Roaring",
                  min = 240,
                  max = 365,
                  value = 300) , 
      sliderInput("sanderson",
                  "Sanderson",
                  min = 240,
                  max = 365,
                  value = 300) ,
      sliderInput("west whately",
                  "West Whately",
                  min = 240,
                  max = 365,
                  value = 300)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("plot1A" , height = "700px")
    )
  )
))
