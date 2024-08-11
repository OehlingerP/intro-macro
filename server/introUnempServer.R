# Data values
population_total <- 83.2
working_age_population <- 53.7
youth <- 11.4
elderly <- 18.1
labor_force <- 46.5
outside_labor_force <- 7.2
unemployed <- 1.4
employed <- 45.1

# Output the custom HTML table
output$tabEmpGermany <- renderUI({
  HTML(
    paste(
      '<table border="1" style="border-collapse: collapse; width: 100%;">',
      '<tr>',
      '<td colspan="5";">Total Population: ', population_total, ' Millionen</td>',
      '</tr>',
      '<tr>',
      '<td colspan="3">Working-Age Population: ', working_age_population, '</td>',
      '<td>Under 15 Years: ', youth, '</td>',
      '<td>65 Years and Older: ', elderly, '</td>',
      '</tr>',
      '<tr>',
      '<td colspan="2">Labor Force: ', labor_force, '</td>',
      '<td>Outside the Labor Force: ', outside_labor_force, '</td>',
      '<tr>',
      '<td>Unemployed: ', unemployed, '</td>',
      '<td>Employed: ', employed, '</td>',
      '</tr>',
      '</table>',
      '<p><em>Source: Population, Labor Force, Employment, and Unemployment in Germany, 2019, in millions. Blanchard and Illing (2021), page 223.</em></p>'
    )
  )
})

output$formEmpRate <- renderUI({
  
  eq <- paste0("$$\\begin{align}\\text{Employment Rate} &= ", 
               "\\frac{\\text{Employed}}{\\text{Working-Age Population}}\\\\",
               "&=\\frac{",employed,"}{",working_age_population,"}\\\\",
               "&=", round(employed / working_age_population,4), "=", paste0(round( employed/ working_age_population,4)*100,"\\%"),"\\end{align}$$")
  
  withMathJax(HTML(eq))
})

output$formLaborForcePart <- renderUI({

  eq <- paste0("$$\\begin{align}\\text{Praticipation Rate} &= ", 
               "\\frac{\\text{Labor Force}}{\\text{Working-Age Population}}\\\\",
               "&=\\frac{",labor_force,"}{",working_age_population,"}\\\\",
               "&=", round(labor_force / working_age_population,4), "=", paste0(round(labor_force / working_age_population,4)*100,"\\%"),"\\end{align}$$")
  
  withMathJax(HTML(eq))
})

output$formUnempRate <- renderUI({
  
  eq <- paste0("$$\\begin{align}\\text{Unemployment Rate} &= ", 
               "\\frac{\\text{Unemployed}}{\\text{Labor Force}}\\\\",
               "&=\\frac{",unemployed,"}{",labor_force,"}\\\\",
               "&=", round(unemployed / labor_force,4), "=", paste0(round(unemployed / labor_force,4)*100,"\\%"),"\\end{align}$$")
  
  withMathJax(HTML(eq))
  
})

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