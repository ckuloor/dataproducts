library(shiny)
library(ggplot2)
# Define server logic required to summarize and view the R diamonds data set comes the ggplot2 library
shinyServer(function(input, output, session) {
  
  #subTable
  columnTypeSelected <- reactive({
    selVal <- input$columnType
    if (selVal == 'cut') {
      unique(diamonds$cut)
    } else if (selVal == 'color') {
      unique(diamonds$color)
    } else {
      unique(diamonds$clarity)
    }
  })
  
  observe({
    updateSelectInput(session, "columnValue",
                      choices = columnTypeSelected(),selected = columnTypeSelected()[1]
    )
  })
  
  observe( {
    if (input$columnType == 'cut') {
      dataSubset <- subset(diamonds, diamonds$cut==input$columnValue)
      if (nrow(dataSubset) > 0) {
        output$summaryChart <- renderPlot({
          dt <- aggregate(dataSubset$price, by=list(dataSubset$color), FUN=mean)
          colnames(dt) <- c("color","price")
          plot(price ~ color, data=dt, type="n", main="Average Price ($) By Color",xlab="Color", ylab="Average Price")
        })
        output$view <- renderTable({
          head(dataSubset, n=input$numOfRecs)
        })
      }
    } else if (input$columnType == 'color') {
      dataSubset <- subset(diamonds, diamonds$color==input$columnValue)
      if (nrow(dataSubset) > 0) {
        output$summaryChart <- renderPlot({
          dt <- aggregate(dataSubset$price, by=list(dataSubset$clarity), FUN=mean)
          colnames(dt) <- c("clarity","price")
          plot(price ~ clarity, data=dt, type="n", main="Average Price ($) By Claity",xlab="Clarity", ylab="Average Price")
        })
        output$view <- renderTable({
          head(dataSubset,n=input$numOfRecs)
        })
      }
      
    } else if (input$columnType == 'clarity') {
      dataSubset <- subset(diamonds, diamonds$clarity==input$columnValue)
      if (nrow(dataSubset) > 0) {
        output$summaryChart <- renderPlot({
          dt <- aggregate(dataSubset$price, by=list(dataSubset$cut), FUN=mean)
          colnames(dt) <- c("cut","price")
          plot(price ~ cut, data=dt, type="n", main="Average Price ($) By Cut",xlab="Cut", ylab="Average Price")
        })
        output$view <- renderTable({
          head(dataSubset, n=input$numOfRecs)
        })
      }
    }
  })
  
})