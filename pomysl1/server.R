
wspolrzedne <- 
	data.frame(
		x = 1.5,
		y = 1.5
	)

library(shiny)
library(ggplot2)
library(ggthemes)
library(geomnet)
shinyServer(function(input, output) {

	
	wspolrzedne2 <- reactive({
		wspolrzedne[1,2] <- input$r
		wspolrzedne
	})
	
  output$circlePlot <- renderPlot({
	
  		plot <- 
  			ggplot() +
	  		theme_igray() +
	  		scale_colour_tableau() +
	  		scale_fill_tableau() +
	  		theme(legend.position = "none") +
  			xlab("cm") +
  			ylab("cm") +
  			scale_x_continuous(breaks = seq(0,3,0.5), limits = c(0,3), expand = c(0, 0)) + 
  			scale_y_continuous(breaks = seq(0,3,0.5), limits = c(0,3), expand = c(0, 0)) +
  			annotate("path",
					   x=1.5+1.5*cos(seq(0,2*pi,length.out=100)),
					   y=1.5+1.5*sin(seq(0,2*pi,length.out=100))) +
  			annotate("text", x = 2, y = 2, label = "Powierzchnia \n7.068 cm^2", size = 10) +
  		  annotate("path", col = "blue",
					   x=1.5+input$r*cos(seq(0,2*pi,length.out=100)),
					   y=input$r+input$r*sin(seq(0,2*pi,length.out=100))) +
  			annotate("text", x = 1, y = 2, 
  							 label = paste0("Powierzchnia \n", round(pi*(input$r)^2, 3) ," cm^2"),
  							 size = 10, col = "blue") +
  			annotate("path", x = c(1.5, 3), y = c(1.5, 1.5)) +
  			annotate("text", label = "Promień: 1.5 cm", x = 2, y = 1.6, size = 8) +
  			annotate("path", x = c(1.5, 1.5), y = c(0, input$r), col = "blue") +
  			annotate("text", label = paste0("Promień: \n", input$r),
  							 x = 1.7, y = 0.5, size = 6, col = "blue") 
    
  		plot
  })

})
