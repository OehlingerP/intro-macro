###############################################
#
# User interface for course goals
#
##############################################

financialSupplyUI <- tabPanel("Money Supply", 
                              withMathJax(),
                             fluidPage(
                               h2("Money Supply"),
                               p("Money is supplied by banks, which can be categorized into two main types: central banks and commercial banks. 
                               For now, we will focus solely on the central bank as the sole provider of money, assuming a cash-only economy. 
                                 While this assumption deviates from real-world scenarios, it allows us to explore how the central bank influences
                                 the economy without considering the complexities introduced by commercial banks. Although this approach excludes 
                                 the role of commercial banks, it does not significantly affect our understanding of central bank interventions in the economy."),
                               fluidRow(class = "question",
                                        column(12, 
                                               p("Question: Read the article",
                                                 a(href = "https://www.ecb.europa.eu/ecb-and-you/explainers/tell-me/html/what-is-a-central-bank.en.html", 
                                                     "What is a Central Bank?", target = "_blank"), 
                                                   "and state the goals of a central bank and explain the term `lender of last resort'.")), 
                                               actionBttn(
                                                 inputId = "a1FinancialSupplyBttn",
                                                 label = "Show Answer", 
                                                 style = "minimal",
                                                 color = "danger"
                                               ),
                                               textOutput("a1FinancialSupply")),
                               p("We distinguish between two methods through which central banks can intervene in financial markets:"),
                               tags$ol(
                                 tags$li(p(tags$strong("Interest Rate Control:")),
                                         tags$ul(
                                         tags$li(p(("Mechanism"),": The central bank sets a target interest rate and 
                                                   adjusts the money supply to match the public's demand at this rate.")),
                                         tags$li(p(("Implication"), ": In this case, the money supply is endogenously 
                                         determined based on the prevailing interest rate. The central bank reacts to changes in 
                                         money demand to keep the interest rate stable.")))),
                                 tags$li(p(tags$strong("Money Supply Control:")),
                                         tags$ul(
                                           tags$li(p(("Mechanism"),": The central bank directly sets the total amount of 
                                                     money available in the economy.")),
                                           tags$li(p(("Implication"), ": The interest rate adjusts based on the money supply 
                                                     and demand. Here, the central bank focuses on controlling the quantity of money rather 
                                                     than the interest rate."))))),
                               h3("Equilibrium on the Financial Market"),
                               p("Similar to the goods market, on the financial market supply equals demand in equilibrium. 
                                 This results in the following equilibrium condition:"),
                               withMathJax("$$M^S = PYL(i)$$"),
                               fluidRow(
                                 column(8,
                                        plotlyOutput("plotCbControl"),
                                        br(),
                                        textOutput("textStep1CbControlPlot"),
                                        textOutput("textStep2CbControlPlot")),
                                 column(4, 
                                        h4("Exercise: Central Bank Control"),
                                        p("In the diagram on the left we have the quantity of money on the 
                                          x-axis and the interest rate on the y-axis. How would the `money 
                                          supply' curve look like if the central banks targets interest rates
                                          or money supply?"),
                                        selectInput("cbControlSelector",
                                                    "Select central bank control mechanism",
                                                    choices = c("Starting Position", "Interest Rate Control", "Money Supply Control"))
                                        )
                               ),
                               h3("Monetary Policy"),
                               p("Now that we've explored the tools of a central bank, let's consider how these are 
                                 applied in practice to manage the money supply and interest rates. Central banks 
                                 implement monetary policy primarily through open market operations, where they buy 
                                 or sell securities on the open market. These actions directly affect short-term 
                                 interest rates, which then ripple through to influence longer-term rates and overall 
                                 economic activity. We distinguish between expansive and contractive open market 
                                 operations:"),
                               tags$ol(
                                 tags$li(p(tags$strong("Expansive Open Market Operations:")),
                                         tags$ul(
                                           tags$li(p("Increase in the money supply / reduction in the interest rate")),
                                           tags$li(p("Securities purchases by the central bank are referred to as 
                                                     expansionary monetary policy, as they increase the supply of money.
                                                     The central bank buys these securities by paying for them with newly 
                                                     created money."))
                                         )),
                                 tags$li(p(tags$strong("Contractive Open Market Operations:")),
                                         tags$ul(
                                           tags$li(p("Reduction in the money supply / increase in the interest rate")),
                                           tags$li(p("Sales of securities by the central bank are referred to as contractionary
                                                     monetary policy, as they reduce the supply of money. CB sells securities and 
                                                     withdraws the money received from the economic cycle."))
                                         ))
                               ),
                               fluidRow(
                                 column(4, 
                                        h4("Exercise: Central Bank Control"),
                                        p("In the diagram on the left we have the quantity of money on the 
                                          x-axis and the interest rate on the y-axis. How would an expansive monetary 
                                          policy look like for (i) interest rate control, (ii) money supply control?"),
                                        selectInput("cbExpansiveSelector",
                                                    "Select central bank control mechanism",
                                                    choices = c("Starting Position", "Interest Rate Control", "Money Supply Control")),
                                        p("Given your selected control mechanism, what would happen to the equilibrium interest rate
                                          if nominal income (\\(PY\\)) increases?"),
                                        awesomeCheckbox("step3CbExpansive",
                                                       "Show increase in nominal income")
                                 ),
                                 column(8,
                                        plotlyOutput("plotCbExpansive"),
                                        br(),
                                        uiOutput("textStep1CbExpansivePlot"),
                                        uiOutput("textStep2CbExpansivePlot"),
                                        uiOutput("textStep3CbExpansivePlot"),
                                        uiOutput("textStep4CbExpansivePlot"))
                               )
                               
                              )
                              
)
