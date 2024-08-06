###############################################
#
# UI for about us tab
#
###############################################

aboutTab <- tabPanel("About", value = "about",
                    sidebarPanel(width=1),
                    mainPanel(width=8,
                     
                     br(),
                     h3("About the author", style = "color:black; font-weight: 600"),
                     p(""),
                     br(),
                     div(class = "btn-container",
                         actionButton("prev_btn", "Previous")
                     )
           )
  )#Tab panel