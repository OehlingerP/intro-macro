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
    theme = "general layout.css",
    title = div(class = "navbar-brand",
                tags$a(img(src = "logo-crane2.png", 
                           alt = "link to personal website"),
                       href = "https://www.peteroehlinger.com/",
                       target = "_blank")#,
                #div(
                  #h4("Peter Öhlinger"),
                  #p("PhD Candidate")
                #)
    ),
    tags$script(HTML("
      // Add 'scrolled' class to navbar on scroll
      document.addEventListener('scroll', function() {
        var navbar = document.querySelector('.navbar');
        if (window.scrollY > 0) {
          navbar.classList.add('scrolled');
        } else {
          navbar.classList.remove('scrolled');
        }
      });
    ")),
    # make navigation bar collapse on smaller screens
    windowTitle = "Peter Öhlinger - Intro Macro",
    collapsible = TRUE,
    
    header = tags$head(
      # sourcing css style sheet 
      #includeCSS("www/styles.css"),
      tags$link(rel = "icon", type = "image/png", href = "favicon-32x32.png")
      
      # include google analytics scripts
      #includeScript("google-analytics.js"), # GA 3 
      #HTML('<script async src="https://www.googletagmanager.com/gtag/js?id=G-KE1C59RLNS"></script>'),
      #includeScript("gtag.js") # GA 4 
      
    ),
    
    
    # order of tabs --------------------------------
    homeTab, 
    navbarMenu("Variables",
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
    navbarMenu("Financial Markets",
               financialGoalsTab,
               financialDemandUI,
               financialSupplyUI),
    navbarMenu("ISLM Model",
               islmGoalsTab,
               islmISCurveTab,
               islmLMCurveTab,
               islmToolTab#, 
               #islmPolicyTab
               ),
    mathPrereqTab,
    navbarMenu("Info",
               aboutTab,
               impressumTab)
    
  ) # close navbarPage
) # close taglist


## END