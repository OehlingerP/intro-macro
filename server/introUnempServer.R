
output$laborMarketUS <- renderPlotly({

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
  
  df <- fred_data() 
  
  df <- df %>%
    filter(series_id %in% c("UNRATE", "CIVPART"),
           variable %in% input$pickerLaborUS)
  
  plot <- ggplot() +
    geom_rect(data = df_recession,
              aes(xmin = startDate, xmax = endDate, ymin = min(df$value)-2, ymax = max(df$value) + 2),
              fill = "grey70", alpha = 0.5) +
    geom_line(data = df, mapping = aes(x = date, y = value, color = variable)) 
  
  plot <- ggplotly(gx_theme(plot,
                    y1_title = "Share in %"))#,
                    #title = "U.S. Labor Market"))
  
  clean_plotly_legend(plot)
  
  
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
    mutate(value = round((value / lag(value, 1) - 1)*100,2)) %>%
    rename("GDP (%-change)" = value)
  
  df_une <- df %>% filter(variable %in% c("Unemployment Rate"),
                          country %in% countries) %>%
    mutate(date = substr(date, 1, 4)) %>%
    group_by(country, date) %>%
    summarize(value = mean(value)) %>%
    group_by(country) %>%
    mutate(value = round(value - lag(value, 1), 2)) %>%
    rename("Unemployment (change)" = value)
  
  df_plot <- left_join(df_gdp, 
                    df_une)
  
  # Fit linear models for each country and extract slopes
  slopes <- do.call(rbind, lapply(unique(df_plot$country), function(x){
    
    tmp <- df_plot %>%
      filter(country == x)
    
    coeffs <- summary(lm(`Unemployment (change)` ~ `GDP (%-change)`, data = tmp))$coefficients
    
    c(x, round(coeffs[2,1],2))
    
  }))
  
  slopes <- as.data.frame(slopes)
  colnames(slopes) <- c("country", "Slope")
  
  df_plot <- left_join(df_plot, slopes)
  
  plot <- ggplot(df_plot, aes(x = `GDP (%-change)`,
                              y = `Unemployment (change)`, 
                              color = country,
                              text = paste("Slope:", Slope))) + 
    geom_point( size = 2 ) +
    geom_smooth(method = "lm", se = F, lwd = 1.2) 
  
  clean_plotly_legend(ggplotly(gx_theme(plot)))
  
})