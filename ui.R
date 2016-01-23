library(shiny)
library(ggplot2)
library(R.matlab)

source('global.R')

shinyUI(pageWithSidebar(
  headerPanel('MIL embedding'),
  sidebarPanel(
    
    
    
        
    fluidRow(
      column(width = 6, wellPanel(
        checkboxGroupInput("dataset", "Which datasets", choices = n, selected=1:length(n)) 
      )),
      column(width = 4, wellPanel(
        checkboxGroupInput("classifier", "Which classifiers", choices=clasfNames, selected=1:length(clasfNames)) 
      ))
    )

    
    
    
  
    
   
  ),
  mainPanel(
    
    
    selectInput('auc', "Which AUC to show", choices=clasfNames),
    
    
    
    plotOutput("plot1", hover = "plot_click")
    
    
    
  )
  
  
))