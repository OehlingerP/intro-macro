###############################################
#
# User interface for course goals
#
##############################################

financialMoneyUI <- tabPanel("Money Demand", 
                              withMathJax(),
                             fluidPage(
                                tags$p("Before we delve into money demand, let's review some fundamental 
                                      concepts related to money and securities:"),
                                tags$ol(
                                  tags$li(tags$strong("Money:"), 
                                          tags$ul(
                                            tags$li("Money serves three main functions:"),
                                            tags$ul(
                                              tags$li("Medium of exchange"),
                                              tags$li("Unit of account"),
                                              tags$li("Store of value")
                                            ),
                                            tags$li("Money can be used directly to purchase goods."),
                                            tags$li("Money is highly liquid, meaning it is readily available and can be used as a medium of exchange at any time."),
                                            tags$li("Forms of money include cash and demand deposits (checking accounts).")
                                          )
                                  ),
                                  tags$li(tags$strong("Securities:"), 
                                          tags$ul(
                                            tags$li("Securities cannot be used directly for transactions and are therefore less liquid than money."),
                                            tags$li("Securities generate positive interest income."),
                                            tags$li("Government bonds are an example of interest-bearing securities."),
                                            tags$li("In practice, securities come in various forms with different maturities and yields. For simplicity, we will assume there is only one type of security.")
                                          )
                                  )
                                )
                                
                              )
                              
)
