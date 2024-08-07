###############################################################################
#
# Global script ---- 
#
###############################################################################

# contains :- 

# 1. required packages
# 2. required datafiles
# 3. lists for dashboard filters
# 4. common chart themes
# 5. extra UI components that are not reactive (cookie box/guided tours/updates modal)
# 6. sourcing functions created for app (see functions folder) 



# 1. required packages ----------------------------------------------------------
library(cicerone) # for guided tours
library(data.table)
library(shiny) # shiny functions
library(shinydashboard) # more shiny functions
library(shinyBS) # modals
library(dplyr) # data manipulation
library(ggplot2) # data visualization
library(highcharter) # data visualisation
library(plotly) # interactive graphs
library(BH)
library(htmlwidgets)
library(leaflet) #javascript maps
library(shinyWidgets) # for extra widgets
library(shinyjs) # for using javascript
library(rintrojs) # for introbox in summary tab
library(lubridate) # for automated list of dates in welcome modal
library(shinycssloaders) # for loading icons
library(webshot) # to download plotly charts
library(tidyr) # for pivoting
library(stringr) # for working with strings
library(reactable) # interactive tables
library(htmltools) # for using html tags
library(purrr) # for applying function to lists
library(data.table) # for working with large datasets
library(jsonlite)
library(rmarkdown)
library(knitr)
library(gxplot)
library(shinyvalidate)


library(fredr)
fredr_set_key("13cde7ca47173a5c9a9c1eece02455b9")


# 2. data files
countries <- sort(c("USA", "Austria", "Germany", "Brazil", "South Africa", "Japan"))
tab_names <- c("homeTab", "introGoalsTab", "introGdpTab", "introUnempTab",
            "introRatesTab", "introInflationTab", "introExercisesTab", 
            "goodsMarketTab", "islmTab", "policyAnalysisTab",
            "mathPrereqTab","aboutTab")