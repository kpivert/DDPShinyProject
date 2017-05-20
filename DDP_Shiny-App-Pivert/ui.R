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
                                     h1("Kurtis Pivert: Developing Data Products Final Project"),
                                     h3("Documentation for this project"),
                                     p("This very basic interactive app to demonstrate
                                       how to build and use a simple linear model."),
                                     p("Follow along starting wtih the first tab.")),
                            
                            ## Tab 2: Simple Linear Model 
                            tabPanel("Simple Linear Model",
                                     br(), 
                                     h1("Choose A Number of Random Variables"),
                                     p("Choose the number of random variables in the slider to
                                       use as an independent variable for a simple linear model."),
                                     sliderInput("numberPoints", "Number of Random X and Y Data Points", 
                                                 10, 500, value = 100), 
                                     p("Here's a plot of your data:"),
                                     plotOutput("plot1"),
                                     h3("The intercept for your model is:"), 
                                     textOutput("intOut"),
                                     h3("The slope for your model is:"),
                                     textOutput("slopeOut"),
                                     h2("Now let's review the residual plots for your model"),
                                     plotOutput("plot2")),
                            
                            ## Tab 3: Effects of Data on Linear Model
                            tabPanel("Effects of Data", br(),
                                     h1("Choosing Data Affects Linear Model"), 
                                     p("This simple graph shows how choosing data can affect
                                       the outcome of the linear model."),
                                     p("When the full data set is selected, you see there is a 
                                       positive relationship between speed and stopping distance, 
                                       as expected. But if you select the right set 
                                       of points, a negative relationship is calculated."),
                                     h2("Select some data with your mouse"),
                                     plotOutput("plot3", brush = brushOpts(id = "brush1")),
                                     h3("The intercept for your model is:"), 
                                     textOutput("intOut1"),
                                     h3("The slope for your model is:"),
                                     textOutput("slopeOut1"))
                            
                            )
                )
)
)

