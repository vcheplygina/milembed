

library(ggplot2)
library(R.matlab)
library(RColorBrewer)


myPalette <- colorRampPalette(rev(brewer.pal(11, "Spectral")))

source('global.R', local=TRUE)

shinyServer(function(input, output, session) {
  
  
  
  # Combine the selected variables into a new data frame
  
  getPlotData <- reactive({
    
    
    whichData <- match(input$dataset,n)
    whichClasf <-match(input$classifier, clasfNames)
    
    selectedD <- D[whichData,whichData,whichClasf]
    selectedD.mean <- apply(selectedD, c(1,2), mean)  #average over selected classifiers (in Matlab I would do mean(selectedD,3) )
    
    
    fit <- cmdscale(selectedD.mean,eig=TRUE, k=2) # k is the number of dim
    
    plotx <- c(fit$points[,1])
    ploty <- c(fit$points[,2])

    
    whichAuc <- match(input$auc, clasfNames)
    auc <- perf[whichData,whichAuc]
    
      
        
    data.frame(plotx, ploty, row.names=dataNames$names[whichData],auc)

  })
  

   output$plot1 <- renderPlot({

     plotdata <- getPlotData()
     

     
     np <- nearPoints(plotdata, input$plot_click, xvar = "plotx", yvar = "ploty", maxpoints=1)
     

       
       
     
     
     str(np)
     
     ggplot(plotdata, aes(plotx,ploty))    + geom_point(aes(colour = auc), size=5)     +   scale_colour_gradientn(colours = myPalette(100)) 
     
     #+ geom_text(aes(label=ifelse(selected>0,as.character(plotx),'')))
    
     
     #
     
     
     
     
     
   })
   
   
   
})

