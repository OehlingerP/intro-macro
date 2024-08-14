output$plotGoodsMarketEq <- renderPlotly({
  
  plot_default <- plot <- gx_theme(ggplot(),
                   x_title = "Income (Y)",
                   y1_title = "Demand (Z), Production (Y)") +
    theme(axis.text = element_blank(),
          axis.text.x = element_blank()) +
    scale_y_continuous(limits = c(0, 100), expand = c(0, 0)) +
    scale_x_continuous(limits = c(0, 100), expand = c(0.015, 0))
  
  if(input$degree45Line){
    
    plot <- plot_default +
      geom_abline(slope = 1, intercept = 0)
    
    plot <- ggplotly(plot) %>%
      layout(
        xaxis = list(
          scaleanchor = "y",  # Anchor x-axis scaling to y-axis
          scaleratio = 1      # Ensure that the scaling is equal
        ),
        yaxis = list(
          scaleanchor = "x",  # Anchor y-axis scaling to x-axis
          scaleratio = 1      # Ensure that the scaling is equal
        ),
        annotations = list(
          list(
            x = 75,
            y = 75,
            text = "Slope = 1",  
            showarrow = TRUE,
            arrowhead = 2,
            ax = -30,  
            ay = -30,
            font = list(size = 12)   
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
        xaxis = list(
          scaleanchor = "y",  # Anchor x-axis scaling to y-axis
          scaleratio = 1      # Ensure that the scaling is equal
        ),
        yaxis = list(
          scaleanchor = "x",  # Anchor y-axis scaling to x-axis
          scaleratio = 1      # Ensure that the scaling is equal
        ),
        annotations = list(
          list(
            x = 75,
            y = 75,
            text = "Production Y<br>Slope = 1",  
            showarrow = TRUE,
            arrowhead = 2,
            ax = -40,  
            ay = -40,
            font = list(size = 12)   
          ),
          list(
            x = 50,
            y = 50,
            text = "Equilibrium:<br>Y = Z",  
            showarrow = TRUE,
            arrowhead = 2,
            ax = 40,  
            ay = 40,
            font = list(size = 12)   
          ),
          list(
              x = 30,
              y = 42,
              text = "Demand ZZ<br>Slope = c<sub>1</sub>", 
              showarrow = TRUE,
              arrowhead = 2,
              ax = -40,  
              ay = -40,
              font = list(size = 12)   
        ),
        list(
          x = 0, y = 1,
          xref = 'x', yref = 'y',
          ax = 0, ay = 29,
          axref = 'x', ayref = 'y',
          showarrow = TRUE,
          arrowhead = 2
        ),
        list(
          x = 0, y = 29,
          xref = 'x', yref = 'y',
          ax = 0, ay = 1,
          axref = 'x', ayref = 'y',
          showarrow = TRUE,
          arrowhead = 2
        ),
        list(
          x = 0, y = 15,
          xref = 'x', yref = 'y',
          text = "autonomous<br>consumption",
          showarrow = FALSE,
          xanchor = "left",
          yanchor = "middle",
          font = list(size = 12)
        )
      )
    )
    
  }
  
  if(input$goodsMarketGincrease){

    plot <- plot_default +
      geom_abline(slope = 1, intercept = 0)+
      geom_abline(slope = 0.4, intercept = 30, color = "#fba7a4") +
      geom_point(aes(x = 50, y = 50), size = 2) +
      geom_abline(slope = 0.4, intercept = 50, color = gx_colors()[2]) +
      geom_point(aes(x = 83.33, y = 83.33), size = 2, color = "red")
    
    plot <- ggplotly(plot) %>%
      layout(
        xaxis = list(
          scaleanchor = "y",  # Anchor x-axis scaling to y-axis
          scaleratio = 1      # Ensure that the scaling is equal
        ),
        yaxis = list(
          scaleanchor = "x",  # Anchor y-axis scaling to x-axis
          scaleratio = 1      # Ensure that the scaling is equal
        ),
        annotations = list(
          list(
            x = 50,
            y = 50,
            text = "Starting Point,<br>Old Equilibrium",  
            showarrow = TRUE,
            arrowhead = 2,
            ax = 40,  
            ay = 40,
            font = list(size = 12)   
          ),
          list(
            x = 83.33,
            y = 83.33,
            text = "New Equilibrium",  
            showarrow = TRUE,
            arrowhead = 2,
            ax = -40,  
            ay = -40,
            font = list(size = 12)   
          ),
          list(
            x = 80,
            y = 62,
            text = "Demand ZZ", 
            showarrow = TRUE,
            arrowhead = 2,
            ax = 40,  
            ay = 40,
            font = list(size = 12)   
          ),
          list(
            x = 30,
            y = 62,
            text = "New Demand<br>Curve, ZZ'", 
            showarrow = TRUE,
            arrowhead = 2,
            ax = -40,  
            ay = -40,
            font = list(size = 12)   
          ),
          list(
            x = 0, y = 31,
            xref = 'x', yref = 'y',
            ax = 0, ay = 49,
            axref = 'x', ayref = 'y',
            showarrow = TRUE,
            arrowhead = 2
          ),
          list(
            x = 0, y = 49,
            xref = 'x', yref = 'y',
            ax = 0, ay = 31,
            axref = 'x', ayref = 'y',
            showarrow = TRUE,
            arrowhead = 2
          ),
          list(
            x = 0, y = 40,
            xref = 'x', yref = 'y',
            text = "change in<br>government<br>spending",
            showarrow = FALSE,
            xanchor = "left",
            yanchor = "middle",
            font = list(size = 12, color = gx_colors()[2])
          ),
          list(
            x = 51, y = 0,
            xref = 'x', yref = 'y',
            ax = 82.33, ay = 0,
            axref = 'x', ayref = 'y',
            showarrow = TRUE,
            arrowhead = 2
          ),
          list(
            x = 82.33, y = 0,
            xref = 'x', yref = 'y',
            ax = 51, ay = 0,
            axref = 'x', ayref = 'y',
            showarrow = TRUE,
            arrowhead = 2
          ),
          list(
            x = 66.66, y = 0,
            xref = 'x', yref = 'y',
            text = "change in<br>equilibrium<br>output",
            showarrow = FALSE,
            xanchor = "middle",
            yanchor = "bottom",
            font = list(size = 12, color = gx_colors()[2])
          )
        )
      )
    
  }
  
  plot
  
})

output$textStep1GoodsMarketEqPlot <- renderUI({
  
  if(input$degree45Line){
    
    HTML(
      "<b>Solution Step 1:</b> We draw production as a function of income which is simply a straight line
    with slope 1."
    )

  }
  
})

output$textStep2GoodsMarketEqPlot <- renderUI({
  
  if(input$zzLine){
    
    HTML(
      "<b>Solution Step 2:</b> Consider the aggregate demand function:

      <div style='text-align: center;'>$$Z = c_0 + c_1(Y-T) + I + G $$</div>

      We can split this function into two parts: 
      <ol>
      <li>\\(c_0+I+G-c_1T\\) refers to autonomous consumption, i.e. 
      consumption that does not depend on income. This reflects the intercept.</li>
      <li>The second part \\(c_1Y\\) describes how demand changes with income, thus,
      \\(c_1\\) describes the slope of the function.</li>
      </ol>
      The equilibrium is where Demand = Production = Income.<br><br>
      The two lines must cross because we assumed \\(0 < c_1 < 1\\)."
    )
    
  }
  
})

output$textStep3GoodsMarketEqPlot <- renderUI({
  
  if(input$goodsMarketGincrease){
    
    HTML(
      "<b>Solution Step 3:</b> Consider again the aggregate demand function:

      <div style='text-align: center;'>$$Z = c_0 + c_1(Y-T) + I + G $$</div>
      
      In Step 2, we split the function into two components. When government 
      expenditure \\(G\\) increases, it directly influences autonomous consumption, 
      causing the aggregate demand curve to shift upwards.<br><br>
      Comparing the new equilibrium with the old, we observe that the change in 
      output is greater than the initial increase in government expenditure. This 
      is due to the multiplier effect! Recall that using partial derivatives, we 
      demonstrated that a change in government expenditure leads to a proportionally 
      larger change in output."
    )
    
  }
  
})

# Transition from the old equilibrium to the new equilibrium --------------

output$plotGoodsMarketTrans <- renderPlotly({
  
  # set up a fixed point problem
    startEq <- 50
    slope <- 0.4
    newInter <- 50
    
    df <- data.frame(x = numeric(36), 
                     y = numeric(36))
    
    x <- startEq
    
    for(i in 1:18){
      
      df$x[i*2-1] <- x
      
      eq <- newInter + 0.4*x
      
      df$y[i*2-1] <- eq
      
      df[i*2, ] <- eq
      
      x <- eq
      
    }
    
    df <- rbind(c(startEq, startEq), df)
    
  # choose how many steps to show
    selector <- input$stepsTransPlot
    n_values <- c(
      "Start" = 1,
      "Step 1" = 2,
      "Step 2" = 3,
      "Step 3" = 4,
      "Step 4" = 5,
      "Show all steps" = 37
    )
    
    df <- df[1:n_values[selector],]

  plot <- gx_theme(ggplot(),
                   x_title = "Income (Y)",
                   y1_title = "Demand (Z), Production (Y)") +
    theme(axis.text = element_blank(),
            axis.text.x = element_blank()) +
    scale_y_continuous(limits = c(0, 100), expand = c(0, 0)) +
    scale_x_continuous(limits = c(0, 100), expand = c(0.015, 0)) +
    geom_abline(slope = 1, intercept = 0)+
    geom_abline(slope = 0.4, intercept = 30, color = "#fba7a4") +
    geom_point(aes(x = 50, y = 50), size = 2) +
    geom_abline(slope = 0.4, intercept = 50, color = gx_colors()[2]) +
    #geom_point(aes(x = 83.33, y = 83.33), size = 2, color = "red") +
    geom_line(aes(x, y), data =df, linetype = "dashed") +
    geom_point(aes(x, y), data = df, color = gx_colors()[2])
  
  plot <- ggplotly(plot) %>%
    layout(
      xaxis = list(
        scaleanchor = "y",
        scaleratio = 1
      ),
      yaxis = list(
        scaleanchor = "x",  
        scaleratio = 1      
      ),
      annotations = list(
        list(
          x = 98,
          y = 89.2,
          text = "ZZ'", 
          showarrow = TRUE,
          arrowhead = 2,
          ax = 10,  
          ay = 10,
          font = list(size = 14, color = gx_colors()[2])   
        ),
        list(
          x = 98,
          y = 69.2,
          text = "ZZ", 
          showarrow = TRUE,
          arrowhead = 2,
          ax = 10,  
          ay = 10,
          font = list(size = 14, color = "#fba7a4")   
        )
      ))
  
  if(selector == "Start"){
    
    plot <- plot %>%
      layout(
        annotations = list(
          list(
            x = 50,
            y = 50,
            text = "Starting Point<br>Initial Equilibrium",  
            showarrow = TRUE,
            arrowhead = 2,
            ax = -40,  
            ay = -30,
            font = list(size = 12)
          )))
    
  }
  
  if(selector == "Step 1"){
    
    plot <- plot %>%
      layout(
        annotations = list(
          list(
            x = df[2,1],
            y = df[2,2],
            text = "Initial increase<br>in G",  
            showarrow = TRUE,
            arrowhead = 2,
            ax = -40,  
            ay = -40,
            font = list(size = 12)
          )))
    
  }
  
  if(selector == "Step 2"){
    
    plot <- plot %>%
      layout(
        annotations = list(
          list(
            x = df[3,1],
            y = df[3,2],
            text = "Income response<br>to change in<br>production",  
            showarrow = TRUE,
            arrowhead = 2,
            ax = -30,  
            ay = -50,
            font = list(size = 12)
          )))
    
  }
    
  if(selector == "Step 3"){
    
    plot <- plot %>%
      layout(
        annotations = list(
          list(
            x = df[4,1],
            y = df[4,2],
            text = "Still excess demand;<br>Production increases",  
            showarrow = TRUE,
            arrowhead = 2,
            ax = -40,  
            ay = -40,
            font = list(size = 12)
          )))
    
  }
  
  if(selector == "Step 4"){
    
    plot <- plot %>%
      layout(
        annotations = list(
          list(
            x = df[5,1],
            y = df[5,2],
            text = "Income adjusts",  
            showarrow = TRUE,
            arrowhead = 2,
            ax = -40,  
            ay = -40,
            font = list(size = 12)
          )))
    
  }
  
  if(selector == "Show all steps"){
    
    plot <- plot %>%
      layout(
        annotations = list(
          list(
            x = 83 + 1/3,
            y = 83 + 1/3,
            text = "New equilibrium",  
            showarrow = TRUE,
            arrowhead = 2,
            ax = -40,  
            ay = -40,
            font = list(size = 12)
          )))
    
  }
  
  plot
  
})

output$textGoodsMarketTransPlot <- renderUI({
  
  x <- input$stepsTransPlot
  
  if(x == "Start") {
    
    div(
      HTML(
        "<b>Starting Point:</b><br> We consider the same economy as in the previous
        exercise and analyse the impact of an increase of government expenditure."
      )
    )
    
  }
  
  else if (x == "Step 1") {
    div(
      HTML(
        "<b>Step 1:</b><br> An increase in government expenditure stimulates demand.
        Increasing demand causes production to increase. Recall we don't 
          have inventories in our model and no capacity constraints. So firms will 
          just produce more to satisfy demand."
      )
    )
  } 

  else if (x == "Step 2") {
    div(
      HTML(
        "<b>Step 2:</b><br>
          The increase in production must result in a corresponding increase in 
          income. Remember, aggregate production equals GDP, and we have demonstrated 
          that GDP is also equivalent to aggregate income."
      )
    )
  }
  
  else if (x == "Step 3") {
    div(
      HTML(
        "<b>Step 3:</b><br> Aggregate demand \\(ZZ'\\) still exceeds production. Thus, 
          production continues to increase."
      )
    )
  }
  
  else if (x == "Step 4") {
    div(
      HTML(
        "<b>Step 4:</b><br> The additional production leads to a further increase in income."
      )
    )
  }
  
  else if (x == "Show all steps") {
    div(
      HTML(
        "<b>Reaching the New Equilibrium:</b><br> The process continues with each iteration 
          producing diminishing effects. Theoretically, this process extends to infinity. 
          Therefore, while the step-by-step solution will bring us very close to the actual 
          equilibrium, it will never fully reach it. This becomes apparent when you zoom in
          on the results. I stopped after 18 iterations, and you will notice a discrepancy 
          between the step-by-step approach and the true equilibrium. The true equilibrium 
          is where the demand curve intersects the 45° line."
      )
    )
  }
  # if(x == "Step 1"){
  #   
  #   HTML(
  #     "<b>Step 1:</b> 
  #     <ul>
  #     <li>An increase in government expenditure stimulates demand.</li>
  #     <li>Increasing demand causes production to increase. Recall we don't 
  #     have inventories in our model and no capacity constraints. So firms will 
  #     just produce more to satisfy demand.</li>
  #     </ul>"
  #   )
  #   
  # }
  #  
  # if(x == "Step 2"){
  #   
  #   HTML(
  #     "<b>Step 2:</b>
  #     The increase in production must result in a corresponding increase in 
  #     income. Remember, aggregate production equals GDP, and we have demonstrated 
  #     that GDP is also equivalent to aggregate income."
  #   )
  #   
  # }
  # 
  # if(x == "Step 3"){
  #   
  #   HTML(
  #     "<b>Step 3:</b> Aggregate demand \\(ZZ'\\) still exceeds production. Thus, 
  #     production continues to increase."
  #   )
  #   
  # }
  # 
  # if(x == "Step 4"){
  #   
  #   HTML(
  #     "<b>Step 4:</b> The additional production leads to a further increase in income."
  #   )
  #   
  # }
  # 
  # if(x == "Show all steps"){
  #   
  #   HTML(
  #     "<b>Reaching the New Equilibrium:</b> The process continues with each iteration 
  #     producing diminishing effects. Theoretically, this process extends to infinity. 
  #     Therefore, while the step-by-step solution will bring us very close to the actual 
  #     equilibrium, it will never fully reach it. This becomes apparent when you zoom in
  #     on the results. I stopped after 18 iterations, and you will notice a discrepancy 
  #     between the step-by-step approach and the true equilibrium. The true equilibrium 
  #     is where the demand curve intersects the 45° line."
  #   )
  #   
  # }
  
})

