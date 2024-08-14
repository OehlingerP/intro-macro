###############################################
#
# User interface for the goods market stabilizer tab
#
##############################################

goodsStabilizerTab <- tabPanel("Automatic Stabilizers", 
                    withMathJax(),
                    fluidPage(
                      p("So far, we have developed a basic model of the goods market, focusing on the 
                        multiplier as a key mechanism. Next, we will extend our model by incorporating
                        automatic stabilizers&mdash;economic policies or features that automatically adjust 
                        to counteract fluctuations in economic activity, thereby reducing the severity of 
                        economic cycles."),
                      p("We will achieve this by modifying our assumptions about taxes. Previously, we 
                        assumed taxes were fixed and exogenous. To make our model more realistic, we will 
                        incorporate income-dependent taxes. For simplicity, we'll assume a linear 
                        relationship, even though progressive income taxes are more common in practice. Thus, 
                        we introduce the following tax function:"),
                      withMathJax("$$T = t_0 + t_1 Y,$$"),
                      p("where \\(t_0\\) represents a flat rate tax and \\(t_1\\) denotes the tax rate that 
                        varies with income \\(Y\\)."),
                      h4("How does the multiplier change?"),
                      p("As usual, we start from our demand function \\(Z = C+I+G\\) and our equilibrium 
                        condition \\(Y=Z\\) and then substitute our new tax function for \\(T\\):"),
                      HTML("$$\\begin{align}
                                  Y &= C + I + G\\\\
                                  Y &= c_0 + c_1(Y-T)+I+G\\\\
                                  Y &= c_0 + c_1(Y-(t_0 + t_1 Y))+I+G\\\\
                                  Y &= c_0 + c_1(Y-t_0 - t_1 Y))+I+G\\\\
                                  Y &= c_0 + c_1Y-c_1t_0 -c_1t_1Y +I +T\\\\
                                  Y-c_1Y +c_1t_1Y &= c_0 -c_1t_0 +I +T\\\\
                                  Y(1-c_1+c_1t_1) &= c_0 -c_1t_0 +I +T\\\\
                                  Y &= \\frac{1}{1-c_1+c_1t_1}(c_0 -c_1T +I +T)\\\\
                           \\end{align}$$"),
                      fluidRow(
                        column(12, p("Question: Is the multiplier larger or smaller compared to the model without income-dependent taxes?"))
                      )
                      
                    )
)