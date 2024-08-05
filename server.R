###############################################
#
# Define server for the Shiny app
#
##############################################


function(input, output, session) {
  
  # Source files with server code for each tab -----------------------------------------
  source(file.path("server/introLectureServer.R"), local = TRUE)$value # 
  source(file.path("server/islmServer.R"), local = TRUE)$value # 
  
  # Keeps the shiny app from timing out quickly 
  autoInvalidate <- reactiveTimer(10000)
  observe({
    autoInvalidate()
    cat(".")
  })
  
}


## END 