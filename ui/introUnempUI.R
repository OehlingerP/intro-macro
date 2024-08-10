###############################################
#
# User interface for unemployment intro
#
##############################################

introUnempTab <- tabPanel("Unemployment Rate", 
                            withMathJax(),
                            mainPanel(
                              
                              tags$h3("Unemployment Rate"),
                              fluidRow(
                                column(8, plotlyOutput("plotOcunsLaw")),
                                column(4, 
                                       tags$h4("Exercise - Okuns Law"),
                                       p("Okun's Law describes the statistical relationship between GDP and the unemployment rate. 
                                         It says that if GDP increases strongly the unemployment rate is going to decline. Select 
                                         countries from the dropdown to investigate the relationship. Can you explain why the fitted 
                                         line is steeper for the U.S. than for Germany?"),
                                       pickerInput(
                                         inputId = "pickerOcun",
                                         label = "Select Countries: ", 
                                         choices = meta_fred %>%
                                           filter(variable %in% c("Real GDP", "Unemployment Rate")) %>%
                                           group_by(country) %>%
                                           mutate(count = 1,
                                                  count = sum(count)) %>%
                                           filter(count == 2) %>%
                                           select(country) %>%
                                           unique() %>%
                                           unlist() %>%
                                           unname() %>%
                                           sort(),
                                         selected = "United States",
                                         multiple = TRUE
                                       ))
                              ),
                              fluidRow(
                                column(4,
                                       h4("Exercise - U.S. Labor Market"),
                                       tags$ol(
                                         tags$li("Find three reasons for the sharp drop of the unemployment rate after the 
                                            first lockdown in 2020."),
                                         tags$li("Select the Labor Force Participation Rate from the dropdown menu. What factors 
                                            contributed to the strong increase in this rate from the mid-1960s to the late 1990s?")
                                       ),
                                       pickerInput(
                                         inputId = "pickerLaborUS",
                                         label = "Select Variables: ", 
                                         choices = c("Unemployment Rate", "Labor Force Participation Rate"),
                                         selected = "Unemployment Rate",
                                         multiple = FALSE
                                       )),
                                column(8, 
                                       plotlyOutput("laborMarketUS"))
                              )
                              
                            )
                            
)