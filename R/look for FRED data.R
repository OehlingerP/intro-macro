df <- fredr_series_search_text(
  search_text = "Labor Compensation: Earnings: Private Sector: Hourly for "#,
  #filter_variable = "frequency", 
  #filter_value = "Monthly"
  )

df_tickers <- df[grepl("LRHUTTTT", df$id),]

sum(grepl("37LRHUTTTT", df$id))

df_tickers <- df %>%
  filter(grepl("LCEAPR01", id), 
         seasonal_adjustment == "Seasonally Adjusted",
         frequency_short == "Q"#,
         #units == "Growth rate same period previous year"
         ) %>%
  mutate(country = gsub("Labor Compensation: Earnings: Private Sector: Hourly for ", 
                        "", title),
         variable = "Labor Compensation (Private Sector)") %>%
  select(country, variable, id) %>%
  write.csv(file = "data/temp.csv")


fredr(
  series_id = "INDIRLTLT01STM",
  observation_start = as.Date("1990-01-01"),
  observation_end = Sys.Date(),
  frequency = "m")
