###############################################
#
# User interface for islm goals
#
##############################################

islmGoalsTab <- tabPanel("Section Goals", 
                            withMathJax(),
                            fluidPage(
                              h2("Section Goals"),
                              tags$p("So far we have looked at the goods market and financial market separately. 
                             The two will meet in the ISLM model. We will now derive the ISLM model and explore how changes in the model's 
                             parameters affect the equilibrium of our economy."),
                              tags$p("The objectives of this section are as follows:"),
                              tags$ol(
                                tags$li(tags$strong("Derive the IS-LM Model:"), " Develop a comprehensive understanding 
                                        of the IS-LM framework and its components."),
                                tags$li(tags$strong("Analyze Parameter Effects:"), "Examine how variations in the model's 
                                        parameters influence the equilibrium of the economy."),
                                tags$li(tags$strong("Conduct Policy Analysis:"), "Utilize the model to analyze and evaluate 
                                        the potential impact of different economic policies.")
                                )
                              
                            )
                            
)