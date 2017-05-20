##################################################

## DDP: Kurtis Pivert Shiny App Project 

##################################################


# Define Server for application that illustrates the utility of simple linear models

library(shiny)
data("cars")


shinyServer(function(input, output) {
        
        ## Create A Simple Linear Model Based on Number of Data Points Inputed by User
        model <- reactive({
                set.seed(123)
                x <- rnorm(input$numberPoints)
                y <- rnorm(input$numberPoints, sd = sample(1:10, 
                        size = input$numberPoints, replace = TRUE))
                lm(y ~ x)
        })
        
        ## Output Plot Showing Regression Line
        output$plot1 <- renderPlot({
                set.seed(123)
                x <- rnorm(input$numberPoints)
                y <- rnorm(input$numberPoints)
                plot(x, y, bty = "n", pch = 16, 
                     xlab = "Independent Variables", ylab = "Dependent Variables")
                abline(model(), col = "blue", lwd = 3)
        })
        
        ## Output Intercept
        output$intOut <- renderText({
                model()[[1]][1] 
        })
        
        ## Output Slope
        output$slopeOut <- renderText({
                model()[[1]][2] 
        })
        
        ## Output Plot of Residuals and Model Metrics
        output$plot2 <- renderPlot({
                par(mfrow= c(2,2))
                plot(model(), las = 1)
        })
        
        ## Create Interactive Model Based on Brushed Data Points
        model1 <- reactive({
                brushCarsData <- brushedPoints(cars, input$brush1,
                        xvar = "speed", yvar = "dist")
                
                                if(nrow(brushCarsData) < 2){
                                        return(NULL)
                                }
                
                lm(dist ~ speed, data = brushCarsData)
        })
        
        ## Render Regression Line Based on Brushed Data Points
        output$plot3 <- renderPlot({
                
                plot(cars$speed, cars$dist, xlab = "Speed in MPH", 
                     ylab = "Distance in Feet", cex = 2, pch = 16, bty="l", 
                     col = "gray")
                abline(model1(), col = "red", lwd = 3)
        })
        
        ## Output Model Intercept
        output$intOut1 <- renderText({
                model1()[[1]][1] 
        })
        
        ## Output Model Slope
        output$slopeOut1 <- renderText({
                model1()[[1]][2] 
                
        })
})