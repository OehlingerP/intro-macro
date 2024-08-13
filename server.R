###############################################
#
# Define server for the Shiny app
#
##############################################


function(input, output, session) {
  
  # Source files with server code for each tab -----------------------------------------
  source(file.path("server/dataDownloadServer.R"), local = TRUE)$value 
  source(file.path("server/introGdpServer.R"), local = TRUE)$value  
  source(file.path("server/introUnempServer.R"), local = TRUE)$value  
  source(file.path("server/introInflationServer.R"), local = TRUE)$value 
  source(file.path("server/goodsConsumptionServer.R"), local = TRUE)$value 
  source(file.path("server/goodsMultiplierServer.R"), local = TRUE)$value 
  source(file.path("server/goodsGraphicalServer.R"), local = TRUE)$value 
  source(file.path("server/islmServer.R"), local = TRUE)$value  
  
  observe({
    runjs("
      function navigateTab(direction) {
        var tabs = Array.from(document.querySelectorAll('.navbar-nav .nav-link'));
        var activeTab = tabs.find(tab => tab.classList.contains('active'));
        var currentIndex = tabs.indexOf(activeTab);
        var newIndex = (currentIndex + direction + tabs.length) % tabs.length;
        tabs[newIndex].click();
      }
      
      document.getElementById('Previous').addEventListener('click', function() {
        navigateTab(-1);
      });
      
      document.getElementById('Next').addEventListener('click', function() {
        navigateTab(1);
      });
    ")
  })
  
  # Keeps the shiny app from timing out quickly 
  autoInvalidate <- reactiveTimer(10000)
  observe({
    autoInvalidate()
    cat(".")
  })
  
}


## END 