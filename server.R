
library(shiny)
#Loda & Process the data
data.tax <- as.data.frame(read.table(file="state tax.txt",sep=',',header=TRUE,na.strings=c(" ","NA","-")))
avg.combined.tax <- data.tax[,c("State","Combined_Rate")]
avg.combined.tax$Combined_Rate <- as.numeric(sub("%","",avg.combined.tax$Combined_Rate))/100
avg.combined.tax[51,2] <- 0.0575
statelist <- sort(unique(avg.combined.tax$State))

shinyServer(function(input, output) {
  
  
    subdata <- reactive({
      
      minY <- input$cbr[1]
      maxY <- input$cbr[2]
      subset(avg.combined.tax,Combined_Rate >= minY & Combined_Rate <= maxY)
    })
    
    output$Histogram <- renderPlot({
    
    hist(subdata()$Combined_Rate, col = 'darkgray', border = 'white')
    
    })
  
  })
