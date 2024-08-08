###############################################
#
# User interface for course goals
#
##############################################

introGoalsTab <- tabPanel("Intro", 
                            withMathJax(),
                            mainPanel(
                              tags$p("Macroeconomics is the study of the economy as a whole rather than focusing on 
                                     individual markets or firms. It focuses on understanding how entire economies 
                                     function and interact. In this course, you’ll explore key concepts such as 
                                     national income, inflation, unemployment, and economic growth. We’ll examine 
                                     how government policies, global events, and other factors influence the overall 
                                     health of an economy. By the end of this course, you'll have a solid grasp of 
                                     the major forces shaping our economic world and how they affect both individuals
                                     and societies."),
                              tags$h3("Course Goals"),
                              tags$p("This course is not about math. We will need some math but this is really simple 
                                     math (see Math Prerequisites). This course can be called a success if you:"),
                              tags$ol(
                                tags$li("understand key macroeconomic variables."),
                                tags$li("are able to describe the general interactions between those variables"),
                                tags$li("are able to read and interpret economic news articles and reports such as the ", 
                                        a(href = "https://www.imf.org/en/Publications/WEO/Issues/2024/07/16/world-economic-outlook-update-july-2024", 
                                          "World Economic Outlook"))
                                ),
                              tags$h3("Example Articles"),
                              tags$p("Read the following articles (in German as the class is usually held in German) and answer the questions below:"),
                              tags$ol(
                                tags$li(a(href = "https://www.diepresse.com/18728126/us-arbeitslosenquote-steigt-auf-hoechsten-stand-seit-fast-drei-jahren", "US-Arbeitslosenquote steigt auf höchsten Stand seit fast drei Jahren. (2. August, 2024). Die Presse.")),
                                tags$li(""),
                                tags$li("")
                              ),
                              tags$p("The first article explains that in the U.S., the unemployment rate can affect how the central 
                                     bank makes its decisions. The central bank, often called the Fed (short for Federal Reserve Bank), 
                                     has a goal of keeping the economy close to full employment. Thus, interest rates which are set by
                                     the Fed, can be influenced by a change in the unemployment rate.")
                              
                            )
                            
)