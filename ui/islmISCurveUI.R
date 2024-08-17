###############################################
#
# User interface for ISLM model
#
##############################################

islmISCurveTab <- tabPanel("IS Curve",
                    withMathJax(), 
                    fluidPage(
                      tags$h2("IS Curve"),
                      tags$p("Recall that in the goods market equilibrium, production equals demand, which can be 
       expressed as:"),
                      withMathJax("$$Y = Z \\Leftrightarrow Y = C(Y_d) + I + G,$$"),
                      tags$p("where, investments were initially considered exogenous, meaning they were treated as 
       fixed. To link the goods market with the financial market, we will make investments 
       endogenous, meaning they will depend on other variables within the model."),
                      tags$p("In reality, investments are influenced by two main factors:"),
                      tags$ol(
                        tags$li(tags$strong("Sales Volume:"), 
                                "When a company's sales volume increases, it often needs to expand production. This 
          might require investments in new machinery or production facilities."),
                        tags$li(tags$strong("Interest Rates:"), 
                                "High interest rates make borrowing more expensive. Consequently, companies may 
          cut back on their investments because financing new projects becomes costlier.")
                      ),
                      tags$p("For our purposes, we assume that investments depend on two factors: (i) sales volume 
       and (ii) interest rates. As sales volume increases, firms need to invest in new 
       machinery or facilities to meet production demands. Conversely, higher interest rates
       make borrowing less attractive, leading companies to cut back on investments."),
                      tags$p("With these considerations, our updated equilibrium condition becomes:"),
                      withMathJax("$$Y = C(Y_d) + I(Y, i) + G$$"),
                      tags$p("So, how do we derive the IS curve from this?"),
                      tags$p("Our objective is to connect the goods market with the financial market. In the goods
       market, we focus on determining output (i.e., GDP), while in the financial market, we 
       concentrate on the interest rate. By incorporating the interest rate into the goods 
       market analysis, we can combine the two markets effectively. We aim to relate the 
       equilibrium in the goods market to the interest rate. This involves varying the 
       interest rate while holding other factors constant, recording the resulting equilibrium 
       output, and plotting these values on the i-Y diagram."),
                      fluidRow(
                        fluidRow(
                          column(6,
                                 plotlyOutput("plotGoodsMarket")),
                          column(3, 
                                 p("Here is an example of the goods market. You can vary the interest rate and 
                                   observe how we move to new equilibria in the goods market. The results are than 
                                   transferred to the i-Y diagram below. Before you start varying the interest rate, what would you expect?"),
                                 numericInput("interestRateIS", "interest rate", value = 0.05, min = 0, max = 0.2, step = 0.01),
                                 actionButton("resetIS", "Reset")
                          )
                        ),
                        fluidRow(
                          column(6,
                                 plotlyOutput("plotIS")),
                          column(3,
                                 h5("The IS Curve"),
                                 p("On the left we record all goods market equilibria while varying the interest rate and holding everything 
                                   else constant. This is the IS curve.")
                          )
                        ),
                      )
                  )
)