###############################################
#
# User interface for Inflation intro
#
##############################################

introInflationTab <- tabPanel("Inflation", 
                            withMathJax(),
                            mainPanel(

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
                                         choices = countriesFred,
                                         selected = "United States",
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
