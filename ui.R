library(shiny)

# Define UI for dataset viewer application
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Analysis Of Diamonds Dataset"),
  
  # Sidebar with controls to provides:
  # 1. a selector for the diamond propery such as cut, clarity and color
  # 2. Based on the selection of the property, the second selector box will change to list unique values for that property
  # 3. Once the property value is chosen, the right side main panel will load a chart and table with some sample
  # data. The plot will be the average prices grouped by one of the unselected property with chosen property value.  
  sidebarPanel(
    selectInput("columnType", "Choose a Property:", 
                choices = c("cut", "color", "clarity"), selected = "cut"),
    selectedCol <- textOutput("cType"),
    selectInput("columnValue", "Choose a Property Value:", 
                choices = c(" ")),
    sliderInput("numOfRecs",
                "Choose Number of Rows to View:",
                min = 1,
                max = 30,
                value = 10)
  
  ),
  
  
  # Show the summary chart of the dataset and an HTML table with
  mainPanel(
    plotOutput("summaryChart"), 
    tableOutput("view")
  )
))