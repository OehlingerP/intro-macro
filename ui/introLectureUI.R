###############################################
#
# User interface for introductory lecture
#
##############################################

countries <- sort(c("USA", "Austria", "Germany", "Brazil", "South Africa", "Japan"))

introLectureTab <- tabPanel("Intro Lecture", 
                            withMathJax(),
                            mainPanel(
                              tags$p("Macroeconomics is the study of the economy as a whole rather than focusing on 
                                     individual markets or firms. It focuses on 
                                     understanding how entire economies function and interact. In this course, 
                                     you’ll explore key concepts such as national income, inflation, unemployment, 
                                     and economic growth. We’ll examine how government policies, global events, and 
                                     other factors influence the overall health of an economy. By the end of this 
                                     course, you'll have a solid grasp of the major forces shaping our economic world
                                     and how they affect both individuals and societies."),
                              tags$h3("Course Goals"),
                              tags$ol(
                                tags$li("Understand key macroeconomic variables."),
                                tags$li("Analyze the interactions between these variables and develop skills to interpret economic news and articles."),
                                tags$li("Explore the short-term perspective of macroeconomics, focusing on scenarios where prices are assumed to be constant. (Question: How realistic is this assumption?")
                              ),
                              tags$h3("Example Articles"),
                              tags$p("Read the following articles (in German as the class is usually held in German) and "),
                              tags$ol(
                                tags$li(a(href = "https://www.diepresse.com/18728126/us-arbeitslosenquote-steigt-auf-hoechsten-stand-seit-fast-drei-jahren", "US-Arbeitslosenquote steigt auf höchsten Stand seit fast drei Jahren. (2. August, 2024). Die Presse.")),
                                tags$li(""),
                                tags$li("")
                              ),
                              tags$p("The first article explains that in the U.S., the unemployment rate can affect how the central 
                                     bank makes its decisions. The central bank, often called the Fed (short for Federal Reserve Bank), 
                                     has a goal of keeping the economy close to full employment. Thus, interest rates which are set by
                                     the Fed, can be influenced by a change in the unemployment rate."),
                              tags$h3("Gross Domestic Product (GDP)"),
                              
                              tags$h3("Inflation"),
                              
                              tags$h3("Unemployment Rate"),
                              
                              tags$h3("Interest Rate"),
                              
                              tags$h3("How the variables are connected"),
                              tags$h4("Inflation Rate and Interest Rate"),
                              fluidRow(
                                column(8, plotlyOutput("plotInterestInflation")),
                                column(4, 
                                       p("Select countries from the dropdown. Do you see any differences between countries?"),
                                       p("Question:"),
                                       tags$ol(
                                         tags$li("Can you explain why the fitted line is steeper for the U.S. than for Germany?"),
                                         tags$li("Does Ocuns Law ``hold'' for all countries?")
                                       ),
                                       pickerInput(
                                         inputId = "pickerInterestInflation",
                                         label = "Select Countries: ", 
                                         choices = countries,
                                         selected = "USA",
                                         multiple = FALSE
                                       ),
                                       numericInput(
                                         inputId = "numericLagInfInt",
                                         label = "Select lag: ",
                                         value = 0,
                                         min = -24,
                                         max = 24
                                       ),
                                       dataTableOutput("tabIntInfCorr") )
                              ),
                              tags$h4("Okuns Law"),
                              fluidRow(
                                column(8, plotlyOutput("plotOcunsLaw")),
                                column(4, 
                                       p("Select countries from the dropdown. Do you see any differences between countries?"),
                                       p("Question:"),
                                       tags$ol(
                                         tags$li("Can you explain why the fitted line is steeper for the U.S. than for Germany?"),
                                         tags$li("Does Ocuns Law ``hold'' for all countries?")
                                       ),
                                       pickerInput(
                                         inputId = "pickerOcun",
                                         label = "Select Countries: ", 
                                         choices = countries,
                                         selected = "USA",
                                         multiple = TRUE
                                       ))
                              )
                            
                            )
                            
                        )