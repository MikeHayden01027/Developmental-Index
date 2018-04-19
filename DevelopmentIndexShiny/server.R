#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
bg <- reactive({
    
    tempModD <- tempMod %>% filter(spawnYear == input$year )
    
  bg <-   tempModD %>% dplyr::filter( dayOfYear > input$`burying ground` | dayOfYear < 150, river == "burying ground" , site == "above webber road" ) %>%  
                       dplyr::group_by(river) %>%
                       dplyr::mutate(percentDevelop = cumsum(rate) ,
                                     detectionDate = as.Date(detectionDate))
  
  fm <-  tempModD %>% dplyr::filter( dayOfYear > input$`four mile` | dayOfYear < 150, river == "four mile" ) %>%  
                      dplyr::group_by(river) %>%
                      dplyr::mutate(percentDevelop = cumsum(rate) ,
                                    detectionDate = as.Date(detectionDate))
    
   p <-  tempModD %>% dplyr::filter( dayOfYear > input$`pond` | dayOfYear < 150, river == "pond" ) %>%  
                      dplyr::group_by(river) %>%
                      dplyr::mutate(percentDevelop = cumsum(rate) ,
                                    detectionDate = as.Date(detectionDate))
   
   r <-  tempModD %>% dplyr::filter( dayOfYear > input$`roaring` | dayOfYear < 150, river == "roaring" ) %>%  
                      dplyr::group_by(river) %>%
                      dplyr::mutate(percentDevelop = cumsum(rate) ,
                                    detectionDate = as.Date(detectionDate))
   
   s <-  tempModD %>% dplyr::filter( dayOfYear > input$sanderson | dayOfYear < 150, river == "sanderson" , site == "sanderson" ) %>%  
                      dplyr::group_by(river) %>%
                      dplyr::mutate(percentDevelop = cumsum(rate) ,
                                    detectionDate = as.Date(detectionDate))
   
   ww <-  tempModD %>% dplyr::filter( dayOfYear > input$`west whately` | dayOfYear < 150, river == "west whately" ) %>%  
                       dplyr::group_by(river) %>%
                       dplyr::mutate(percentDevelop = cumsum(rate) ,
                                     detectionDate = as.Date(detectionDate))
   
   bind_rows(bg , fm , p , r , s , ww) %>% filter(river %in% input$river)
   
  })
  
  
  output$plot1A <-  renderPlot({  
   bg() %>% ggplot(aes(x = detectionDate , y = percentDevelop , colour = river)) + 
             geom_hline(yintercept=100 , color="red") +
             geom_hline(yintercept=73 , color="blue") +
             geom_line(size = 2) +
             ylim(0, 120) +
             theme_bw()
    
    })
    
  })
  

