output$plotPrivateConsumption <- renderPlotly({

  plot <- ggplot()
  
  plot <- gx_theme(ggplot(),
                   x_title = "Disposable Income",
                   y1_title = "Private Consumption") +
   # theme(axis.text = element_blank()) +
    scale_y_continuous(breaks = c(0), labels = c("0"), limits = c(0, 100), expand = c(0.01, 0)) +
    scale_x_continuous(breaks = c(0), labels = c("0"), limits = c(0, 100), expand = c(0.01, 0))
  
  if(input$step2privateConsumption){
    
    plot <- plot +
      geom_abline(slope = 0.5, intercept = 25)
    
  }
  
  if(input$step1privateConsumption){
    
    plot <- plot + 
      geom_point(aes(x = 0, y = 25), color = "red", size = 2) 
    
    plot <- ggplotly(plot) %>%
      layout(
        annotations = list(
          list(
            x = 0,
            y = 25,
            text = "c<sub>0</sub>",  # Math expression in plotly format
            showarrow = TRUE,
            arrowhead = 2
          )
        )
      )
    
  }
  
  if(input$step2privateConsumption){
    
    plot <- ggplotly(plot)  %>%
      layout(
        annotations = list(
          list(
            x = 50,
            y = 50,
            text = "slope = c<sub>1</sub>",  # Math expression in plotly format
            showarrow = TRUE,
            arrowhead = 2
          )
        )
      )
    
  }
  
  plot
  
})

output$textStep1ConsumptionPlot <- renderText({
  
  if(input$step1privateConsumption){
    withMathJax()
    "\\(c_0\\) represents the essential level of consumption required for survival.
    Even in the absence of income, consumption cannot be zero because basic needs must be 
    met. Therefore, \\(c_0>0\\) signifies that there is a minimum amount of consumption 
    necessary to sustain life, regardless of income."
    
  }
  
})

output$textStep2ConsumptionPlot <- renderText({

  if(input$step2privateConsumption){
    withMathJax()
    "\\(c_1\\) represents the share of income spent on consumption. For simplicity we
    assume that this rate is constant. We will also assume that \\(0 < c_1 < 1\\). This
    seems to be a reasonable assumption even though for some individuals this may not be
    true."

  }

})
