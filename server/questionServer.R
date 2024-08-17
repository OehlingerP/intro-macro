# goods market

output$a1goodsEq <- renderText({
  
  if(input$a1goodsEqBttn %% 2 == 1){
    
    "In GDP accounting, \\(Y\\) denotes both income and production because GDP 
    can be measured from two equivalent perspectives: the production approach 
    and the income approach. The production approach calculates GDP as the total 
    value of goods and services produced, while the income approach sums up all 
    incomes earned from production, such as wages and profits. Both methods yield 
    the same \\(Y\\), reflecting the interconnection between output and income in the economy."
    
  }
  
})

output$a2goods <- renderText({
  
  if(input$a2goodsBttn %% 2 == 1){
    
    "We subtract imports in the aggregate demand equation to accurately reflect 
    the demand for domestically produced goods and services. Imports are produced
    abroad and thus do not reflect domestic production."
    
  }
  
})


output$a3goods <- renderUI({
  
  if(input$a3goodsBttn %% 2 == 1){
    
    HTML(
      "<ul>
        <li><p>Depending on the time horizon the assumption that prices are fixed can be 
    reasonable. For example, wages usually adjust once a year. Also when you 
    visit your favourite restaurant prices usually remain constant from one month
    to the other (see <a href = 'https://en.wikipedia.org/wiki/Menu_cost', target = 
    '_blank'>menu costs</a>).</p></li>
      <li><p>The assumption of no inventories, while not realistic does 
    not seem to be too strong of an assumption given that inventories usually 
    account for less than 1% of total GDP.</p></li>
    <li><p> The other two assumptions, while challenging to justify, provide a 
    necessary starting point for our analysis. Incorporating multiple markets or 
    open economies would introduce complexity that is difficult to manage.</p></li>
      </ul>"
    )
  }
  
})

output$a4goods <- renderText({
  
  if(input$a4goodsBttn %% 2 == 1){
    
    "Consumption is the largest component of aggregate demand, typically accounting 
    for about 60% of GDP on average in OECD countries. In Austria and Germany, 
    consumption makes up around 50% of GDP, while in the United States, it exceeds 
    70%. This variation highlights how consumption patterns differ across countries, 
    yet it remains the predominant driver of GDP in most cases."
    
  }
  
})

output$a5goods <- renderUI({
  
  if(input$a5goodsBttn %% 2 == 1){
    
    tagList(
      p("Comparing the two multipliers,"),
      withMathJax(
        HTML(
          "\\[
        \\frac{1}{1 - c_1 + c_1 t_1} < \\frac{1}{1 - c_1},
        \\]"
        )
      ),
      p("we see that income-dependent taxes reduce the multiplier and, therefore, 
        have a stabilizing effect on aggregate output.")
    )
    
  }
  
})

# Financial Markets -------------------------------------------------------



output$a1FinancialSupply <- renderText({
  
  if(input$a1FinancialSupplyBttn %% 2 == 1){
    
    "The main objective of a central bank is price stability. In some countries, 
    such as the U.S., central banks should also support full employment."
    
  }
  
})




# Math Prerequisites ------------------------------------------------------


output$a1Math <- renderUI({
  
  if(input$a1MathBttn %% 2 == 1){
    withMathJax(
    HTML(
      
        "\\[
        \\begin{aligned}
        \\text{GDP Growth Rate} &= \\frac{Y_{2020} - Y_{2019}}{Y_{2019}} \\times 100 \\\\
        &= \\frac{1050 - 1000}{1000} \\times 100 \\\\
        &= \\frac{50}{1000} \\times 100 = 5\\%
        \\end{aligned}
        \\]"
      )
    )
  }
  
})

output$a2Math <- renderUI({
  
  if(input$a2MathBttn %%2 == 1){
    
    withMathJax(
      HTML(
        "\\[
        \\begin{aligned}
        y &= c_0 + c_1y\\quad| -c_1y\\\\
        \\Leftrightarrow y-c_1y&= c_0 \\\\
        \\Leftrightarrow y(1-c_1)&= c_0\\quad| /(1-c_1) \\\\
        \\Leftrightarrow y &= \\frac{c_0}{1-c_1}
        \\end{aligned}
        \\]"
      )
    )
  }
  
})

output$a3Math <- renderUI({
  
  if(input$a3MathBttn %%2 == 1){
    
    withMathJax(
      HTML(
        "\\[
        \\begin{aligned}
        y &= c_0 + c_1(y-(t_0+t_1y))\\\\
         &= c_0 + c_1(y-t_0-t_1y)\\\\
         &= c_0 + c_1y-c_1t_0-c_1t_1y\\quad| -c_1y\\quad | +c_1t_1y\\\\
        \\Leftrightarrow y-c_1y+c_1t_1y&= c_0-c_1t_0 \\\\
        \\Leftrightarrow y(1-c_1+c_1t_1)&= c_0-c_1t_0\\quad| /(1-c_1++c_1t_1) \\\\
        \\Leftrightarrow y &= \\frac{c_0-c_1t_0}{1-c_1++c_1t_1}
        \\end{aligned}
        \\]"
      )
    )
    
  }
  
})

output$a4Math <- renderPlotly({
  
  if(input$a4MathBttn %%2 == 1){
    
    plot <- gx_theme(ggplot(),
                             x_title = "x",
                             y1_title = "y") +
      # theme(axis.text = element_blank()) +
      scale_y_continuous(limits = c(0, 100), expand = c(0.01, 0)) +
      scale_x_continuous(limits = c(0, 100), expand = c(0.01, 0)) +
      geom_abline(slope = 0.5, intercept = 10, color = gx_colors()[1])
    
    ggplotly(plot)
    
  }
  
})

output$a5Math <- renderPlotly({
  
  if(input$a5MathBttn %%2 == 1){
    
    plot <- gx_theme(ggplot(),
                     x_title = "x",
                     y1_title = "y") +
      # theme(axis.text = element_blank()) +
      scale_y_continuous(limits = c(0, 100), expand = c(0.01, 0)) +
      scale_x_continuous(limits = c(0, 100), expand = c(0.01, 0)) +
      geom_abline(slope = 1, intercept = 0, color = gx_colors()[1])
    
    ggplotly(plot)
    
  }
  
})


output$a6Math <- renderPlotly({
  
  if(input$a6MathBttn %%2 == 1){
    
    plot <- gx_theme(ggplot(),
                             x_title = "x",
                             y1_title = "y") +
      # theme(axis.text = element_blank()) +
      scale_y_continuous(breaks = c(0), labels = c("0"), limits = c(0, 100), expand = c(0.01, 0)) +
      scale_x_continuous(breaks = c(0), labels = c("0"), limits = c(0, 100), expand = c(0.01, 0)) +
      geom_hline(yintercept = 30, color = gx_colors()[1])
    
    ggplotly(plot) %>%
      layout(
      annotations = list(
        list(
          x = 25,
          y = 32.5,
          text = "It's a horizontal line because y does not depend on x.",  # Math expression in plotly format
          showarrow = FALSE,
          xanchor = "left",
          font = list(size = 12, color = gx_colors()[1]) 
        )))
    
  }
  
})

output$a7Math <- renderUI({
  
  if(input$a7MathBttn %%2 == 1){
    
    withMathJax(
      HTML(
        "\\[
        \\begin{aligned}
        \\frac{\\partial Y}{\\partial c_0} &= \\frac{1}{1-c_1}\\\\
        \\frac{\\partial Y}{\\partial t_1} &= \\frac{-c_1}{1-c_1}\\\\
        \\end{aligned}
        \\]"
      )
    )
    
  }
  
})