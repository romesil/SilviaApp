Tree Volume Prediction
========================================================
author: Silvia Romero 
date:  09 June 2019
autosize: false

About
========================================================

Overview of the Tree Volume prediction Shiny application. 
The application can be found [**here**] 
(https://romesil.shinyapps.io/Tree_Volume_Prediction/)

The app builds a linear regression model to predict the Tree Volume based on 2 predictors:
- Girth
- Height

App shows a 3D Scatterplot and returns the Tree Volume predicted.
Idea inspired from: https://www.dataquest.io/blog/statistical-learning-for-predictive-modeling-r/


Data used
========================================================

The data used for this application is the `trees` R dataset.
It consists of 31 observations of 3 numeric variables describing black cherry trees:
- The trunk girth (in)
- height (ft)
- volume (ft3)

These metrics are useful information for foresters and scientists who study the ecology of trees.

Multiple linear regression with 2 predictors:
- Tree Volume = Intercept + Slope1(Tree Girth) + Slope2(Tree Height) + Slope3(Tree Girth x Tree Height)+ Error


Shiny files
========================================================

The application is built with the Shiny package (http://shiny.rstudio.com), consisting of 2 files:
- `ui.R`
- `server.R`

Both files can be found here: [**here**] (my github repo link copied here)


Application functionality
========================================================

Since we have two predictor variables in this model, we need a third dimension to visualize it.

The app creates a 3D scatter plot using the package scatterplot3d: 
- First, we make a grid of values for our predictor variables, then the expand.grid() function creates a data frame from all combinations of the factor variables.
- Next, we make predictions for volume based on the predictor variable grid (with variables selected by the user app).
- The 3d scatterplot is made from the predictor grid and the predicted volumes.

The app also shows the predicted tree volume.

