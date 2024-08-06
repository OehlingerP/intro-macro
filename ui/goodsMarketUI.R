###############################################
#
# User interface for the goods market
#
##############################################

goodsMarketTab <- tabPanel("Goods Market",
                    withMathJax(), 
                    mainPanel(
 
                      
                      br(),
                      div(class = "btn-container",
                          actionButton("prev_btn", "Previous"),
                          actionButton("next_btn", "Next")
                      )
                    )
)
