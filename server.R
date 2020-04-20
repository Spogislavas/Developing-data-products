library(shiny)
data(mtcars)
mt <- as.data.frame(mtcars)
bestfit <- lm(mpg ~ wt + qsec + am, data = mt)

shinyServer(function(input, output) {
        mtPrediction <- reactive({
                amInput <- input$am
                wtInput <- input$wt
                qsecInput <- input$qsec
                predict(bestfit, newdata = data.frame(
                        am = as.integer(amInput),
                        wt = wtInput,
                        qsec = qsecInput
                ))
        })
        output$mpgPrediction <- renderText({
                mtPrediction()
  })
  
})
