###############################################
#
# Server logic for islm tab
#
###############################################

output$goodsMarketPlot <- renderPlot({
  
  plot <- ggplot() +
    geom_abline(slope = 1) +
    geom_abline(intercept = input$c_0_islm, 
                slope = input$c_1_islm) +
    scale_y_continuous(limits = c(0, 2000), expand = c(0,0)) +
    scale_x_continuous(limits = c(0, 2000), expand = c(0,50))
  
  gx_theme(plot)

})

output$interestRatePlot <- renderPlot({
  
  plot <- ggplot() +
    geom_hline(yintercept = input$i_islm) +
    scale_y_continuous(limits = c(-0.05, 0.5), expand = c(0,0)) +
    scale_x_continuous(limits = c(0, 2000), expand = c(0,50))
  
  gx_theme(plot)
  
})

output$islmPlot <- renderPlot({
  
  plot <- ggplot() +
    geom_hline(yintercept = input$i_islm) +
    scale_y_continuous(limits = c(-0.05, 0.5), expand = c(0,0)) +
    scale_x_continuous(limits = c(0, 2000), expand = c(0,50))
  
  gx_theme(plot)
  
})

output$islmEquilibrium <- renderText({paste("The equilibrium is", input$c_0_islm/(1-input$c_1_islm))})

# input validation
iv <- InputValidator$new()
iv$add_rule("c_0_islm", sv_between(50, 500))
iv$add_rule("c_1_islm", sv_between(0.01, 0.99))
iv$add_rule("I_0_islm", sv_between(0, 500))
iv$add_rule("I_1_islm", sv_between(0.01, 0.99))
iv$add_rule("I_2_islm", sv_between(0, 10000))


iv$add_rule("G_islm", sv_between(0, 500))
iv$add_rule("T_islm", sv_between(0, 500))
iv$add_rule("i_islm", sv_between(-0.01, 0.5))
iv$enable()