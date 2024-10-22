###############################################
#
# UI for about us tab
#
###############################################

quizTab <- tabPanel("Quiz", value = "quiz",
                    fluidPage(width=8,
                     h3("Test your knowledge"),
                     # pickerInput(
                     #   inputId = "pickerLangQuiz",
                     #   label = "Select Language: ", 
                     #   choices = c("German", "English"),
                     #   selected = "German",
                     #   multiple = FALSE
                     # ),
                     # Regenerate quiz button
                     actionButton("regenerateQuiz", "Regenerate Quiz"),
                     br(), br(),
                     
                     # Placeholder for questions
                     uiOutput("questions_ui"),
                     
                     # Submit Button
                     actionButton("submitQuiz", "Submit Answers"),
                     
                     # Output result
                     textOutput("resultQuiz"),
                     DTOutput("tableResultQuiz")
           )
  )#Tab panel

