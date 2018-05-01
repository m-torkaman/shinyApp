
library(shiny)
library(ggplot2)
library(datasets)
data(mtcars)


varCols1 <- c(2,8:11)
varCols2 <- c(1,3:7)

shinyServer(function(input, output, session) {
    
    
    output$xaxisControl <- renderUI({
        
        xaxistemp <- c(names(mtcars[,-c(which(names(mtcars)==input$select1), varCols1)]))
        
        selectInput("select2", "X axis", xaxistemp) 
        
    })
    
    output$sizeControl <- renderUI({
        sizetemp <- c(names(mtcars[,-c(which(names(mtcars)==input$facet1), varCols2)]))
        selectInput("size", "size variable", sizetemp) 
        
    })
    
    
    
    output$plot <- renderPlot({
        y_axis  <- input$select1
        x_axis <- input$select2
        facet <- input$facet1
        size1 <- input$size
        colour1 <- input$color1
        
        gg <- ggplot(mtcars, 
               aes(x=mtcars[,c(x_axis)],y=mtcars[,c(y_axis)],  
                   colour = mtcars[,c(colour1)]))+
            geom_point(size=mtcars[,c(size1)])+
            facet_grid(.~as.factor(mtcars[,c(facet)])) +
            labs(x = x_axis, y = y_axis,  
                 colour=colour1,  
                 title = paste("Plot based on ", "X axis: ", x_axis, 
                                  ",Y axis: ", y_axis, ",facet: ", facet,
                                  ",colour: ",colour1, "& size: ", size1))
        if (input$smooth)
            gg+geom_smooth(method = "lm", colour="red")
        else gg

        
    })

})
