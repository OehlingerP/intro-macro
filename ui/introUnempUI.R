###############################################
#
# User interface for unemployment intro
#
##############################################

introUnempTab <- tabPanel("Intro Lecture", 
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
                                         choices = countries,
                                         selected = "USA",
                                         multiple = TRUE
                                       ))
                              ),
                              br(),
                              div(class = "btn-container",
                                  actionButton("prev_btn", "Previous"),
                                  actionButton("next_btn", "Next")
                              )
                              
                            )
                            
)