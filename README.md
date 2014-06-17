# A Shiny Application for Miles per Gallon Prediction
This simple application allows to calculate miles per gallon for a particular car. To do this we need to input a weight of the car and 1/4 mile time using sliders. Also we may choose a type of a transmission with a radio button. All input elements are situated on the left side of a page. On the right side of the page there are two plots indicating dependency between MPG, weight, 1/4 mile time and type of transmission.

We use a linear model which was built w.r.t. the AIC score:

```r
fit <- lm(mpg ~ wt + qsec + am - 1, data = mtcars)
```

