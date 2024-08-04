###############################################
#
# Server logic for islm tab
#
###############################################

output$islmPlot <- renderPlot({
  
  plot <- ggplot() +
    geom_abline(slope = 1) +
    geom_abline(intercept = input$c_0_islm, 
                slope = input$c_1_islm) +
    scale_y_continuous(limits = c(0, 2000), expand = c(0,0)) +
    scale_x_continuous(limits = c(0, 2000), expand = c(0,0))
  
  gx_theme(plot)

})

output$islmEquilibrium <- renderText({paste("The equilibrium is", input$c_0_islm/(1-input$c_1_islm))})

# input validation
# iv <- InputValidator$new
# iv$add_rule("c_1_islm", sv_between(0.01, 0.99))
# iv$enable