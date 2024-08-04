###############################################
#
# User interface for ISLM model
#
##############################################

islmTab <- tabPanel("ISLM",
                    mainPanel(
                     hr(),
                     tags$head(
                       tags$style(type="text/css", "label{ display: table-cell; text-align: center; vertical-align: middle; } .form-group { display: table-row;}")
                     ),
                     fluidRow(
                       column(6,
                              h4("Goods Market"),
                              plotOutput("goodsMarketPlot")),
                       column(2,
                              h4("Parameters ISLM"),
                              p("Define parameters of the ISLM model and change 
                                endogenous and exogenous paramters to see how 
                                those changes affect equilibrium output.")
                       ),
                       column(2,
                              h4("Model Parameters"),
                              numericInput("c_0_islm", label = withMathJax("$$c_0 = $$"), 
                                           value = 200, min = 100, max = 500, step = 10),
                              numericInput("c_1_islm", label = withMathJax("$$c_1 = $$"), 
                                           value = 0.5, min = 0.01, max = 0.99, step = 0.1),
                              numericInput("I_0_islm", label = withMathJax("$$I_0 = $$"), 
                                           value = 150, min = 0, max = 500, step = 10),
                              numericInput("I_1_islm", label = withMathJax("$$I_1 = $$"), 
                                           value = 0.2, min = 0.01, max = 0.99, step = 0.1),
                              numericInput("I_2_islm", label = withMathJax("$$I_2 = $$"), 
                                           value = 1000, min = 0, max = 10000, step = 100)
                       ),
                       column(2,
                              h4("Decision Variables"),
                              p("Parameters the government (G and T) and the Central Bank (i) can directly influence."),
                              numericInput("G_islm", label = withMathJax("$$G = $$"), 
                                           value = 200, min = 0, max = 500, step = 10),
                              numericInput("T_islm", label = withMathJax("$$T = $$"), 
                                           value = 100, min = 0, max = 500, step = 10),
                              numericInput("i_islm", label = withMathJax("$$i = $$"), 
                                           value = 0.02, min = -0.01, max = 0.5, step = 0.01)
                       )
                     ),
                     fluidRow(
                       column(6,
                              h4("IS and LM Curve"),
                              plotOutput("islmPlot")),
                       column(6, 
                              h4("LM Curve"),
                              plotOutput("interestRatePlot"))
                     ),
                     #plotOutput("islmPlot"),
                     textOutput("islmEquilibrium")
                     )
)

# islmTab <- tabPanel("ISLM",
#                     sidebarLayout(
#                       sidebarPanel(width = 3,
#                                    numericInput("islmSlope", label = h3("c_1 parameter"), 
#                                                 value = 0.5, min = 0.01, max = 0.99, step = 0.1),
#                                    numericInput("islmIntercept", label = h3("c_0 parameter"), 
#                                                 value = 150, min = 50, max = 500, step = 10)
#                       ),
#                       mainPanel(width = 6,
#                                 h3("This is the ISLM model"),
#                                 p("you can play arround and see what happens"),
#                                 
#                                 plotOutput("islmPlot"),
#                                 textOutput("islmEquilibrium")
#                       )
#                     )
# )