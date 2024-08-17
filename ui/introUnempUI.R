###############################################
#
# User interface for unemployment intro
#
##############################################

introUnempTab <- tabPanel("Unemployment Rate", 
                            withMathJax(),
                          fluidPage(
                            h2("Unemployment Rate"),
                              p("The labor market is a crucial component of any economy, representing the dynamics between employers seeking to 
                              hire workers and individuals seeking employment. Macroeconomists closely monitor labor market indicators as they 
                              provide insights into the overall health of an economy, the effectiveness of economic policies, and potential areas 
                              of concern."),
                              p("The figure below provides a snapshot of the labor market in Germany for the year 2019, in millions, detailing various aspects of the 
                                population and employment statistics:"),
                            plotlyOutput("plotEmpGermany"),
                              h4("Key Measures"),
                              p(tags$strong("Unemployment Rate: "), "This measure indicates the percentage of the labor force that is unemployed but 
                                actively seeking work, offering insights into the efficiency of the job market."),
                              uiOutput("formUnempRate"),
                              p(tags$strong("Labor Force Participation Rate: "), "This measure shows the proportion of the working-age population that 
                                is either employed or actively seeking work, highlighting trends in economic activity and labor market engagement."),
                              uiOutput("formLaborForcePart"),
                              p(tags$strong("Employment Rate: "), "This measure is calculated as the proportion of employed persons relative to 
                                the working-age population and reflect the utilization of labor resources."),
                              uiOutput("formEmpRate"),
                              fluidRow(
                                column(8, 
                                       plotlyOutput("laborMarketUS")),
                                column(4,
                                       h4("Exercise - U.S. Labor Market"),
                                       tags$ol(
                                         tags$li("Find three reasons for the sharp drop of the unemployment rate after the 
                                            COVID outbreak in 2020."),
                                         tags$li("Select the Labor Force Participation Rate from the dropdown menu. What factors 
                                            contributed to the strong increase in this rate from the mid-1960s to the late 1990s?")
                                       ),
                                       pickerInput(
                                         inputId = "pickerLaborUS",
                                         label = "Select Variables: ", 
                                         choices = c("Unemployment Rate", "Labor Force Participation Rate"),
                                         selected = "Unemployment Rate",
                                         multiple = FALSE
                                       ))
                              ),
                              fluidRow(
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
                                       )),
                                column(8, plotlyOutput("plotOcunsLaw"))
                                
                              )#,
                              # fluidRow(
                              #   column(8),
                              #   column(4,
                              #          h4("Exercise - ILO vs. National"))
                              #          
                              # )
                              
                            )
                            
)