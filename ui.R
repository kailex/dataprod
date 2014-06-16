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
    h3("mpg ~ wt + qsec + am"),
    plotOutput("plots")
  )
))