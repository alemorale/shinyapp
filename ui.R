# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Fuel Consumption Predictor"),
  
  # Sidebar with slider and numeric inputs
  sidebarPanel(
      h5("Car attributes"),
      sliderInput('weight','Weight (lb/1000):',min=1.5,max=5.5,value=3),
      numericInput('cylinders','Cylinders (number of cylinders)',4,min=4,max=8,step=2),
      sliderInput('horsepower','Gross horsepower (hp):',min=50,max=350,value=120),
      br(),
      h5("Documentation"),
      p("The Fuel Consumption predictor takes as inputs the weight, number of 
        cylinders and horsepower of your car and using state-of-the-art statistical
        modeling techniques, predicts the miles per gallon that your car is expected to consume.
        In case there is big discrepancy with your car I suggest you call your car dealer! ;) "),
      br(),
      helpText('Disclaimer: the results of the predictor are provided as is and with all faults.
               I dont make any representations or warranties of any kind concerning inaccuracies.
               This product comes with absolute no warranty.')
      
  ),
  
   
  # Show the result of the prediction and a histogram as a reference
  mainPanel(
      h3('Explanation'),
      p('The state-of-the-art statistical modeling technique applied is linear regression.'),
      p('The model is the following'),
      code('predictor <- lm(mpg ~ wt + cyl + hp,data=mtcars)',align='center'),
      p('Furthermore, the predictor uses the dataset mtcars to make such accurate predictions.'),         
      h3('Result of the mileage predictor'),
      h4('You entered'),
      verbatimTextOutput("inputValue1"),
      verbatimTextOutput("inputValue2"),
      verbatimTextOutput("inputValue3"),
      br(),
      h3('Your predicted fuel consumption'),
      verbatimTextOutput("prediction"),
      br(),
      h4('As a reference, here is how your car fares with respect to others:'),
      plotOutput("distPlot")
  )
))
