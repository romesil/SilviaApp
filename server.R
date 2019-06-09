
library(shiny)
library(GGally)
library(scatterplot3d)

data(trees) 

# Define server logic required to draw a plot:

shinyServer(function(input, output) {
  output$distPlot <- renderPlot({
    # select trees depending of user input
    trees <- trees %>% filter(trees$Girth>=input$Girth | trees$Height>=input$Height)
    # build linear regression model
    fit_3 <- lm(Volume ~ Girth * Height, data = trees)
    
    Girth <- input$Girth
    Height <- input$Height
    pred_grid <- expand.grid(Girth = input$Girth, Height = input$Height)
    
    pred_grid$Volume3 <-predict(fit_3, new = pred_grid)

    fit_3_sp <- scatterplot3d(pred_grid$Girth, pred_grid$Height, pred_grid$Volume3, angle = 60, color = "dodgerblue", pch = 1, ylab = "Height (ft)", xlab = "Girth (in)", zlab = "Volume (ft3)")
    fit_3_sp$points3d(trees$Girth, trees$Height, trees$Volume, pch=16)
    
  })
  output$result <- renderText({
    fit_3 <- lm(Volume ~ Girth * Height, data = trees)
    pred <- predict(fit_3, data.frame(Girth = input$Girth, Height = input$Height))
    res <- paste(round(pred, digits = 2), "ft3")
    res
  })
  
})

