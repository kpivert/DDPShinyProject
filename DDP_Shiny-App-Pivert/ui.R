##################################################

## DDP: Kurtis Pivert Shiny App Project 

##################################################

library(shiny)
data("cars")

# Define UI for application that illustrates the utility of simple linear models

shinyUI(fluidPage(
        
        # Application title
        titlePanel("DDP: Building A Simple Linear Regression Model"),
        
        
        # Layout the tabs 
        mainPanel(
                tabsetPanel(type = "tabs",
                           
                            ## Tab 1: Documentation 
                            tabPanel("Documentation", br(),
                                     h2("Kurtis Pivert: Developing Data Products Final Project"),
                                     h3("Documentation for This Project"),
                                     h3("Motivation and Instructions"),
                                     p("'Regression models are the workhorse of data science.
                                       They are the most well described, practical
                                       and theoretically understood models in statistics.'--Brian Caffo"),
                                     p("This very basic interactive app to demonstrate
                                       how to build and use a simple linear model.
                                       The three sections are:"),
                                     p("1. Build simple linear model and assess intercept, 
                                       slope, and residuals"), 
                                     p("2. Quick demonstration of how data can influence the model"), 
                                     p("3. Use a simple linear model for prediction"),
                                     h3("To begin, select the Simple Linear Model tab.")),
                            
                            ## Tab 2: Simple Linear Model 
                            tabPanel("Simple Linear Model",
                                     br(), 
                                     h1("Building a Simple Linear Model Using Random Variables"),
                                     p("Use the slider to select the number of random variable that will be
                                       generated as independent (x axis) and dependent (y axis) 
                                       variables for a simple linear model."),
                                     p("The Shiny Server fits a model using the formula
                                       y ~ x and generates the plots, statistics, and residual plots below."), 
                                     p("Note that as the number of data points change, the intercept, slope,
                                       and residual plots change as well."),
                                     sliderInput("numberPoints", "Number of Random X and Y Data Points", 
                                                 10, 500, value = 100), 
                                     p("Here's a plot of your data:"),
                                     plotOutput("plot1"),
                                     h3("The intercept for your model is:"), 
                                     textOutput("intOut"),
                                     h3("The slope for your model is:"),
                                     textOutput("slopeOut"),
                                     h2("Residual plots for your model"),
                                     plotOutput("plot2")),
                            
                            ## Tab 3: Effects of Data on Linear Model
                            tabPanel("Effects of Data", br(),
                                     h1("Choosing Data Affects Linear Model"), 
                                     p("This simple graph shows how choosing data can affect
                                       the outcome of the linear model."),
                                     p("When the full data set is selected, you see there is a 
                                       positive relationship between speed and stopping distance, 
                                       as expected. But if you select the right set 
                                       of points, a negative relationship is calculated, which
                                       is invalid."),
                                     p("The red line is the regression line from a linear
                                       model using the data you selected from the
                                       cars data set."),
                                     h3("Select some data with your mouse"),
                                     plotOutput("plot3", brush = brushOpts(id = "brush1")),
                                     h3("The intercept for your model is:"), 
                                     textOutput("intOut1"),
                                     h3("The slope for your model is:"),
                                     textOutput("slopeOut1")),
                            
                            ## Tab 4: Prediction
                            tabPanel("Prediction",br(),
                                     h1("Using a Simple Linear Model for Prediction"),
                                     p("Using the cars data set, this illustrates
                                       the utility of linear models to predict 
                                       outcomes based on new data"),
                                     p("Using a simple model of distance (y axis) ~
                                        speed (x axis), the predicted stopping distance
                                       is indicated by the red dot."),
                                     sliderInput("speed", "Speed in MPH", min = 0, 
                                        max = 25, value = 10),
                                     plotOutput("plot4"),
                                     h3("Your predicted stopping distance in feet is:"),
                                     textOutput("stoppingDist")
                                     )
                            )
                )
)
)

