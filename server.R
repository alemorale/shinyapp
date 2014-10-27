# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

data(mtcars)
lm1 <- lm(mpg ~ wt + cyl + hp, data=mtcars)

mpgPredicted <- function(weight,cylinders,horsepower){
    predict(lm1,newdata=data.frame(wt=weight,cyl=cylinders,hp=horsepower))  
} 


shinyServer(
    
    function(input, output) {
        
        output$inputValue1 <- renderPrint({input$weight})
        output$inputValue2 <- renderPrint({input$cylinders})
        output$inputValue3 <- renderPrint({input$horsepower})
        output$prediction <- renderPrint({mpgPredicted(input$weight,input$cylinders,input$horsepower)})
        
        output$distPlot <- renderPlot({
    
        # generate bins based on input$bins from ui.R
        x    <- mtcars$mpg#faithful[, 2] 
        y <- mpgPredicted(input$weight,input$cylinders,input$horsepower)
        
        bins <- seq(min(x,y), max(x), length.out = 11)
    
        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white', xlab="miles per gallon",
             main="Common fuel consumption distribution")        
        lines(c(y,y),c(0,8),col='red',lwd=4)
        legend("topright","your car",lty = 1,col="red",lwd=4)
        
        })
  
})
