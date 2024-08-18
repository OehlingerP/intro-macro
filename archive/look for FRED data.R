df <- fredr_series_search_text(
  search_text = "Constant GDP per capita for "#,
  #filter_variable = "frequency", 
  #filter_value = "Monthly"
  )

df_tickers <- df[grepl("LRHUTTTT", df$id),]

sum(grepl("37LRHUTTTT", df$id))

df_tickers <- df %>%
  filter(grepl("NYGDPPCAPKD", id), 
         #seasonal_adjustment == "Seasonally Adjusted",
         frequency_short == "A"#,
         #units == "Growth rate same period previous year"
         ) %>%
  mutate(country = gsub("Constant GDP per capita for |Constant GDP per capita for the ", 
                        "", title),
         variable = "GDP per Capita") %>%
  select(country, variable, id) %>%
  write.csv(file = "data/temp.csv")


fredr(
  series_id = "INDIRLTLT01STM",
  observation_start = as.Date("1990-01-01"),
  observation_end = Sys.Date(),
  frequency = "m")


test <- read.csv("data/fred_tickers.csv")

countries <- test %>%
  filter(variable == "Gini Index")

test <- test %>%
  filter(country %in% countries$country, 
         variable == "GDP per Capita")
write.csv(test, "data/temp.csv")
