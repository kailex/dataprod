library(shiny)
library(datasets)
data(mtcars)

shinyUI(pageWithSidebar(
  headerPanel("Miles per gallon prediction"),
  sidebarPanel(
    sliderInput("wt", "Weight (lb/1000):", value=mean(mtcars$wt), min=floor(min(mtcars$wt)), max=ceiling(max(mtcars$wt)), step = 0.001),
    sliderInput("qsec", "1/4 mile time:", value=mean(mtcars$qsec), min=floor(min(mtcars$qsec)), max=ceiling(max(mtcars$qsec)), step = 0.01),
    radioButtons("am", "Transmission:", c("Automatic"=0, "Manual"=1))
  ),
  mainPanel(
    h5("
       This simple application allows to calculate miles per gallon for a particular car.
       To do this we need to input a weight of car and 1/4 mile time using sliders. 
       Also we may choose a type of a transmission with radio button. 
       All input elements are situated on the left side of a page. 
       On the right side of the page there are two plots indicating dependency between MPG,
       weight, 1/4 mile time and type of transmission.
     
       We use a linear model which was built w.r.t. the AIC score:"),
    h4("mpg ~ wt + qsec + am"),
    plotOutput("plots")
  )
))
