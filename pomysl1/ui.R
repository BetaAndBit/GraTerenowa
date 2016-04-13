
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  #titlePanel("Old Faithful Geyser Data"),
  sidebarLayout(
   sidebarPanel(
      sliderInput(
      	"r",
      	"Promień mniejszego okręgu:",
      	min = 0.1,
        max = 1.5,
        value = 0.5,
      	step = 0.01
      	)
    ),
    mainPanel(
      plotOutput("circlePlot", width = 600, height = 600)
    )
  )
))
