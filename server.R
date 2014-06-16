library(shiny)
library(datasets)
library(lattice)

data(mtcars)
fit <- lm(mpg~wt+qsec+factor(am)-1, data=mtcars)

shinyServer(
  function(input, output) {

    output$plots <- renderPlot({
      mpg <- round(predict(fit, data.frame(wt=input$wt, 
                                           qsec=input$qsec, 
                                           am=factor(input$am)), interval="predict"), 2) 
      
      par(mfrow=c(3,1), cex=1.1)
      
      plot(mtcars$wt, mtcars$mpg, col=c("blue", "green"), ylim=c(0, 50), xlim=c(0,6),
           main=paste0("Predicted MPG is ", mpg[1]),
           xlab="Weight", ylab="MPG")
      lines(x=c(input$wt,input$wt), y=c(mpg[2], mpg[3]), lty = "dotted", col="red")
      points(input$wt, mpg[1], col="red", cex=2.5, pch=10)
      grid(col="lightgray", lty="dotted",  lwd=par("lwd"), equilogs=F)

      plot(mtcars$qsec, mtcars$mpg, col=c("blue", "green"), ylim=c(0, 50), xlim=c(13,24),
           xlab="1/4 mile time", ylab="MPG")
      lines(x=c(input$qsec,input$qsec), y=c(mpg[2], mpg[3]), lty = "dotted", col="red")
      points(input$qsec, mpg[1], col="red", cex=2.5, pch=10)
      grid(col="lightgray", lty="dotted",  lwd=par("lwd"), equilogs=T)

      plot.new()
      legend("topright", c("Automatic","Manual"), 
            title="Transmission",
            lty=c(1,1), lwd=c(3,3), col=c("blue", "green")) 
      
    }, height=1100, width=600)
  }
)
