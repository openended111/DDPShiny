
library(shiny)


shinyUI(fluidPage(
  

  titlePanel("The average combined (state + local) tax rate by state"),
  

  sidebarLayout(
    sidebarPanel(
       h1("Move the slider to control the range of tax rates"),
       sliderInput("cbr",
                   "Combined State and Local Tax Rate:",
                   min = 0,
                   max = 0.1,
                   value = c(0.02, 0.09)),

     submitButton("Submit")
    ),
    
    mainPanel(
       h2("Histogram of the average combined tax rate by state"),
       plotOutput("Histogram")
  )
)
)
)