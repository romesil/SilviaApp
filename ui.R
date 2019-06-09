# user-interface definition of a Shiny web application
# Find out more about building applications with Shiny here:
#    http://shiny.rstudio.com/

# https://www.dataquest.io/blog/statistical-learning-for-predictive-modeling-r/

# How do they measure tree volume?
# The trees data set is included in base R's datasets package, and it's going to help us answer this question. 
  
# Define UI for application that draws a Scatter Plot of a Prediction
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Tree Volume Prediction"),
  
  # Sidebar with options selectors 
  sidebarLayout(
    sidebarPanel(
      helpText("This application predicts Tree Volume based on Tree Girth and Height, using 'trees' R Dataset."),
      h3(helpText("Select Girth and Height:")),
      # Inputs for prediction: ----
      sliderInput("Girth", label = h4("Girth"), value = 10, min=8.3, max=20.6),
      sliderInput("Height", label = h4("Height"), value = 70, min=63, max=87)
                  
    ),
    
    # Show a plot with diamonds and regression line
    mainPanel(
      plotOutput("distPlot"),
      h4("Predicted Tree Volume is:"),
      h3(textOutput("result"))
    )
  )
))

# NOTES, experiments done to build final result:
  
#library(shiny)
#library(GGally)
#library(scatterplot3d)

# data(trees)
#head(trees)

# This dataset consists of 31 observations of 3 numeric variables describing black cherry trees:
# The trunk girth (in)
# height (ft)
# volume (ft3)

# These metrics are useful information for foresters and scientists who study the ecology of trees. It's fairly simple to measure tree heigh and girth using basic forestry tools, but measuring tree volume is a lot harder. 
# It would be useful to be able to accurately predict tree volume from height and/or girth.

# # use the ggpairs() function from the GGally package to create a plot matrix to see how the variables relate to one another.
# ggpairs(data=trees, columns=1:3, title="trees data")
# 
# # Observing at results, the correlation between Girth and Volume is closer to 1, so it's a good variable
# # linear model relating tree volume to girth. R makes this straightforward with the base function lm():
# 
# fit_1 <- lm(Volume ~ Girth, data = trees)
# summary(fit_1)
# 
# # Let's have a look at our model fitted to our data for width and volume. We can do this by using ggplot() to fit a linear model to a scatter plot of our data:
#   ggplot(data = trees, aes(x = Girth, y = Volume)) +
#   geom_point() +
#   stat_smooth(method = "lm", col = "dodgerblue3") +
#   theme(panel.background = element_rect(fill = "white"),
#         axis.line.x=element_line(),
#         axis.line.y=element_line()) +
#   ggtitle("Linear Model Fitted to Data")
#   
# # Using our simple linear model to make predictions:
# 
# predict(fit_1, data.frame(Girth = 18.2))
# # Our volume prediction is 55.2 ft3.
# 
# # multiple linear regression adding more predictors:
#  # Tree Volume ??? Intercept + Slope1(Tree Girth) + Slope2(Tree Height) + Error
# fit_2 <- lm(Volume ~ Girth + Height, data = trees)
# summary(fit_2)
# 
# # Since we have two predictor variables in this model, we need a third dimension to visualize it. We can create a nice 3d scatter plot using the package scatterplot3d:
#   
# ## make a grid using the vectors  :
# Girth <- seq(9,21, by=0.5) ## make a girth vector
# Height <- seq(60,90, by=0.5) ## make a height vector
# pred_grid <- expand.grid(Girth = Girth, Height = Height)
# 
# # make predictions for volume based on the predictor variable grid:
#   
#   pred_grid$Volume2 <-predict(fit_2, new = pred_grid)
#   
# # make a scatterplot:
#   
#   fit_2_sp <- scatterplot3d(pred_grid$Girth, pred_grid$Height, pred_grid$Volume2, angle = 60, color = "dodgerblue", pch = 1, ylab = "Hight (ft)", xlab = "Girth (in)", zlab = "Volume (ft3)" )
# 
# # overlay our actual observations to see how well they fit:
#   fit_2_sp$points3d(trees$Girth, trees$Height, trees$Volume, pch=16)
#   
# # predicting volume of the tree:
#   
#   predict(fit_2, data.frame(Girth = 18.2, Height = 72))
#  # we get a predicted volume of 52.13 ft3. 

#   TO USE FIT 3: - SILVIA
# fit_3 <- lm(Volume ~ Girth * Height, data = trees)
# #summary(fit_3)
# 
# Girth <- seq(9,21, by=0.5)
# Height <- seq(60,90, by=0.5)
# pred_grid <- expand.grid(Girth = Girth, Height = Height)
# 
# pred_grid$Volume3 <-predict(fit_3, new = pred_grid)
# 
# fit_3_sp <- scatterplot3d(pred_grid$Girth, pred_grid$Height, pred_grid$Volume3, angle = 60, color = "dodgerblue", pch = 1, ylab = "Hight (ft)", xlab = "Girth (in)", zlab = "Volume (ft3)")
# fit_3_sp$points3d(trees$Girth, trees$Height, trees$Volume, pch=16)
# 
# predict(fit_3, data.frame(Girth = 18.2, Height = 72))

# Our predicted value using this third model is 45.89, the closest yet to our true value of 46.2 ft3
