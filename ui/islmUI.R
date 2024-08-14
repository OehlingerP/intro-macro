###############################################
#
# User interface for ISLM model
#
##############################################

islmTab <- tabPanel("ISLM Model",
                    withMathJax(), 
                    fluidPage(
                      #tags$h2("Introduction to the ISLM Model"),
                      tags$p("We will now derive the IS-LM model and explore how changes in the model's 
                             parameters affect the equilibrium of our economy. The tool at the end will 
                             help you understand the model better and allow you to review your assignments 
                             before submitting them."),
                      tags$p("Before we start, a note of caution: We will derive the IS-LM model but will not discuss every detail extensively. 
                             The goal is to gain a general understanding of how the model works. For a more detailed introduction to the IS-LM model, 
                             refer to Chapter 5 of Blanchard and Illing (2021). Note that the book is in German and available via",
                             tags$a(href = "https://elibrary-1pearson-1de-1lwzuk0ln032a.han.ubl.jku.at/book/99.150005/9783863263249", "LISSS"), "."),
                      tags$h3("The IS Curve"),
                      tags$p("So far we have looked at the goods market and financial market separately. 
                             The two will meet in the ISLM model. Recall that from the goods market 
                             equilibrium we had that in equilibrium production equals demand:"),
                      withMathJax("$$Y=Z\\Leftrightarrow Y = C(Y_d)+\\bar I + G,$$"),
                      tags$p("where we assumed that investments as exogenous, meaning they were considered fixed. 
                             In order to connect the goods market with the financial market, we will make investments 
                             endogenous, so they depend on other variables in the model."),
                      tags$p("In reality, investments mainly depend on two factors:"),
                      tags$ol(
                        tags$li(tags$strong("Sales Volume:"), 
                                " When a company’s sales volume increases, it often needs to expand production. To do this, the company might invest in new machinery or production facilities."),
                        tags$li(tags$strong("Interest Rates:"), 
                                " High interest rates make borrowing more expensive. As a result, companies may cut back on investments because it costs more to finance new projects.")
                      ),
                      tags$p("In the following we assume that investments mainly depend on two factors (i) sales volume and (ii) interest rates.
                             The higher the sales volume of a company the more it needs to produce and for this 
                             a firm might need to invest in new machinery or production plants. On the other hand, high
                             interest rates make credits less attractive and companies will reduce their investments."),
                      tags$p("With this in mind our new equilibrium condition becomes:"),
                      withMathJax("$$Y = C(Y_d) + I(Y,i) + G$$"),
                      tags$p("How do we get from here to the IS curve?"),
                      tags$p("Our goal is to connect the goods market with the financial market. On the goods market, we focus 
                              on determining output (i.e., GDP), while on the financial market, we primarily concentrate on the 
                              interest rate. Now that we have incorporated the interest rate into the goods market analysis, we 
                              can effectively combine the two markets. We want to relate the equilibria in the goods market to 
                             the interest rate. This can be done by varying the interest rate in the goods market while holding everything else 
                             fixed. We then record the interest rate and the associated equilibrium output value and draw them in the i-Y diagram."),
                      
                      
                      fluidRow(
                        column(6,
                               plotOutput("plotGoodsMarket")),
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
                               plotOutput("plotIS")),
                        column(3,
                               h5("The IS Curve"),
                               p("On the left we record all goods market equilibria while varying the interest rate and holding everything 
                                 else constant. This is the IS curve.")
                        )
                      ),
                      tags$h3("The LM Curve"),
                      tags$p("The LM curve represents all equilibria in the money market. We have the following equilibrium condition:"),
                      withMathJax("$$M = PYL(i)\\Leftrightarrow\\frac{M}{P} = YL(i)$$"),
                      tags$p("where \\(M\\) is the money supply, \\(P\\) are prices and \\(L\\) is the liquidity preference which depends on the interest rate. 
                             Thus, in equilibrium real money supply equals real money demand. As central banks directly control the interest rate, 
                             rather than money supply, we will also assume it here. This makes our derivation of the LM curve quite easy as it is 
                             just a flat line. The central bank just sets the interest rate according to its policy goals."),
                      
                      tags$h3("Example:"),
                      tags$p("Let's look at a numerical example:"),
                      tags$p("The model parameters be given as below. We can solve for equilibrium output using the goods market equilibrium condition:"),
                      HTML("$$\\begin{align}
                              Z &= Y \\\\
                              \\Leftrightarrow Y &= c_0 + c_1(Y-T)+I_0+I_1Y-I_2i+G \\\\
                              \\Leftrightarrow Y-c_1Y-I_1Y &= c_0 - c_1T+I_0-I_2i+G\\\\
                              \\Leftrightarrow Y(1-c_1-I_1) &= c_0 - c_1T+I_0-I_2i+G\\\\
                              \\Leftrightarrow Y &= \\frac{1}{1-c_1-I_1}(c_0 - c_1T+I_0-I_2i+G)
                           \\end{align}$$"),
                      
                      tags$p("Plugging in the values from below yields:"),
                      uiOutput("dynamicEquilibriumFormula"),
                      
                      tags$p("This tool combines the two markets in the ISLM model. Vary the parameters and see how they impact equilibrium output!"),
                     hr(),
                     fluidRow(
                       column(6,
                              h4("Goods Market"),
                              plotOutput("goodsMarketPlot")),
                       column(2,
                              h4("Parameters ISLM"),
                              p("Define parameters of the ISLM model and change 
                                endogenous and exogenous paramters to see how 
                                those changes affect equilibrium output."),
                              textOutput("islmEquilibrium")
                       ),
                       column(2,
                              h4("Model Parameters (Intercept)"),
                              numericInput("c0_islm", label = withMathJax("$$c_0 = $$"), 
                                           value = 200, min = 100, max = 500, step = 50),
                              
                              numericInput("I0_islm", label = withMathJax("$$I_0 = $$"), 
                                           value = 150, min = 0, max = 500, step = 50),
                              
                              numericInput("I2_islm", label = withMathJax("$$I_2 = $$"), 
                                           value = 1000, min = 0, max = 10000, step = 50),
                              h4("Model Parameters (Slope)"),
                              numericInput("c1_islm", label = withMathJax("$$c_1 = $$"), 
                                           value = 0.5, min = 0.01, max = 0.99, step = 0.1),
                              numericInput("I1_islm", label = withMathJax("$$I_1 = $$"), 
                                           value = 0.2, min = 0.0, max = 0.99, step = 0.1)
                       ),
                       column(2,
                              h4("Decision Variables"),
                              p("Parameters the government (G and T) and the Central Bank (i) can directly influence."),
                              numericInput("G_islm", label = withMathJax("$$G = $$"), 
                                           value = 200, min = 0, max = 500, step = 50),
                              numericInput("T_islm", label = withMathJax("$$T = $$"), 
                                           value = 100, min = 0, max = 500, step = 50),
                              numericInput("i_islm", label = withMathJax("$$i = $$"), 
                                           value = 0.02, min = -0.01, max = 0.5, step = 0.02)
                       )
                     ),
                     fluidRow(
                       column(6,
                              h4("IS and LM Curve"),
                              plotOutput("islmPlot")),
                       column(6, 
                              h4("Money Market"),
                              plotOutput("interestRatePlot"))
                     )
                     
                  )
)