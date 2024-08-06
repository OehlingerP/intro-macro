###############################################
#
# User interface for interest rates intro
#
##############################################

introRatesTab <- tabPanel("Interest Rates", 
                            withMathJax(),
                            mainPanel(
                             
                              tags$h3("Interest Rate"),
                              
                              
                              
                              br(),
                              div(class = "btn-container",
                                  actionButton("prev_btn", "Previous"),
                                  actionButton("next_btn", "Next")
                              )
                              
                            )
                            
)