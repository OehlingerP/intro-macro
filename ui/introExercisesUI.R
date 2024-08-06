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
                                actionButton("prev_exercises", "Previous"),
                                actionButton("next_exercises", "Next")
                            )
                            
                          )
                          
)