rm(list = ls())
#setwd("C:/Users/J Miller/Desktop/Data Science Course/Data Products/Data Products Week 4 (Project)/Part 1 - Shiny")
#install.packages("shiny")
library(shiny)
shinyUI(pageWithSidebar(
    headerPanel("Guess-the-number-of-circles Plot"),
    sidebarPanel(
        sliderInput('g', 'Guess how many circles are here',value = 0, min = 0, max = 30),
        submitButton('Go')
    ),
    mainPanel(
        plotOutput('newBubble')
    )
))
