fred_data <- reactive({
  
  df_ids <- read.csv("data/fred_tickers.csv", sep = ";")
  
  df <- fetch_data(tickers = df_ids$series_id, 
                   file_name = "data/fred_cached_data")
  
  df <- left_join(df, df_ids) %>%
    select(-realtime_start, -realtime_end, -series_id)
  
  df
  
})


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


output$plotOcunsLaw <- renderPlotly({
  
  df <- fred_data()
  
  countries <- input$pickerOcun
  
  df_gdp <-df %>% filter(variable %in% c("Real GDP"),
                      country %in% countries) %>%
    mutate(date = substr(date, 1, 4)) %>%
    group_by(country, date) %>%
    mutate(count = 1, 
           count = sum(count)) %>%
    filter(count == 4) %>%
    select(-count) %>%
    summarize(value = sum(value)) %>%
    group_by(country) %>%
    mutate(value = (value / lag(value, 1) - 1)*100) %>%
    rename("GDP (%-change)" = value)
  
  df_une <- df %>% filter(variable %in% c("Unemployment Rate"),
                          country %in% countries) %>%
    mutate(date = substr(date, 1, 4)) %>%
    group_by(country, date) %>%
    summarize(value = mean(value)) %>%
    group_by(country) %>%
    mutate(value = value - lag(value, 1)) %>%
    rename("Unemployment (change)" = value)
  
  df_plot <- left_join(df_gdp, 
                    df_une)
  
  plot <- ggplot(df_plot, aes(x = `GDP (%-change)`, y = `Unemployment (change)`, color = country)) + 
    geom_point( size = 2 ) +
    geom_smooth(method = "lm", se = F, lwd = 1.2 ) 
  
  ggplotly(gx_theme(plot))
  
})