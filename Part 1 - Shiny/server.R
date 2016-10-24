#library(shiny)
#install.packages("UsingR")
library(UsingR)
n=ceiling(runif(1,min=7,max=30))
dat=data.frame(one=seq(1,15,by=14/(n-1)),
               two=sample(seq(4,40,by=36/n),size = n,replace = F),
               three=runif(n,min=1,max=20))
shinyServer(
    function(input, output) {
        output$newBubble <- renderPlot({
            symbols(dat$one,dat$two,circles = dat$three, ylim = c(0,65), xlab="", ylab="", xaxt='n',yaxt='n',col='lightblue',main='Random Circles')
            g <- input$g
            
            if(g>0)
            {
                gdat <- dat[c(1:g),]
                symbols(gdat$one,gdat$two,circles = gdat$three,add = T,bg=5)
                er <- n-g
                if(er<0)
                {
                    text(2.5, 62.5, paste("Woops! You've guessed too high!"))
                }
                else if(er>0 & er<n)
                {
                    text(3, 62.5, paste("Nope! There are more circles than that!"))
                }
                else
                {
                    text(3.5, 62.5, paste("Well done, that's right! There are", g,"circles!"))
                }
            }
        })
    })
