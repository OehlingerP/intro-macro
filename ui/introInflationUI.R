###############################################
#
# User interface for Inflation intro
#
##############################################

introInflationTab <- tabPanel("Inflation", 
                            withMathJax(),
                            mainPanel(

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
                              
                              br(),
                              div(class = "btn-container",
                                  actionButton("prev_btn", "Previous"),
                                  actionButton("next_btn", "Next")
                              )
                              
                            )
                            
)