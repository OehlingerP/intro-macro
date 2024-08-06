###############################################
#
# User interface for the Shiny app
#
##############################################

countries <- sort(c("USA", "Austria", "Germany", "Brazil", "South Africa", "Japan"))

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
      
      # TODO: OUTSOURCE IN OWN CSS FILE center navigation buttons
      tags$style(HTML(
        "
      .btn-container {
        text-align: center;
        margin-top: 20px;
      }
      .btn-container .action-button {
        margin: 0 10px;
      }
      "
      )),
      # navigation buttons
      tags$script(HTML(
        "
      Shiny.addCustomMessageHandler('navigatePage', function(message) {
        var tabIndex = $('.navbar-nav .active').index();
        var tabCount = $('.navbar-nav li').length;

        if (message.direction == 'next') {
          if (tabIndex < tabCount - 1) {
            $('.navbar-nav li').eq(tabIndex + 1).find('a').click();
          }
        } else if (message.direction == 'prev') {
          if (tabIndex > 0) {
            $('.navbar-nav li').eq(tabIndex - 1).find('a').click();
          }
        }
      });
      "
      )),
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
               introRatesTab,
               introInflationTab,
               introExercisesTab),
    goodsMarketTab,
    islmTab,
    policyAnalysisTab,
    mathPrereqTab,
    navbarMenu("Info",
               aboutTab)
    
  ) # close navbarPage
) # close taglist


## END