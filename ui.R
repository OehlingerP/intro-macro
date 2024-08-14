###############################################
#
# User interface for the Shiny app
#
##############################################


# Source files with UI code for each tab --------------
walk(list.files("ui", full.names = TRUE), ~ source(.x))

# define the UI structure -------------------------------
tagList(
  useShinyjs(), 
  navbarPage(
    
    # add PHS logo to navigation bar 
    title = div(style = "position: relative; 
                       top: -15px; 
                       margin-left: 10px; 
                       margin-top: 5px;",
                tags$a(img(src = "crane_circle.png", 
                           width = 43, 
                           alt = "link to personal website"),
                       href = "https://www.peteroehlinger.com/",
                       target = "_blank")
    ),
    
    
    # make navigation bar collapse on smaller screens
    windowTitle = "ScotPHO profiles",
    collapsible = TRUE,
    
    header = tags$head(
      # sourcing css style sheet 
      #includeCSS("www/styles.css"),
      
      # include scotpho icon in web browser
      HTML("<html lang='en'>"),
      tags$link(rel = "shortcut icon", 
                href = "favicon_scotpho.ico")#, 
      
      # include google analytics scripts
      #includeScript("google-analytics.js"), # GA 3 
      #HTML('<script async src="https://www.googletagmanager.com/gtag/js?id=G-KE1C59RLNS"></script>'),
      #includeScript("gtag.js") # GA 4 
      
    ),
    
    
    # order of tabs --------------------------------
    homeTab, 
    navbarMenu("Intro",
               introGoalsTab,
               introGdpTab,
               introUnempTab,
               introInflationTab#,
               #introRatesTab
               ),
    navbarMenu("The Goods Market",
               goodsGoalsTab, 
               goodsComponentsTab,
               goodsConsumptionTab,
               goodsEquilibriumTab,
               goodsMultiplierTab,
               goodsGraphicalTab,
               goodsStabilizerTab
               ),
    navbarMenu("Financial Markets"),
    islmTab,
    policyAnalysisTab,
    mathPrereqTab,
    navbarMenu("Info",
               aboutTab)
    
  ) # close navbarPage
) # close taglist


## END