###############################################
#
# User interface for ISLM model
#
##############################################

islmToolTab <- tabPanel("ISLM Model",
                    withMathJax(), 
                    fluidPage(
                      tags$h2("ISLM Model"),
                      p("Once we understand the IS curve and the LM curve, integrating them into a single graph becomes straightforward. We will illustrate 
                        this process using a numerical example. This tool calculates equilibrium output and allows you to observe the effects on both the 
                        goods and financial markets as you adjust various parameters."),
                      tags$p("We can solve for equilibrium output using the goods market equilibrium condition:"),
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
                     fluidRow(
                       fluidRow(
                         column(6,
                                h4("Goods Market"),
                                plotlyOutput("goodsMarketPlot")),
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
                                plotlyOutput("islmPlot")),
                         column(6, 
                                h4("Money Market"),
                                plotlyOutput("interestRatePlot"))
                       )
                     )
                     
                  )
)