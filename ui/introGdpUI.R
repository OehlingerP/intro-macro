###############################################
#
# User interface for GDP intro
#
##############################################

introGdpTab <- tabPanel("Gross Domestic Product", 
                            withMathJax(),
                            mainPanel(
                              tags$h3("Gross Domestic Product (GDP)"),
                              
                              br(),
                              div(class = "btn-container",
                                  actionButton("prev_btn", "Previous"),
                                  actionButton("next_btn", "Next")
                              )
                              
                            )
                            
)