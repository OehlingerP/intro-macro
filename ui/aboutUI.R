###############################################
#
# UI for about us tab
#
###############################################

aboutTab <- tabPanel("About", value = "about",
                    sidebarPanel(width=1),
                    fluidPage(width=8,
                     
                     br(),
                     h3("About the author", style = "color:black; font-weight: 600"),
                     p("")
           )
  )#Tab panel