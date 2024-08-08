#' Fetching data from the Fred St Louis database once a month
#' @param tickers char; ticker symbol for the time series to download
#' @param freq char; vector of frequency of data, one of m, q, a, sa
#' @param time_diff num; time difference in days when to download the data again; default 30 days
#' @param file_name char; file name (and path) of the cache file (without RDS!)
#' @export

# Function to fetch and cache data
fetch_data <- function(tickers,
                       freq,
                       time_diff = 30,
                       file_name) {
  
  data_file <- paste0(file_name, ".RDS")
  date_file <- paste0(file_name, "_date.RDS")
  # Check if the cache file exists
  if (file.exists(data_file)) {
    # Load cached data
    fred_data <- readRDS(data_file)
    last_update <- readRDS(date_file)
  } else {
    # Initialize last_update to an empty date
    last_update <- as.Date("1970-01-01")
  }
  
  # Get the current date
  current_date <- Sys.Date()
  
  # Check if it's time to update the cache (i.e., if a month has passed)
  if (difftime(current_date, last_update, units = "days") > time_diff) {
    # Fetch data from FRED
    fred_data <- rbindlist(
      lapply(seq_along(tickers), function(TICKER){
        print(TICKER)
        fredr(
          series_id = tickers[TICKER],
          observation_start = as.Date("1920-01-01"),
          observation_end = current_date,
          frequency = freq[TICKER])
      }))
    
    # Save the data and the current date to the cache
    saveRDS(current_date, file = date_file)
    saveRDS(fred_data, file = data_file)
    
  } else {
    # Load cached data
    fred_data <- readRDS(data_file)
  }
  return(fred_data)
}
