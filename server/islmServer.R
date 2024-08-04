###############################################
#
# Server logic for islm tab
#
###############################################

output$plot <- renderPlot({
  plot(cars, type=input$plotType)
})