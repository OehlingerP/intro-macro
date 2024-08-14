###############################################
#
# User interface for the goods market multiplier tab
#
##############################################

goodsMultiplierTab <- tabPanel("Multiplier", 
                                withMathJax(),
                               fluidPage(
                                  p("When examining the equilibrium output, we observe that changes in exogenous parameters 
                      (\\(c_0\\), \\(I\\), \\(G\\), or \\(T\\)) do not lead to a one-to-one change in equilibrium 
                        output. Instead, these changes are amplified by a factor known as the", tags$strong("multiplier"), 
                                    ", which is given by \\(\\frac{1}{1-c_1}\\)."),
                                  fluidRow(
                                    column(8,
                                           uiOutput("partialGoodsMarket1"),
                                           uiOutput("partialGoodsMarket2"),
                                           uiOutput("partialGoodsMarket3"),
                                           uiOutput("partialGoodsMarket4")), 
                                    column(4,
                                           tags$h4("Exercise - Impact on Output"),
                                           p("To understand how a function changes with respect to one variable, we typically use 
                               the concept of the partial derivative. In this case, while you can intuitively gauge 
                               the impact of changes in variables on equilibrium output, applying partial derivatives 
                               provides a more precise tool, especially in more complex scenarios. Determine how changes 
                               in the following variables affect the equilibrium output:"),
                                           p("\\(Y = \\frac{1}{1-c_1}(c_0 -c_1T +I +T)\\)"),
                                           awesomeCheckboxGroup(
                                             inputId = "checkboxGroupPartial",
                                             label = "Select to see answer:", 
                                             choices = c("\\(c_0\\)", "\\(I\\)", "\\(G\\)", "\\(T\\)"),
                                             inline = T
                                           ))
                                  ),
                                  br(),
                                  p("The multiplier is a crucial concept of macroeconomics. Next to the mathematical
                        representation there is also an intuitive explanation. The multiplier effect in 
                        economics demonstrates how an initial increase in spending leads to a larger overall 
                        impact through a cyclical process. When you spend $100, that money becomes income for 
                        someone else, who then spends part of it, creating further income for others. This cycle 
                        of spending and re-spending amplifies the initial amount, resulting in a total economic 
                        growth greater than the original expenditure."),
                                  fluidRow()
                                )
)