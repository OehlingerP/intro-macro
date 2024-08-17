###############################################
#
# User interface for the goods market equilibrium tab
#
##############################################

goodsEquilibriumTab <- tabPanel("Goods Market Equilibrium", 
                    withMathJax(),
                    fluidPage(
                      h2("Goods Market Equilibrium"),
                      p("Restating what we have learned so far:"),
                      tags$ul(
                        tags$li("Demand Function: \\(Z = C + I + G\\)"),
                        tags$li("Consumption Function: \\(C = c_0 + c_1Y_D\\)"),
                        tags$li("Disposable Income: \\(Y_D = Y - T\\)")
                      ), 
                      p("Combining the above equations yield the aggregate demand function:"),
                      withMathJax("$$Z = c_0 + c_1(Y - T) + I + G$$"),
                      p("However, we now face a situation with one equation and two unknowns (\\(Z\\) and \\(Y\\)).
                        To resolve this, we need to incorporate the equilibrium condition: supply equals demand. 
                        While we have defined the demand side of the equation, we still need to define the supply side."),
                      p("In this context, ``supply'' refers to the total supply of goods and services, which is represented 
                        by GDP. Therefore, at equilibrium, the total production of goods (GDP) must equal the total demand 
                        for goods. Thus, our equilibrium condition is:"),
                      withMathJax("$$Y=Z$$"),
                      fluidRow(class = "question",
                        column(12, 
                               p("Question: Why do we denote both, income and production, by \\(Y\\)?"), 
                               actionBttn(
                                 inputId = "a1goodsEqBttn",
                                 label = "Show Answer", 
                                 style = "minimal",
                                 color = "danger"
                               ),
                               textOutput("a1goodsEq"))
                      ),
                      p("Combining the equilibrium condition and the aggregate demand function we can finally solve for 
                        equilibrium output in the economy:"),
                      HTML("$$\\begin{align}
                                  Y &= c_0 + c_1(Y-T)+I+G\\\\
                                  Y &= c_0 + c_1Y-c_1T +I +T\\\\
                                  Y-c_1Y &= c_0 -c_1T +I +T\\\\
                                  Y(1-c_1) &= c_0 -c_1T +I +T\\\\
                                  Y &= \\frac{1}{1-c_1}(c_0 -c_1T +I +T)\\\\
                           \\end{align}$$")
                    )
)