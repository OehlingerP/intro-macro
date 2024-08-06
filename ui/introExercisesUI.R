###############################################
#
# User interface for intro exercises
#
##############################################

introExercisesTab <- tabPanel("Exercises", 
                          withMathJax(),
                          mainPanel(
                          
                            
                            br(),
                            div(class = "btn-container",
                                actionButton("prev_btn", "Previous"),
                                actionButton("next_btn", "Next")
                            )
                            
                          )
                          
)