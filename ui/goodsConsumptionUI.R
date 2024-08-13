###############################################
#
# User interface for course goals
#
##############################################

goodsConsumptionTab <- tabPanel("Private Consumption", 
                          withMathJax(),
                          mainPanel(
                            tags$p("In this section, we will develop a model of the goods market with a focus on 
                                     the short term. Before outlining the specific objectives, let's briefly discuss
                                     the role of economic models. Economic models are simplified representations of 
                                     reality. They are not intended to capture every detail of the real world but 
                                     rather to clarify economic relationships in a more straightforward manner. In 
                                     this course, our aim is to build a general understanding of macroeconomic interactions,
                                     specifically how government policies and central bank actions can impact the economy.
                                     It’s important to remember this perspective as we introduce new features or assumptions
                                     along the way."),
                            tags$p("The objectives of this section are as follows:"),
                            tags$ol(
                              tags$li(tags$strong("Understanding Macroeconomic Cyclical Relationships:"), "To gain insights 
                                        into the cyclical relationships within the macroeconomy, such as how 
                                        fluctuations in aggregate demand influence overall output and employment."),
                              tags$li(tags$strong("Analyzing Policy Effects:"), "Explore how fiscal policy measures (such as 
                                        government spending and taxation) impact aggregate demand and income."),
                              tags$li(tags$strong("Comprehensive Analysis:"), "By the end of this section, you will be capable of 
                                        solving the model using formal methods, graphical techniques, and verbal 
                                        explanations, offering a well-rounded approach to analyzing the goods market.")
                            )
                            
                          )
                          
)