output$tabIntInfCorr <- renderDataTable({
  
  df <- fred_data()
  
  countries <- input$pickerInterestInflation
  
  df_int <-df %>% filter(variable %in% c("Central Bank Policy Rate"),
                         country %in% countries) %>%
    pivot_wider(names_from = "variable", values_from = "value")
  
  df_inf <- df %>% filter(variable %in% c("Inflation Rate"),
                          country %in% countries) %>%
    mutate(value = data.table::shift(value, input$numericLagInfInt)) %>%
    pivot_wider(names_from = "variable", values_from = "value")
  
  df_plot <- left_join(df_int,
                       df_inf) %>%
    na.omit()
  
  correlation_results <- df_plot %>%
    group_by(country) %>%
    summarize(
      Correlation = cor(`Central Bank Policy Rate`, `Inflation Rate`, use = "complete.obs")
    )
  
  correlation_results
  
})

output$plotInterestInflation <- renderPlotly({
  
  df <- fred_data()
  
  countries <- input$pickerInterestInflation
  
  df_int <-df %>% filter(variable %in% c("Central Bank Policy Rate"),
                         country %in% countries) %>%
    pivot_wider(names_from = "variable", values_from = "value")
  
  df_inf <- df %>% filter(variable %in% c("Inflation Rate"),
                          country %in% countries) %>%
    mutate(value = shift(value, input$numericLagInfInt)) %>%
    pivot_wider(names_from = "variable", values_from = "value")
  
  df_plot <- left_join(df_int, 
                       df_inf) %>%
    na.omit()
  
  plot <- ggplot(df_plot, aes(x = `Central Bank Policy Rate`, y = `Inflation Rate`, color = country)) + 
    geom_point( size = 2 ) +
    geom_smooth(method = "lm", se = F, lwd = 1.2 ) 
  
  ggplotly(gx_theme(plot))
  
})

output$plotInflationHistory <- renderPlotly({

  countries <- input$pickerInflationHistoric
  
  start_date <- input$dateRangeInflationHistoric[1]
  end_date <- input$dateRangeInflationHistoric[2]
  
  df <- bis_data_inflation() %>%
    filter(country %in% countries,
           date >= start_date, 
           date <= end_date)
  
  plot <- ggplot(df, aes(x = date, y = value, color = country)) +
    geom_line()
  
  ggplotly(gx_theme(plot))
  
})


output$plotInflationShareBelow2 <- renderPlotly({

  df <- fred_data() %>%
    filter(variable == "US Recessions") %>%
    mutate(startDate = ifelse(value == 1 & (lag(value) == 0 | is.na(lag(value))), date, NA),
           endDate = ifelse(value == 1 & (lead(value) == 0 | is.na(lead(value))), date, NA)) 
  
  df_recession <- data.frame("startDate" = df %>%
                               select(startDate) %>%
                               na.omit() %>%
                               c() %>%
                               unlist(),
                             "endDate" = df %>%
                               select(endDate) %>%
                               na.omit() %>%
                               c() %>%
                               unlist())
  
  df_recession$startDate <- as.Date(df_recession$startDate)
  df_recession$endDate <- as.Date(df_recession$endDate)
  
  df <- bis_data_inflation() %>%
    mutate(count = 1, 
           below2 = ifelse(value < 2, 1, 0)) %>%
    filter(date >= as.Date("1990-01-01")) %>%
    group_by(date) %>%
    summarize(count = sum(count), 
              below2 = sum(below2)) %>%
    mutate(below2 = below2/count * 100)
  
  plot <- ggplot() +
    geom_rect(data = df_recession,
              aes(xmin = startDate, xmax = endDate, ymin = 0, ymax = 100),
              fill = "grey70", alpha = 0.5) +
    geom_line(data = df, mapping = aes(x = date, y = below2), color = gx_colors()[1]) 
  
  ggplotly(gx_theme(plot,
                    y1_title = "Share in %",
                    title = "Share of (BIS) countries with inflation below 2%"))
  
})

