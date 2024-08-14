###############################################
#
# User interface for course goals
#
##############################################

goodsConsumptionTab <- tabPanel("Private Consumption", 
                          withMathJax(),
                          fluidPage(
                            tags$p("Recall the aggregate demand function \\(Z=C+I+G\\). 
                            We have not yet defined how consumption, investment, or 
                            government expenditure are determined. To develop our model for 
                            the goods market, we will treat investment, \\(I\\), and government 
                            expenditure, \\(G\\), as exogenous variables. This means that \\(I\\) 
                                   and \\(G\\) will be considered fixed parameters within the model.
                                   We will explore a more detailed treatment of investment later, 
                                   but, government expenditure will remain an exogenous factor. 
                                   This allows us to examine how fiscal policy, through changes in 
                                   government spending, can influence equilibrium output."),
                            tags$p("While investment and government expenditure are held constant, consumption (\\(C\\))
                                   will be determined endogenously within the model. In other words, consumption will be 
                                   calculated based on the equilibrium conditions of the model."),
                            fluidRow(
                              column(12, 
                                     p("Question: Why did we choose to determine consumption rather than investment within the model?"),
                                     p("Answer: Consumption is the largest component of aggregate demand, and accounts for 
                                     roughly 60% of GDP on average in OECD countries.")
                                     )
                              ),
                            tags$h3("What determines private consumption?"),
                            p("Consumption is mainly determined by disposable income \\(Y_D\\) of households.
                              Disposable income is defined by the difference between income \\(Y\\) and 
                              taxes \\(T\\):"),
                            withMathJax("$$Y_D := Y-T$$"),
                            fluidRow(
                              column(8,
                                     plotlyOutput("plotPrivateConsumption"),
                                     br(),
                                     textOutput("textStep1ConsumptionPlot"),
                                     textOutput("textStep2ConsumptionPlot")),
                              column(4, 
                                     h4("Exercise: Relationship between \\(C\\) and \\(Y_D\\)"),
                                     p("In the diagram on the left we have disposable income on the 
                                       x-axis and consumption on the y-axis. What functional form 
                                       would you use to describe the relationship? Keep in mind, that we want to 
                                       keep our model as simple as possible."),
                                     p("Once you formed your own prior check the checkboxes ``Step 1'' and 
                                       ``Step 2'' to find out what functional form we will be using and why."), 
                                     awesomeCheckbox("step1privateConsumption",
                                                      "Step 1"), 
                                     awesomeCheckbox("step2privateConsumption",
                                                      "Step 2"))
                            ),
                            p("From the exercise above we can now define our consumption function:"),
                            withMathJax("$$C = c_0 + c_1(Y_D) = c_0 + c_1(Y - T)$$")
                            
                          )
)