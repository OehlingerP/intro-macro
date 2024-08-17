###############################################
#
# User interface for course goals
#
##############################################

financialDemandUI <- tabPanel("Money Demand", 
                              withMathJax(),
                             fluidPage(
                               h2("Money Demand"),
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
                                            tags$li("In practice, securities exist in various forms, each with different maturities and yields. 
                                                    However, for the sake of simplicity, we will focus on a single type of security—safe assets 
                                                    such as U.S. or German government bonds. Later on, we will also introduce the concept of a risk-premium.")
                                            )
                                      ),
                                  tags$li(tags$strong("Real vs. Nominal:"),
                                          p("The difference between real and nominal value is best understood through an example. Imagine you receive a monthly 
                                            allowance of €75, and you enjoy buying coffee. If a cup of coffee costs €2.50, you can afford to buy one cup each day,
                                            totaling 30 cups a month. While you're holding €75 in cash, its real value is equivalent to 30 coffees."),
                                          p("Now, suppose the price of a cup of coffee rises to €3, but your allowance remains the same at €75. In nominal terms, 
                                            your money hasn't changed—you still have €75. However, its real value has decreased, as it can now only buy 25 coffees 
                                            instead of 30. This means you either have to cut back on your coffee consumption or ask for an increase in your allowance 
                                            to maintain the same purchasing power."),
                                          p("In summary, nominal value refers to the amount of money you have in your pocket or bank account, while real value refers 
                                            to what you can actually buy with that money. Ultimately, we care more about the goods and services we can purchase, rather 
                                            than just the amount of money we hold.")
                                  )
                                ),
                               h3("What determines how much money we hold?"),
                               p("To address this question, let's consider the role of cash and securities. Cash is valuable because it allows us to purchase goods
                                 and services immediately, but it doesn't earn any interest. In contrast, securities generate interest income but are illiquid—they 
                                 can't be directly used for transactions without first being sold and converted into cash. This creates a trade-off between liquidity 
                                 and earning potential."),
                               p("To find the optimal balance between holding cash and securities, we need to consider two key factors:"),
                               tags$ol(
                                 tags$li(p(tags$strong("Expected volume of transactions")),
                                         p("As the volume of transactions increases, so does the demand for money, since cash is required to complete these transactions. 
                                           The key determinant of transaction volume is nominal income (\\(PY\\), which represents the product of the price level and income).")),
                                 tags$li(p(tags$strong("The interest rate on securities"), "(the opportunity cost of holding money)"),
                                         p("When interest rates on securities rise, holding cash becomes less attractive, leading to a decrease in money demand as individuals 
                                            and businesses prefer to invest in interest-bearing securities."))
                               ),
                               p("This relationship can be expressed in the following formula:"),
                               withMathJax("$$M^d = PYL(i)$$,"),
                               p("Here, \\(M^d\\) represents the demand for money, \\(P\\) is the price level, and \\(Y\\) denotes real income. \\(L(i)\\) is a function that describes 
                                  consumers' liquidity preference, which depends on the interest rate. As the interest rate increases, the preference for holding liquid assets, or cash, decreases."),
                               fluidRow(
                                 column(8,
                                        plotlyOutput("plotMoneyDemand"),
                                        br(),
                                        textOutput("textStep1moneyDemandPlot"),
                                        textOutput("textStep2moneyDemandPlot"),
                                        textOutput("textStep3moneyDemandPlot")),
                                 column(4, 
                                        h4("Exercise: Money Demand and the relationship between \\(M^d\\) and \\(i\\)"),
                                        p("In the diagram on the left we have the quantity of money on the 
                                          x-axis and the interest rate on the y-axis. Given the above equation how could the 
                                          Money Demand curve look like?"),
                                        awesomeCheckbox("step1moneyDemand",
                                                        "Show Money Demand curve"), 
                                        p("Now that we know how the Money Demand curve looks like, what would happen if the 
                                          nominal income increases?"),
                                        awesomeCheckbox("step2moneyDemand",
                                                        "Show increase in nominal income"),
                                        p("What happens to the money demand curve if our preference for liquidity decreases (i.e., if we become less concerned about holding cash)?"),
                                        awesomeCheckbox("step3moneyDemand",
                                                        "Show decrease in liquidity preference"))
                               )
                               
                              )
                              
)
