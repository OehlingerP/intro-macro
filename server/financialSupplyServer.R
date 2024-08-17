output$plotCbControl <- renderPlotly({

  plot <- ggplot()
  
  plot <- plot_default <- gx_theme(ggplot(),
                   x_title = "Quantity of Money M",
                   y1_title = "Interest Rate i") +
   # theme(axis.text = element_blank()) +
    scale_y_continuous(breaks = c(0), labels = c("0"), limits = c(0, 100), expand = c(0.01, 0)) +
    scale_x_continuous(breaks = c(0), labels = c("0"), limits = c(0, 100), expand = c(0.01, 0)) +
    geom_abline(slope = -5, intercept = 200, color = gx_colors()[2])
  
  if(input$cbControlSelector == "Interest Rate Control"){
    
    plot <- plot_default +
      geom_abline(slope = -5, intercept = 200, color = gx_colors()[4]) +
      geom_hline(yintercept = 25, color = gx_colors()[2]) +
      geom_point(aes(x = 35, y = 25))
    
    plot <- ggplotly(plot) %>%
      layout(
        annotations = list(
          list(
            x = 32,
            y = 50,
            text = "M<sup>d</sup>",  # Math expression in plotly format
            showarrow = FALSE,
            color =  gx_colors()[2],
            ax = 30,  
            ay = -30,
            font = list(size = 14, color = gx_colors()[2]) 
          ),
          list(
            x = 35,
            y = 25,
            text = "Equilibrium",  # Math expression in plotly format
            showarrow = TRUE,
            color =  gx_colors()[2],
            ax = 40,  
            ay = -40,
            font = list(size = 14, color = gx_colors()[2]) 
          )
        )
      )
    
  }

  
  if(input$cbControlSelector == "Money Supply Control"){
    
    plot <- plot_default +
      geom_abline(slope = -5, intercept = 200, color = gx_colors()[4]) +
      geom_vline(xintercept = 35, color = gx_colors()[2]) +
      geom_point(aes(x = 35, y = 25))
    
    plot <- ggplotly(plot) %>%
      layout(
        annotations = list(
          list(
            x = 32,
            y = 50,
            text = "M<sup>d</sup>",  # Math expression in plotly format
            showarrow = FALSE,
            color =  gx_colors()[2],
            ax = 30,  
            ay = -30,
            font = list(size = 14, color = gx_colors()[2]) 
          ),
          list(
            x = 35,
            y = 25,
            text = "Equilibrium",  # Math expression in plotly format
            showarrow = TRUE,
            color =  gx_colors()[2],
            ax = 40,  
            ay = -40,
            font = list(size = 14, color = gx_colors()[2]) 
          ),
          list(
            x = 37,
            y = 75,
            text = "M<sup>S</sup>",  # Math expression in plotly format
            showarrow = FALSE,
            color =  gx_colors()[2],
            ax = 30,  
            ay = -30,
            font = list(size = 14, color = gx_colors()[2]) 
          )
        )
      )
    
  }
  
  plot
  
})

output$textStep1CbControlPlot <- renderText({
  
  if(input$cbControlSelector == "Interest Rate Control"){
    
    "The central bank directly affects interest rates by moving the horizontal line up or down."
    
  }
  
})

output$textStep2CbControlPlot <- renderText({

  if(input$cbControlSelector == "Money Supply Control"){

    "The central bank influences interest rates by adjusting the money supply, 
    which shifts the vertical line left or right to reach the desired interest rates."

  }

})
