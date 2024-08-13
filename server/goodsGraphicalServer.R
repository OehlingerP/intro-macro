output$plotGoodsMarketEq <- renderPlotly({
  
  plot_default <- plot <- gx_theme(ggplot(),
                   x_title = "Income (Y)",
                   y1_title = "Demand (Z), Production (Y)") +
    theme(axis.text = element_blank(),
          axis.text.x = element_blank()) +
    scale_y_continuous(limits = c(0, 100), expand = c(0, 0)) +
    scale_x_continuous(limits = c(0, 100), expand = c(0, 0))
  
  if(input$degree45Line){
    
    plot <- plot_default +
      geom_abline(slope = 1, intercept = 0)+
      geom_curve(aes(x = 10, y = 0, xend = 5, yend = 5),
                 curvature = 0.3) +
      annotate("text", x = 12.5, y = 3.5, label = "45°", size = 4)
    
    plot <- ggplotly(plot) %>%
      layout(
        annotations = list(
          list(
            x = 75,
            y = 75,
            text = "Slope = 1",  # Math expression in plotly format
            showarrow = TRUE,
            arrowhead = 2,
            ax = -30,  # Arrow line start x-offset relative to the annotation
            ay = -30   # Arrow line start y-offset relative to the annotation
          )
        )
      )
    
  }
  
  if(input$zzLine){
    
    plot <- plot_default +
      geom_abline(slope = 1, intercept = 0)+
      geom_abline(slope = 0.4, intercept = 30, color = gx_colors()[2]) +
      geom_point(aes(x = 50, y = 50), size = 2)

    
    plot <- ggplotly(plot) %>%
      layout(
        annotations = list(
          list(
            x = 75,
            y = 75,
            text = "Production Y<br>Slope = 1",  # Math expression in plotly format
            showarrow = TRUE,
            arrowhead = 2,
            ax = -40,  # Arrow line start x-offset relative to the annotation
            ay = -40   # Arrow line start y-offset relative to the annotation
          ),
          list(
            x = 50,
            y = 50,
            text = "Equilibrium:<br>Y = Z",  # Math expression in plotly format
            showarrow = TRUE,
            arrowhead = 2,
            ax = 40,  # Arrow line start x-offset relative to the annotation
            ay = 40   # Arrow line start y-offset relative to the annotation
          ),
          list(
              x = 30,
              y = 42,
              text = "Demand ZZ<br>Slope = c<sub>1</sub>", 
              showarrow = TRUE,
              arrowhead = 2,
              ax = -40,  # Arrow line start x-offset relative to the annotation
              ay = -40   # Arrow line start y-offset relative to the annotation
        )
      )
    )
    
  }
  
  plot
  
})

output$textStep1GoodsMarketEqPlot <- renderText({
  
  if(input$degree45Line){
    
    "We draw production as a function of income which is simply a straight line
    with slope 1."
    
  }
  
})

output$textStep2GoodsMarketEqPlot <- renderText({
  
  if(input$zzLine){
    
    "We can split our aggregate demand function \\(Z = c_0+I+G-c_1T + c_1Y\\)
    into two parts: \\(c_0+I+G-c_1T\\) refers to autonomous consumption, i.e. 
    consumption that does not depend on income. This reflects the intercept. The
    second part \\(c_1Y\\) describes how demand changes with income and, thus 
    describes the slope of the function."
    
  }
  
})

