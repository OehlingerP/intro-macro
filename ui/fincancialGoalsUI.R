###############################################
#
# User interface for course goals
#
##############################################

financialGoalsTab <- tabPanel("Section Goals", 
                            withMathJax(),
                            fluidPage(
                              h3("Section Goals"),
                              tags$p("Before delving into the IS-LM model, it's essential to understand the role of financial 
                                     markets in the broader economic framework. Financial markets are crucial as they channel
                                     funds from savers to borrowers, influencing investment decisions, interest rates, and overall
                                     economic activity. By examining how these markets function, we can better grasp how changes
                                     in financial conditions impact the real economy. This foundational understanding will set
                                     the stage for analyzing the IS-LM model, which integrates the dynamics of both the goods 
                                     and financial markets to provide a comprehensive view of macroeconomic equilibrium and 
                                     policy effects in the short run."),
                              tags$p("The objectives of this section are as follows:"),
                              tags$ol(
                                tags$li(tags$strong("Analyzing Money Demand and Supply:"), "Explore money demand by  examining 
                                        factors such as transaction needs, precautionary motives, and speculative behavior that 
                                        influence the demand for money, alongside how central bank policies and other mechanisms 
                                        affect the money supply."),
                                tags$li(tags$strong("Examining Monetary Policy:"), "To investigate how central banks 
                                        use monetary policy tools to impact financial markets, interest rates, and broader 
                                        economic conditions."),
                                tags$li(tags$strong("Exploring the Role of Commercial Banks:"), "To understand how commercial 
                                        banks contribute to the economy through their functions in deposit-taking, lending,
                                        and money creation, and how their operations impact monetary policy, financial 
                                        stability, and overall economic activity.")
                                )
                              
                            )
                            
)