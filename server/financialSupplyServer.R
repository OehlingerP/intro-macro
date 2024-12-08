output$plotCbControl <- renderPlotly({

  plot <- ggplot()
  
  plot <- plot_default <- gx_theme(ggplot(),
                   x_title = "Quantity of Money M",
                   y1_title = "Interest Rate i") +
   # theme(axis.text = element_blank()) +
    scale_y_continuous(breaks = c(0), labels = c("0"), limits = c(0, 100), expand = c(0.01, 0)) +
    scale_x_continuous(breaks = c(0), labels = c("0"), limits = c(0, 100), expand = c(0.01, 0)) +
    geom_abline(slope = -5, intercept = 200, color = gx_colors()[3])
  
  if(input$cbControlSelector == "Interest Rate Control"){
    
    plot <- plot_default +
      geom_abline(slope = -5, intercept = 200, color = gx_colors()[3]) +
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
            font = list(size = 12, color = gx_colors()[2]) 
          ),
          list(
            x = 35,
            y = 25,
            text = "Equilibrium",  # Math expression in plotly format
            showarrow = TRUE,
            color =  gx_colors()[2],
            ax = 40,  
            ay = -40,
            font = list(size = 12, color = gx_colors()[2]) 
          )
        )
      )
    
  }

  
  if(input$cbControlSelector == "Money Supply Control"){
    
    plot <- plot_default +
      geom_abline(slope = -5, intercept = 200, color = gx_colors()[3]) +
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
            font = list(size = 12, color = gx_colors()[2]) 
          ),
          list(
            x = 35,
            y = 25,
            text = "Equilibrium",  # Math expression in plotly format
            showarrow = TRUE,
            color =  gx_colors()[2],
            ax = 40,  
            ay = -40,
            font = list(size = 12, color = gx_colors()[2]) 
          ),
          list(
            x = 37,
            y = 75,
            text = "M<sup>S</sup>",  # Math expression in plotly format
            showarrow = FALSE,
            color =  gx_colors()[2],
            ax = 30,  
            ay = -30,
            font = list(size = 12, color = gx_colors()[2]) 
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

# Exercise expansive monetary policy
output$plotCbExpansive <- renderPlotly({
  
  slopeMd <- -3
  interMd <- 150
  iOld <- 50
  iNew <- 25
  
  oldEqX <- (iOld-interMd)/slopeMd
  newEqX <- (iNew-interMd)/slopeMd
  
  plot <- ggplot()
  
  plot <- plot_default <- gx_theme(ggplot(),
                                   x_title = "Quantity of Money M",
                                   y1_title = "Interest Rate i") +
    # theme(axis.text = element_blank()) +
    scale_y_continuous(breaks = c(0), labels = c("0"), limits = c(0, 100), expand = c(0.01, 0)) +
    scale_x_continuous(breaks = c(0), labels = c("0"), limits = c(0, 100), expand = c(0.01, 0)) +
    geom_abline(slope = slopeMd, intercept = interMd, color = gx_colors()[3])
  
  if(input$cbExpansiveSelector == "Interest Rate Control"){
    
    plot <- plot_default +
      geom_abline(slope = slopeMd, intercept = interMd, color = gx_colors()[3]) +
      geom_vline(xintercept = oldEqX, linetype = "dashed", color = "#cdced0") +
      geom_vline(xintercept = newEqX, linetype = "dashed", color = "#cdced0") +
      geom_point(aes(x = oldEqX, y = iOld), color = gx_colors()[3]) +
      geom_hline(yintercept = iOld, color = gx_colors()[3]) +
      geom_point(aes(x = newEqX, y = iNew), color = gx_colors()[2]) +
      geom_hline(yintercept = iNew, color = gx_colors()[2])
    
    plot <- ggplotly(plot) %>%
      layout(
        annotations = list(
          list(
            x = 27,
            y = 75,
            text = "M<sup>d</sup>",  # Math expression in plotly format
            showarrow = FALSE,
            ax = 30,  
            ay = -30,
            font = list(size = 12, color = gx_colors()[3])
          ),
          list(
            x = newEqX,
            y = iNew,
            text = "New Equilibrium",  # Math expression in plotly format
            showarrow = TRUE,
            color =  gx_colors()[2],
            ax = 40,  
            ay = -40,
            font = list(size = 12, color = gx_colors()[2]),
            arrowcolor = gx_colors()[2],
            bgcolor = "#fffaf5" 
          ),
          list(
            x = oldEqX,
            y = iOld,
            text = "Old Equilibrium",  # Math expression in plotly format
            showarrow = TRUE,
            color =  gx_colors()[2],
            ax = 40,  
            ay = -40,
            font = list(size = 12, color = gx_colors()[3]),
            arrowcolor = gx_colors()[3],
            bgcolor = "#fffaf5" 
          ),
          list(
            x = 75,
            y = 37.5,
            text = "Change in i<br>controlled by CB",  # Math expression in plotly format
            showarrow = FALSE,
            ax = 30,  
            ay = -30,
            font = list(size = 12, color = gx_colors()[2]),
            xanchor = "left"
          ),
          list(
            x = (newEqX - oldEqX)/2 + oldEqX,
            y = 16,
            text = "Change<br>in M",  # Math expression in plotly format
            showarrow = FALSE,
            ax = 30,  
            ay = -30,
            font = list(size = 12, color = gx_colors()[2])
          ),
          list(
            x = 15, y = 26,
            xref = 'x', yref = 'y',
            ax = 15, ay = 52,
            axref = 'x', ayref = 'y',
            showarrow = TRUE,
            arrowhead = 2,
            arrowcolor = gx_colors()[2]
          ),
          list(
            x = 75, y = 26,
            xref = 'x', yref = 'y',
            ax = 75, ay = 52,
            axref = 'x', ayref = 'y',
            showarrow = TRUE,
            arrowhead = 2,
            arrowcolor = gx_colors()[2]
          ),
          list(
            x = newEqX, y = 10,
            xref = 'x', yref = 'y',
            ax = oldEqX, ay = 10,
            axref = 'x', ayref = 'y',
            showarrow = TRUE,
            arrowhead = 2,
            arrowcolor = gx_colors()[2]
          )
        )
      )
    
  }
  
  if(input$cbExpansiveSelector == "Money Supply Control"){
    
    plot <- plot_default +
      geom_abline(slope = slopeMd, intercept = interMd, color = gx_colors()[3]) +
      geom_hline(yintercept = iOld, linetype = "dashed", color = "#cdced0") +
      geom_hline(yintercept = iNew, linetype = "dashed", color = "#cdced0") +
      geom_point(aes(x = oldEqX, y = iOld), color = gx_colors()[3]) +
      geom_vline(xintercept = oldEqX, color = gx_colors()[3]) +
      geom_point(aes(x = newEqX, y = iNew), color = gx_colors()[2]) +
      geom_vline(xintercept = newEqX, color = gx_colors()[2])
    
    plot <- ggplotly(plot) %>%
      layout(
        annotations = list(
          list(
            x = 27,
            y = 75,
            text = "M<sup>d</sup>",  # Math expression in plotly format
            showarrow = FALSE,
            ax = 30,  
            ay = -30,
            font = list(size = 12, color = gx_colors()[3])
          ),
          list(
            x = newEqX,
            y = iNew,
            text = "New Equilibrium",  # Math expression in plotly format
            showarrow = TRUE,
            color =  gx_colors()[2],
            ax = 60,  
            ay = 30,
            font = list(size = 12, color = gx_colors()[2]),
            arrowcolor = gx_colors()[2],
            bgcolor = "#fffaf5" 
          ),
          list(
            x = oldEqX,
            y = iOld,
            text = "Old Equilibrium",  # Math expression in plotly format
            showarrow = TRUE,
            color =  gx_colors()[2],
            ax = -60,  
            ay = 30,
            font = list(size = 12, color = gx_colors()[3]),
            arrowcolor = gx_colors()[3],
            bgcolor = "#fffaf5"
          ),
          list(
            x = 75,
            y = 37.5,
            text = "Change in i",  # Math expression in plotly format
            showarrow = FALSE,
            ax = 30,  
            ay = -30,
            font = list(size = 12, color = gx_colors()[2]),
            xanchor = "left"
          ),
          list(
            x = (newEqX - oldEqX)/2 + oldEqX,
            y = 82,
            text = "Change in M<sup>S</sup><br>controlled by CB",  # Math expression in plotly format
            showarrow = FALSE,
            ax = 30,  
            ay = -30,
            font = list(size = 12, color = gx_colors()[2]),
            bgcolor = "#fffaf5"
          ),
          list(
            x = 15, y = 26,
            xref = 'x', yref = 'y',
            ax = 15, ay = 52,
            axref = 'x', ayref = 'y',
            showarrow = TRUE,
            arrowhead = 2,
            arrowcolor = gx_colors()[2]
          ),
          list(
            x = 75, y = 26,
            xref = 'x', yref = 'y',
            ax = 75, ay = 52,
            axref = 'x', ayref = 'y',
            showarrow = TRUE,
            arrowhead = 2,
            arrowcolor = gx_colors()[2]
          ),
          list(
            x = newEqX, y = 75,
            xref = 'x', yref = 'y',
            ax = oldEqX, ay = 75,
            axref = 'x', ayref = 'y',
            showarrow = TRUE,
            arrowhead = 2,
            arrowcolor = gx_colors()[2]
          )
        )
      )
    
  }
  
  if(input$cbExpansiveSelector == "Interest Rate Control" & input$step3CbExpansive){
   
    plot <- plot_default +
      geom_abline(slope = slopeMd, intercept = interMd, color = gx_colors()[3]) +
      geom_vline(xintercept = oldEqX, linetype = "dashed", color = "#cdced0") +
      geom_vline(xintercept = oldEqX+25/3, linetype = "dashed", color = "#cdced0") +
      geom_point(aes(x = oldEqX, y = iOld), color = gx_colors()[3]) +
      geom_hline(yintercept = iOld, color = gx_colors()[3]) +
      geom_point(aes(x = oldEqX+25/3, y = iOld), color = gx_colors()[2]) +
      geom_abline(slope = slopeMd, intercept = interMd+25, color = gx_colors()[2])
    
    plot <- ggplotly(plot) %>%
      layout(
        annotations = list(
          list(
            x = 27,
            y = 75,
            text = "M<sup>d</sup>",  # Math expression in plotly format
            showarrow = FALSE,
            ax = 30,  
            ay = -30,
            font = list(size = 12, color = gx_colors()[3])
          ),
          list(
            x = 52.5,
            y = 25,
            text = "M<sup>d'</sup>",  # Math expression in plotly format
            showarrow = FALSE,
            bgcolor = "#fffaf5",
            ax = 30,  
            ay = -30,
            font = list(size = 12, color = gx_colors()[2])
          ),
          list(
            x = oldEqX+25/3,
            y = iOld,
            text = "New Equilibrium",  # Math expression in plotly format
            showarrow = TRUE,
            color =  gx_colors()[2],
            ax = 40,  
            ay = -40,
            font = list(size = 12, color = gx_colors()[2]),
            arrowcolor = gx_colors()[2],
            bgcolor = "#fffaf5" 
          ),
          list(
            x = oldEqX,
            y = iOld,
            text = "Old Equilibrium",  # Math expression in plotly format
            showarrow = TRUE,
            color =  gx_colors()[2],
            ax = -40,  
            ay = 40,
            font = list(size = 12, color = gx_colors()[3]),
            arrowcolor = gx_colors()[3],
            bgcolor = "#fffaf5" 
          ),
          list(
            x = 65,
            y = 52.5,
            text = "i controlled by CB and thus fixed",  # Math expression in plotly format
            showarrow = FALSE,
            ax = 30,  
            ay = -30,
            font = list(size = 12, color = gx_colors()[3]),
            xanchor = "left"
          ),
          list(
            x = (newEqX - oldEqX)/2 + oldEqX,
            y = 16,
            text = "Step 2: Endogenous<br>change in M",  # Math expression in plotly format
            showarrow = FALSE,
            bgcolor = "#fffaf5",
            ax = 30,  
            ay = -30,
            font = list(size = 12, color = gx_colors()[2])
          ),
          list(
            x = newEqX, y = 10,
            xref = 'x', yref = 'y',
            ax = oldEqX, ay = 10,
            axref = 'x', ayref = 'y',
            showarrow = TRUE,
            arrowhead = 2,
            arrowcolor = gx_colors()[2]
          ),
          list(
            x = 30, y = 82,
            xref = 'x', yref = 'y',
            ax = 23, ay = 82,
            axref = 'x', ayref = 'y',
            showarrow = TRUE,
            arrowhead = 2,
            arrowcolor = gx_colors()[2]
          ),
          list(
            x = 49, y = 25,
            xref = 'x', yref = 'y',
            ax = 42, ay = 25,
            axref = 'x', ayref = 'y',
            showarrow = TRUE,
            arrowhead = 2,
            arrowcolor = gx_colors()[2]
          ),
          list(
            x = 25,
            y = 92,
            text = "Step 1:<br>Increase in PY<br>shifts M<sup>d</sup> to M<sup>d'</sup>",  # Math expression in plotly format
            showarrow = FALSE,
            ax = 30,  
            ay = -30,
            font = list(size = 12, color = gx_colors()[2]),
            bgcolor = "#fffaf5"
          )
        )
      )
    
  }
  
  
  if(input$cbExpansiveSelector == "Money Supply Control" & input$step3CbExpansive){
    
    plot <- plot_default +
      geom_abline(slope = slopeMd, intercept = interMd, color = gx_colors()[3]) +
      geom_hline(yintercept = iOld, linetype = "dashed", color = "#cdced0") +
      geom_hline(yintercept = iOld +25, linetype = "dashed", color = "#cdced0") +
      geom_point(aes(x = oldEqX, y = iOld), color = gx_colors()[3]) +
      geom_vline(xintercept = oldEqX, color = gx_colors()[3]) +
      geom_point(aes(x = oldEqX, y = iOld +25), color = gx_colors()[2]) +
      geom_abline(slope = slopeMd, intercept = interMd+25, color = gx_colors()[2])
    
    plot <- ggplotly(plot) %>%
      layout(
        annotations = list(
          list(
            x = 27,
            y = 75,
            text = "M<sup>d</sup>",  # Math expression in plotly format
            showarrow = FALSE,
            bgcolor = "#fffaf5",
            ax = 30,  
            ay = -30,
            font = list(size = 12, color = gx_colors()[3])
          ),
          list(
            x = 30,
            y = 92,
            text = "M<sup>d'</sup>",  # Math expression in plotly format
            showarrow = FALSE,
            bgcolor = "#fffaf5",
            ax = 30,  
            ay = -30,
            font = list(size = 12, color = gx_colors()[2])
          ),
          list(
            x = oldEqX,
            y = iOld +25,
            text = "New Equilibrium",  # Math expression in plotly format
            showarrow = TRUE,
            color =  gx_colors()[2],
            ax = 60,  
            ay = 30,
            font = list(size = 12, color = gx_colors()[2]),
            arrowcolor = gx_colors()[2],
            bgcolor = "#fffaf5" 
          ),
          list(
            x = oldEqX,
            y = iOld,
            text = "Old Equilibrium",  # Math expression in plotly format
            showarrow = TRUE,
            color =  gx_colors()[2],
            ax = -60,  
            ay = 30,
            font = list(size = 12, color = gx_colors()[3]),
            arrowcolor = gx_colors()[3],
            bgcolor = "#fffaf5"
          ),
          list(
            x = 75,
            y = 62.5,
            text = "Step 2: Endogenous<br>change in i",  # Math expression in plotly format
            showarrow = FALSE,
            ax = 30,  
            ay = -30,
            font = list(size = 12, color = gx_colors()[2]),
            xanchor = "left"
          ),
          list(
            x = oldEqX+1,
            y = 90,
            text = "M<sup>S</sup><br>fixed",  # Math expression in plotly format
            showarrow = FALSE,
            ax = 30,  
            ay = -30,
            font = list(size = 12, color = gx_colors()[3]),
            bgcolor = "#fffaf5",
            xanchor = "left"
          ),
          list(
            x = 15, y = 75,
            xref = 'x', yref = 'y',
            ax = 15, ay = 49,
            axref = 'x', ayref = 'y',
            showarrow = TRUE,
            arrowhead = 2,
            arrowcolor = gx_colors()[2]
          ),
          list(
            x = 75, y = 75,
            xref = 'x', yref = 'y',
            ax = 75, ay = 49,
            axref = 'x', ayref = 'y',
            showarrow = TRUE,
            arrowhead = 2,
            arrowcolor = gx_colors()[2]
          ),
          list(
            x = 27, y = 90,
            xref = 'x', yref = 'y',
            ax = 20, ay = 90,
            axref = 'x', ayref = 'y',
            showarrow = TRUE,
            arrowhead = 2,
            arrowcolor = gx_colors()[2]
          ),
          list(
            x = 49, y = 25,
            xref = 'x', yref = 'y',
            ax = 42, ay = 25,
            axref = 'x', ayref = 'y',
            showarrow = TRUE,
            arrowhead = 2,
            arrowcolor = gx_colors()[2]
          ),
          list(
            x = 47,
            y = 16.5,
            text = "Step 1:<br>Increase in PY<br>shifts M<sup>d</sup> to M<sup>d'</sup>",  # Math expression in plotly format
            showarrow = FALSE,
            ax = 30,  
            ay = -30,
            font = list(size = 12, color = gx_colors()[2]),
            bgcolor = "#fffaf5"
          )
        )
      )
    
  }
  
  plot
  
})

output$textStep1CbExpansivePlot <- renderUI({
  
  if(input$cbExpansiveSelector == "Interest Rate Control"){
    
    HTML(
      "<b>Interest Rate Control</b>: When the central bank reduces interest rates, the 
    interest rate curve shifts downward, leading to an increase 
    in the equilibrium quantity of money in the economy. In a system where the 
    central bank targets interest rates, the money supply is determined endogenously."
    )

  }
  
})

output$textStep2CbExpansivePlot <- renderUI({
  
  if(input$cbExpansiveSelector == "Money Supply Control"){
    
    HTML(
      "<b>Money Supply Control</b>: When the central bank increases its money supply, the
    money supply curve shifts to the right, leading to a reduction in the 
    equilibrium interest rate. In a system where the 
    central bank controls money supply, the interest rate is determined endogenously."
    )
    
  }
  
})

output$textStep3CbExpansivePlot <- renderUI({
  
  if(input$step3CbExpansive & input$cbExpansiveSelector == "Money Supply Control"){
    withMathJax()
    HTML(
      "<b>Money Supply Control</b>: When nominal income (\\(PY\\)) increases, the demand for money rises, shifting 
    the money demand curve to the right (Step 1). With a constant 
    money supply (\\(M^S\\)), the equilibrium interest rate increases (Step 2)."
    )
    
    
  }
  
})

output$textStep4CbExpansivePlot <- renderUI({
  
  if(input$step3CbExpansive & input$cbExpansiveSelector == "Interest Rate Control"){
    withMathJax()
    HTML(
      "<strong>Interest Rate Control</strong>: When nominal income (\\(PY\\)) increases, the demand 
    for money rises, shifting the money demand curve to the right (Step 1). With  
    interest rate targeting the interest rate stays constant and the equilibrium 
    quantity of money in the economy adjusts. (Step 2).<br><i> Since the interst rate is the
    important factor in decision-making for firms and households, and because the shape of the 
    money demand curve is generally not known, central banks usually target the 
    interest rate instead of controlling money demand.</i>"
    )
    
    
  }
  
})
