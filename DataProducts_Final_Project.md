Developing Data Products   Shiny Application Pitch
========================================================
author: 
date: 6/2/2017
autosize: true

Project Requirements
========================================================

* Develop a shiny application to show case the ability to build data products. 
* The application needs to be interactive with some input fields and or buttons that perform some actions on the server and display the result back to the user.
* The server is also required to do some sort of calculations on a chosen set of data and display the results.
* Create a pitch presentation about the shyny application.

Data Used
========================================================

The diamonds data set available as part of ggplot2 R library is used in this application.This dataset has 53940 observations with 10 variables.


```r
library(ggplot2)
head(diamonds, n=4)
```

```
# A tibble: 4 × 10
  carat     cut color clarity depth table price     x     y     z
  <dbl>   <ord> <ord>   <ord> <dbl> <dbl> <int> <dbl> <dbl> <dbl>
1  0.23   Ideal     E     SI2  61.5    55   326  3.95  3.98  2.43
2  0.21 Premium     E     SI1  59.8    61   326  3.89  3.84  2.31
3  0.23    Good     E     VS1  56.9    65   327  4.05  4.07  2.31
4  0.29 Premium     I     VS2  62.4    58   334  4.20  4.23  2.63
```

Analysis of Diamond Dataset
========================================================
This shiny application is a simple web application to analyze the variation of average diamond price with its properties. The side bar panel has the input controls and the main panel shows the results.
* Choose a Property - This is the diamond property type selector. Make your choice of property type here. 
* Choose a Property Value - Based on the selection of the property type above, this selection box will be populated with unique property values. Make your selection of the value here.
* Choose Number of Rows to View - Move the slider to select the number of rows to view.
* The main panel on the top right will show a plot of average prices grouped by another property type for the chosen property value. The main panel on the bottom right will show a table of diamonds data for the chosen property value. 
* Change slider to increase or decrease the number of rows to view.

Links to Course Work
========================================================

[Shiny App](https://ckuloor.shinyapps.io/shinyproject/) - The Shiny Application

[Source Code](https://github.com/ckuloor/dataproducts) - The source code repository for this project.

[Pitch Presentation](http://rpubs.com/ckuloor/DPShiny) - This presentation
