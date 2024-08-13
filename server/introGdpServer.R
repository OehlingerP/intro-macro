output$tableGDP <- renderDataTable({
  #browser()
  df <- data.frame(
    Company = c("Steel Producer", "Car Manufacturer"),
    Revenue = c(120, 250),
    `Expenses (wages)` = c(80, 70),
    `Expenses (capital)` = c(20, 20),
    `Intermediate Goods` = c(0, 120),
    Profit = c(20, 40),
    check.names = F
  )
  
  if(input$selectGDPCalcMethod == "None"){
    
    dt <- datatable(df,
                    options = list(
                      dom = 't'))
    
  }
  
  if(input$selectGDPCalcMethod == "Expenditure Method"){
    
    dt <- datatable(df,
              options = list(
                dom = 't')) %>%
      formatStyle(2, 
                  backgroundColor = styleEqual(250, "lightgreen")) %>%
      formatRound(columns = 2:6, digits = 0)
    
  }
  
  if(input$selectGDPCalcMethod == "Output Method"){
    
    dt <- datatable(df,
              options = list(
                dom = 't')) %>%
      formatStyle(2, 
                  backgroundColor = styleEqual(c(120, 250), "lightgreen")) %>%
      formatStyle(5, 
                  backgroundColor = styleEqual(120, "#FF7F7F")) %>%
      formatRound(columns = 2:6, digits = 0)
    
  }
  
  if(input$selectGDPCalcMethod == "Income Method"){
    
    dt <- datatable(df,
                    options = list(
                      dom = 't')) %>%
      formatStyle(c(3, 4, 6), 
                  backgroundColor = styleEqual(c(20, 70, 80, 40), "lightgreen")) %>%
      formatRound(columns = 2:6, digits = 0)
    
  }
  
  dt
  
})

output$gdpFormula <- renderUI({
  
  x <- input$selectGDPCalcMethod
  
  if(x == "None") eq <- 
      paste0("\\(\\text{Try to solve it yourself before selecting different calculation methods.}\\)")
  
  if(x == "Expenditure Method") eq <- 
      paste0("\\(\\text{The GDP of the economy is 250}\\)")
  
  if(x == "Output Method") eq <- 
      paste0("\\(\\text{The GDP of the economy is: } 120 + (250 - 120) = 250\\)")
  
  if(x == "Income Method") eq <- 
      paste0("\\(\\text{The GDP of the economy is: } (80 + 20 + 20) + (70 + 20 + 40) = 250\\)")
  
  withMathJax(HTML(eq))
})

output$plotGdpUS <- renderPlotly({

  df <- fred_data() %>%
    filter(country == "United States",
           variable %in% c("Real GDP", "Nominal GDP"))

  plot <- gx_theme(
    ggplot(df, aes(x = date, y = value, color = variable)) + geom_line(),
    y1_title = "Billions of Dollars", 
    title = "U.S. Real and Nominal GDP")
  
  clean_plotly_legend(ggplotly(plot))
  
})

output$plotGdpGini <- renderPlotly({

  df <- fred_data() %>%
    filter(variable %in% c("Gini Index", "GDP per Capita")) %>%
    select(-series_id) %>%
    pivot_wider(names_from = variable, values_from = value) %>%
    mutate(date = as.numeric(substr(date, 1, 4))) %>%
    filter(date == 2015) %>%
    na.omit()
  
  plot <- ggplot(df, aes(x = `GDP per Capita`, y = `Gini Index`, 
                 color = Continent,
                 text = country)) +
    geom_point(size = 3)
  
  plot <- gx_theme(plot, 
                   y1_title = "Gini Index", 
                   x_title = "GDP per Capita")#, 
                   #title = "Total welfare vs. distribution of welfare")
  
  clean_plotly_legend(ggplotly(plot))
  
})
