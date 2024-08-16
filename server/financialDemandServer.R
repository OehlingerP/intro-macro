output$plotMoneyDemand <- renderPlotly({

  plot <- ggplot()
  
  plot <- plot_default <- gx_theme(ggplot(),
                   x_title = "Quantity of Money M",
                   y1_title = "Interest Rate i") +
   # theme(axis.text = element_blank()) +
    scale_y_continuous(breaks = c(0), labels = c("0"), limits = c(0, 100), expand = c(0.01, 0)) +
    scale_x_continuous(breaks = c(0), labels = c("0"), limits = c(0, 100), expand = c(0.01, 0))
  
  if(input$step1moneyDemand){
    
    plot <- plot_default +
      geom_abline(slope = -5, intercept = 200, color = gx_colors()[2])
    
    plot <- ggplotly(plot) %>%
      layout(
        annotations = list(
          list(
            x = 32,
            y = 50,
            text = "M<sup>d</sup>",  # Math expression in plotly format
            showarrow = FALSE,
            color =  gx_colors()[2],
            ax = -30,  
            ay = 30,
            font = list(size = 14, color = gx_colors()[2]) 
          )
        )
      )
    
  }

  
  if(input$step2moneyDemand){
    
    plot <- plot_default +
      geom_abline(slope = -5, intercept = 200, color = gx_colors()[4]) +
      geom_abline(slope = -5, intercept = 300, color = gx_colors()[2])
    
    plot <- ggplotly(plot)  %>%
      layout(
        annotations = list(
          list(
            x = 32,
            y = 50,
            text = "M<sup>d</sup>",  # Math expression in plotly format
            showarrow = FALSE,
            color =  gx_colors()[2],
            ax = -30,  
            ay = 30,
            font = list(size = 14, color = gx_colors()[4]) 
          ),
          list(
            x = 53,
            y = 50,
            text = "M<sup>d'</sup>",  # Math expression in plotly format
            showarrow = FALSE,
            color =  gx_colors()[2],
            ax = -30,  
            ay = 30,
            font = list(size = 14, color = gx_colors()[4]) 
          ),
          list(
            x = 44, y = 75,
            xref = 'x', yref = 'y',
            ax = 25, ay = 75,
            axref = 'x', ayref = 'y',
            showarrow = TRUE,
            arrowhead = 2
          ),
          list(
            x = 54, y = 25,
            xref = 'x', yref = 'y',
            ax = 35, ay = 25,
            axref = 'x', ayref = 'y',
            showarrow = TRUE,
            arrowhead = 2
          )
        )
      )
    
  }
  
  if(input$step3moneyDemand){
    
    plot <- plot_default +
      geom_abline(slope = -3, intercept = 120, color = gx_colors()[2])
    
    plot <- ggplotly(plot) %>%
      layout(
        annotations = list(
          list(
            x = 25.75,
            y = 50,
            text = "M<sup>d</sup>",  # Math expression in plotly format
            showarrow = FALSE,
            color =  gx_colors()[2],
            ax = -30,  
            ay = 30,
            font = list(size = 14, color = gx_colors()[2]) 
          )
        )
      )
    
  }
  
  plot
  
})

output$textStep1moneyDemandPlot <- renderText({
  
  if(input$step1moneyDemand){
    
    "There is an inverse relationship between money demand (\\(M^d\\)) and the interest rate
    (\\(i\\)). When nominal income (\\(PY\\)) remains constant, an increase in the interest rate 
    results in a decrease in money demand. This occurs because higher interest rates reduce 
    the preference for holding liquid cash, making interest-bearing securities more attractive 
    in comparison."
    
  }
  
})

output$textStep2moneyDemandPlot <- renderText({

  if(input$step2moneyDemand){

    "Given a fixed interest rate, an increase in nominal income leads to a rise in the demand for 
    money, causing the money demand curve to shift to the right."

  }

})

output$textStep3moneyDemandPlot <- renderText({
  
  if(input$step3moneyDemand){
    
    " If our preference for liquidity decreases, meaning we are less concerned about holding cash,
    the money demand curve becomes flatter. In other words, the curve rotates inward along the 
    interest rate axis. This is because with a lower preference for liquidity, people are more 
    responsive to changes in interest rates when deciding how much money to hold."
    
  }
  
})

# update checkboxes 2 and 3
observe({
  if (input$step2moneyDemand) {
    updateCheckboxInput(session, "step3moneyDemand", value = FALSE)
  }
  if (input$step3moneyDemand) {
    updateCheckboxInput(session, "step2moneyDemand", value = FALSE)
  }
})
