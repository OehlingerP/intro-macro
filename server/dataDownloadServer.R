###############################################################################
#
# Data Download Server File ---- 
#
###############################################################################

# contains :- 

# 1. Fred data download
# 2. BIS Inflation data download


# Fred Data Download ------------------------------------------------------

fred_data <- reactive({
  browser()
  df_ids <- read.csv("data/fred_tickers.csv", sep = ",")
  
  # df <- fetch_data(tickers = df_ids$series_id, 
  #                  freq = df_ids$frequency,
  #                  file_name = "data/fred_cached_data")
  
  df <- readRDS("data/fred_cached_data.RDS")
  
  df <- left_join(df, df_ids) %>%
    select(-realtime_start, -realtime_end)
  
  df
  
})


# BIS Data Download -------------------------------------------------------

bis_data_inflation <- reactive({
  
  # if(substr(Sys.Date(), 9, 10) == "01"){
  #   
  #   file_name <- file.path("data", 
  #                          grep("WS_LONG_CPI_csv_flat.zip", 
  #                               dir("data"), value = T))
  #   
  #   if(file.exists(file_name)) file.remove(file_name)
  #   
  #   df <- fetch_dataset(dest.dir = "data",
  #                       "WS_LONG_CPI_csv_flat.zip")
  #   
  #   df <- df %>% 
  #     filter(`FREQ:Frequency` == "M: Monthly",
  #            `UNIT_MEASURE:Unit of measure` == "771: Year-on-year changes, in per cent") %>%
  #     select("TIME_PERIOD:Time period or range",
  #            "REF_AREA:Reference area",
  #            "OBS_VALUE:Observation Value") %>%
  #     rename("date" = `TIME_PERIOD:Time period or range`,
  #            "country" = `REF_AREA:Reference area`,
  #            "value" = `OBS_VALUE:Observation Value`) %>%
  #     mutate(date = as.Date(paste0(date, "-01")))
  #   
  #   df_cn <- as.data.frame(do.call(rbind, strsplit(df$country, ": ")))
  #   colnames(df_cn) <- c("iso2", "country")
  #   
  #   df <- df %>%
  #     select(-country) %>%
  #     cbind(df_cn)
  #   
  #   saveRDS(df, file = "data/bis_inflation.RDS")
  #   
  # } else {
  #   
  #   df <- readRDS("data/bis_inflation.RDS")
  #   
  # }
  
  df <- readRDS("data/bis_inflation.RDS")
  
  df
  
})