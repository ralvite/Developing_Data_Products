# ---- app6-server ----

library(shiny)
library(ggplot2)

function(input, output) {
    
    # Fit Models
    model1 <- lm(price ~ carat, data = diamonds)
    # model2 <- lm(price ~ ., data = diamonds)
    
    model1pred <- reactive({
        caratInput <- input$sliderCarat
        predict(model1, newdata = data.frame(carat = caratInput))
    })
    
    
    output$plot1 <- renderPlot({
        caratInput <- input$sliderCarat
        
        plot(diamonds$carat, diamonds$price, xlab = "diamond carat weight", 
             ylab = "diamond price", bty = "n", pch = 16,
             xlim = c(0.20, 2.5), ylim = c(300, 20000))
            abline(model1, col = "red", lwd = 2)
            points(caratInput, model1pred(), col = "red", pch = 16, cex = 2)
        legend(25, 250, c("Model 1 Prediction"), pch = 16, 
               col = c("red"), bty = "n", cex = 1.2)
        
    })
    
    output$pred1 <- renderText({
        model1pred()
    })
    
    
    output$summary <- renderPrint({
        summary(model1)
    })
    
    output$table <- DT::renderDataTable({
        DT::datatable(diamonds)
    })
    
    
    
    
}







