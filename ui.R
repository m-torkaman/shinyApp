
library(shiny)
library(ggplot2)
library(datasets)
data(mtcars)

varCols1 <- c(2,8:11)

shinyUI(fluidPage(
    
    titlePanel("mtcars explorer"),    
    plotOutput('plot'),
    
    hr(),
    
    fluidRow(
        titlePanel( "To explore mtcars dataset select 
                    variables to see the related plot "),
        column(2,
               h5("1- Select the Y-Axis"),
               selectInput(inputId = "select1", label="Y axis", 
                           choices= names(mtcars[,-c(varCols1)])),
               
               h5("2- Select the X-axis"),
               uiOutput("xaxisControl")
        ),
        column(3, offset = 1, 
               h5("3- Select facet variable"),
               selectInput(inputId="facet1", label = "facet variable",
                           choices = names(mtcars[,c(varCols1)])),
               h5("4- Select variable that give size"),
               uiOutput("sizeControl")
               
               
        ),
        column(4, offset = 1,
               h5("5- Select variable of colour"),
               selectInput(inputId="color1", label = "colour variable",
                           choices = names(mtcars)),
               h5("6- Tick to add lm"),
               checkboxInput('smooth', 'Smooth')
        )
    ),
        fluidPage(
        h4("How this app works :"),
        
        h6("The plot is created basd on the data from mtcars dataset. You can
           change the plot by selecting different variables for X and Y Axis,
           facet variable, and point's size and colour. You can also add 
           a Linear Model smooth line to the plot."),
        h6("The app is designed in a way that when you decided which variable
           to use for the Y-axis, that variable will be removed from the list
           of variables available in X-axis. This is also true for facet and
           size variables."),
        h6("The plot's title shows what choices are made."),
        h6("Just change the variables to see the difference in the plot."),
        h6("mtcars is a data set with 11 variables and 32 observations. 
           The variables are:"),
        h5(	" mpg:	 Miles/(US) gallon "),
        h5(	" cyl:	 Number of cylinders"),
        h5(	" disp:	 Displacement (cu.in.)"),
        h5(	" hp:	 Gross horsepower"),
        h5(	" drat:	 Rear axle ratio"),
        h5(	" wt:	 Weight (1000 lbs)"),
        h5(	" qsec:	 1/4 mile time"),
        h5(	" vs:	 engine: V-shape/Straight"),
        h5(	" am:	 Transmission (0 = automatic, 1 = manual)"),
        h5(	" gear:	 Number of forward gears"),
        h5(	" carb:	 Number of carburetors")
    )
    
))

