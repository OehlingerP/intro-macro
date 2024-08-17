###############################################
#
# Define server for the Shiny app
#
##############################################


function(input, output, session) {
  
  # Source files with server code for each tab -----------------------------------------
  source(file.path("server/dataDownloadServer.R"), local = TRUE)$value 
  # variables
  source(file.path("server/introGdpServer.R"), local = TRUE)$value  
  source(file.path("server/introUnempServer.R"), local = TRUE)$value  
  source(file.path("server/introInflationServer.R"), local = TRUE)$value 
  # goods market
  source(file.path("server/goodsConsumptionServer.R"), local = TRUE)$value 
  source(file.path("server/goodsMultiplierServer.R"), local = TRUE)$value 
  source(file.path("server/goodsGraphicalServer.R"), local = TRUE)$value 
  # financial market
  source(file.path("server/financialDemandServer.R"), local = TRUE)$value 
  source(file.path("server/financialSupplyServer.R"), local = TRUE)$value 
  
  source(file.path("server/islmServer.R"), local = TRUE)$value  
  source(file.path("server/questionServer.R"), local = TRUE)$value 
  
  # Keeps the shiny app from timing out quickly 
  autoInvalidate <- reactiveTimer(10000)
  observe({
    autoInvalidate()
    cat(".")
  })
  
}


## END 