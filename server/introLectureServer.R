fred_data <- reactive({
  fetch_data(tickers = c("UNRATE", "GDPC1"), 
             file_name = "data/fred_cached_data")
})


output$testPlot <- renderPlot({
  
  ggplot(fred_data(), aes(x = date, y = value, color = series_id)) +
    geom_line()
  
})