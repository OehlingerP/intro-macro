###############################################
#
# User interface for GDP intro
#
##############################################

introGdpTab <- tabPanel("Gross Domestic Product", 
                            withMathJax(),
                            mainPanel(
                              tags$p("GDP, or Gross Domestic Product, is the total value 
                                     of all goods and services produced within a country 
                                     in a specific time period, usually a year or quarter."),
                              tags$p("There are three ways to calculate GDP:"),
                              tags$ol(
                                tags$li(tags$strong("Expenditure Method:") , " This method calculates GDP by adding up the total value of all 
                                        consumption goods and services produced in an economy. It focuses on final goods, which are intended
                                        for direct consumption, and excludes intermediate goods, which are used to produce other goods."),
                                tags$li(tags$strong("Output Method:") , " GDP is measured by summing all value added across different stages 
                                        of production in the economy. Value added is the difference between the total value of 
                                        production and the value of intermediate goods used in the production process."),
                                tags$li(tags$strong("Income Method:") , " This approach calculates GDP by adding up all factor incomes earned 
                                        in the production of goods and services. Factor income refers to earnings derived from the inputs used 
                                        in production, such as labor income (wages) and capital income (interest).")
                              ),
                              tags$p(""),
                              fluidRow(
                                column(8,
                                       dataTableOutput("tableGDP"),
                                       br(),
                                       uiOutput("gdpFormula"),),
                                column(4, 
                                       h4("Exercise - GDP Calculation"),
                                       p("The three approaches are best explained by an example. Consider the closed economy on the left
                                          where steel is produced to be used in car production. Calculate the GDP of the economy according 
                                          to the three methods described above."),
                                       p("To check your results, select a calculation method below to see 
                                          what needs to be added (green) and subtracted (red) in each method."),
                                       selectInput("selectGDPCalcMethod", 
                                                   label = "Select Calculation Method: ", 
                                                   choices = c("None", "Expenditure Method", "Output Method", "Income Method"),
                                                   selected = "None"))
                              ),
                              tags$p("In summary, GDP can be calculated by summing the total value of final goods produced, the total value
                                       added, and the total income generated.", tags$strong("It is crucial to understand that income equals 
                                       production"),"; this relationship will be leveraged in subsequent classes to determine equilibrium in the goods market. This 
                                       principle also explains why GDP is used as a measure of economic welfare: higher production in an economy 
                                       corresponds to higher income levels."),
                              fluidRow(
                                column(8,
                                       plotlyOutput("plotGdpGini")), 
                                column(4, 
                                       tags$h4("Exercise - Welfare"), 
                                       tags$p("It was previously mentioned that GDP is often used as a measure of welfare. 
                                     Since GDP is equivalent to total income of an economy, a higher GDP implies higher income 
                                     levels. However, using GDP as a measure of overall welfare can be problematic. 
                                     What are some potential shortcomings of using GDP alone to assess the well-being of a population?"))
                              ),
                              tags$h3("Real vs. Nominal GDP"),
                              tags$p("Now that we have an understanding of how GDP is calculated we can look at two measures of GDP:"),
                              tags$ol(
                                tags$li(tags$strong("Nominal GDP"), " total production at current prices"),
                                tags$li(tags$strong("Real GDP"), " total production at constant prices")
                              ),
                              tags$p("Calculation of nominal GDP:"),
                              withMathJax("$$\\$Y_t = P_tY_t = \\sum_{g\\in G} p_{g,t}y_{g,t},$$"),
                              tags$p(
                                "where ", withMathJax("G"), " is the set of final goods produced in the economy, e.g., cars in the above example. ",
                                withMathJax("t"), " is the time period considered, e.g., a certain year or quarter. ",
                                withMathJax("p_{g,t}"), " is the price of good ", withMathJax("g"), " in period ", withMathJax("t"), ", and ",
                                withMathJax("y_{g,t}"), " is the production of good ", withMathJax("g"), " in period ", withMathJax("t"), ". ",
                                "Thus, we multiply the number of goods produced by their current price and add them up."
                              ),
                              tags$p("Question: Why might nominal GDP increase/decrease?"),
                              tags$ol(
                                tags$li("Changes in production"),
                                tags$li("Changes in prices")
                              ),
                              tags$p("The problem with nominal GDP is that changes in prices distort the measurement of production growth. This is 
                                     why most of the time we look at real GDP. GDP is calculated the same way as above but now we fix prices at a 
                                     specific year or quarter:"),
                              withMathJax("$$Y_t = P_tY_t = \\sum_{g\\in G} p_{g,0}y_{g,t}$$"),
                              tags$p("Changes in real GDP only reflect changes in production."),
                              fluidRow(
                                column(4, 
                                       tags$h4("Exercise - U.S. GDP"),
                                       tags$p("The chart on the right shows U.S. real and nominal GDP over time."),
                                       tags$ol(
                                         tags$li("Why is the curve for nominal GDP steeper than for real GDP?"),
                                         tags$li("Why are real and nominal GDP the same in 2017?")
                                       )),
                                column(8, 
                                       plotlyOutput("plotGdpUS")))
                              
                              
                            )
                            
)
