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
                                #tags$p("correlation between wages and inflation; increase in workforce/low 
                                #     unemployment might be bad for stock markets (why? because central
                                #     banks may hike rates even more)"),
                                fluidRow(
                                  column(8, plotlyOutput("plotInflationHistory")),
                                  column(4,
                                         p("Following the pandemic, many Austrians expressed concerns about high and persistent inflation. 
                                         Use the dropdown menu below to compare Austria’s inflation with that of other European countries 
                                         to see if these concerns were justified. Additionally, compare Austria’s situation 
                                         to Turkey's. Find one reason for the hyperinflation in Turkey and think about what it means for
                                         people living their."),
                                         pickerInput(
                                           inputId = "pickerInflationHistoric",
                                           label = "Select Countries: ",
                                           choices = countriesBis,
                                           selected = c("Austria"),
                                           multiple = TRUE
                                         ),
                                         dateRangeInput(
                                           inputId = "dateRangeInflationHistoric",
                                           label = "Choose Date Range:",
                                           start = as.Date("2015-01-01"),
                                           end = Sys.Date(),
                                           min = as.Date("1914-01-01")) )
                                ),
                                tags$h3("Other Price Indices"),
                                p("When discussing inflation, people typically refer to consumer prices, which are the costs consumers pay for 
                                  goods and services. However, there are other price measures to consider. For example, we can look at producer 
                                  prices, which reflect the cost of goods at the wholesale level, or the GDP deflator, which compares nominal GDP 
                                  to real GDP. Unlike consumer prices, the GDP deflator accounts for exports (goods produced domestically but 
                                  sold abroad) while excluding imports (goods produced abroad but consumed domestically). The GDP Deflator is 
                                  calculated as an index and reflects the difference between real and nominal GDP:"),
                                withMathJax("$$\\text{GDP Deflator} = \\frac{\\text{Nominal GDP}}{\\text{Real GDP}} \\cdot 100$$")
                                # fluidRow(
                                #   column(8,
                                #          plotlyOutput("plotInflationWages")),
                                #   column(4, 
                                #          selectInput("inflationWageSelector",
                                #                      label = "Select Country", 
                                #                      choices = meta_fred %>%
                                #                        filter(variable %in% c("Inflation Rate", "Labor Compensation (Manufacturing)")) %>%
                                #                        group_by(country) %>%
                                #                        mutate(count = 1,
                                #                               count = sum(count)) %>%
                                #                        filter(count == 2) %>%
                                #                        select(country) %>%
                                #                        unique() %>%
                                #                        unlist() %>%
                                #                        unname() %>%
                                #                        sort(),
                                #                      selected = "United States"))
                                # ),
                                # fluidRow(
                                #   column(4, p("some text")),
                                #   column(8, plotlyOutput("plotInflationShareBelow2"))
                                # )
                                
                                
                                
                                
                              )
                              
)
