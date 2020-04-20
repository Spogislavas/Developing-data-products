library(shiny)
shinyUI(fluidPage(
  titlePanel("MPG prediction for cars"),
  sidebarLayout(
    sidebarPanel(
        p("Please fill the specifications"),
        selectInput("am", "Transmission(0 = automatic, 1 = manual)", 
                    choices = mtcars$am),
        sliderInput("wt", "Weight (1000 lbs)", 
                    min = 1, max = 6, step = 0.5, value = 3),
        sliderInput("qsec", "1/4 mile time", 
                    min = 14, max = 23, step = 1, value = 17)
    ),
    mainPanel(
        h3("Your Car's Expected MPG is:"),
        h4(textOutput("mpgPrediction")),
        p("The prediction is based on a multiple linear regression from the mtcars data set.")
    )
  )
))
