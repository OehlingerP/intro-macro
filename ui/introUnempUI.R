###############################################
#
# User interface for unemployment intro
#
##############################################

introUnempTab <- tabPanel("Unemployment Rate", 
                            withMathJax(),
                            mainPanel(
                              
                              tags$h3("Unemployment Rate"),
                              
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
                                         choices = countriesFred,
                                         selected = "United States",
                                         multiple = TRUE
                                       ))
                              ),
                              fluidRow(
                                column(4,
                                       pickerInput(
                                         inputId = "pickerLaborUS",
                                         label = "Select Variables: ", 
                                         choices = c("Unemployment Rate", "Labor Force Participation Rate"),
                                         selected = "Unemployment Rate",
                                         multiple = FALSE
                                       ),
                                       p("Question 1: Find three reasons for the sharp drop of the unemployment rate after the first lockdown in 2020."),
                                       p("Quesiton 2: Select the Labor Force Participation Rate and find an explanation for the strong increase in the labor force participation rate from the mid 60ies to the late 90ies.")),
                                column(8, 
                                       plotlyOutput("laborMarketUS"))
                              )
                              
                            )
                            
)