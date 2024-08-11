###############################################
#
# User interface for Inflation intro
#
##############################################

introInflationTab <- tabPanel("Inflation", 
                            withMathJax(),
                            mainPanel(
                              p("Inflation is the rate at which the prices of goods and services increase,
                                meaning your money buys less over time. For example, if inflation is 2%, 
                                something that costs $100 today will cost, on average, $102 next year.
                                Inflation impacts our financial well-being by affecting purchasing power, 
                                savings returns, and the cost of borrowing."),
                              p("This is why it’s important to think in real terms rather than nominal terms. 
                                For example, imagine you receive a 10% pay raise, which sounds promising. 
                                However, if prices rise by 15% at the same time, your higher income isn’t 
                                enough to cover the increased cost of living. Consequently, even though you’re 
                                earning more nominally, your purchasing power has actually decreased, meaning 
                                you’re effectively earning less in real terms."),
                              p("We can calculate the price change from on period to the other by the following formula:"),
                              withMathJax("$$P_{t+1} = (1+\\pi)P_t$$"),
                              p("where \\(P_t\\) and \\(P_{t+1}\\) are the price levels in period \\(t\\) and
                                \\(t+1\\), respectively, and \\(\\pi\\) is the inflation rate. Rearranging yields:" ),
                              withMathJax("$$\\pi = \\frac{P_{t+1}}{P_t}-1 = \\frac{P_{t+1}-P_t}{P_t}$$"),
                              p("Thus, inflation is simply the change in prices from one period to the next. It’s important 
                                to understand that the inflation rate reported in the news typically reflects year-over-year 
                                changes. This means we compare prices from a specific month, such as December, with prices 
                                from December of the previous year. This annual comparison helps account for seasonal variations.
                                In contrast, month-on-month changes would involve comparing prices from one month, like November, 
                                to the next, such as December."),
                              fluidRow(
                                column(8,
                                       plotlyOutput("plotInflationWages")),
                                column(4, 
                                       selectInput("inflationWageSelector",
                                                   label = "Select Country", 
                                                   choices = ))
                              ),
                              
                              
                              
                              tags$p("correlation between wages and inflation; increase in workforce/low 
                                     unemployment might be bad for stock markets (why? because central
                                     banks may hike rates even more)"),
                              fluidRow(
                                column(8, plotlyOutput("plotInflationHistory")),
                                column(4,
                                       p("Select countries from the dropdown. Do you see any
                                         differences between countries?"),
                                       p("Question:"),
                                       tags$ol(
                                         tags$li("Can you explain why the fitted line is steeper for the U.S. than for Germany?"),
                                         tags$li("Does Ocuns Law ``hold'' for all countries?")
                                       ),
                                       pickerInput(
                                         inputId = "pickerInflationHistoric",
                                         label = "Select Countries: ",
                                         choices = countriesBis,
                                         selected = c("United States", "Germany", "Austria"),
                                         multiple = TRUE
                                       ),
                                       dateRangeInput(
                                         inputId = "dateRangeInflationHistoric",
                                         label = "Choose Date Range:",
                                         start = as.Date("2015-01-01"),
                                         end = Sys.Date(),
                                         min = as.Date("1914-01-01")) )
                              ),
                              fluidRow(
                                column(4, p("some text")),
                                column(8, plotlyOutput("plotInflationShareBelow2"))
                              )
                              
                              
                              
                              
                            )
                            
)
