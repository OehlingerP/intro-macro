# load quiz questions 
df_quiz <- read.csv("data/quiz_questions.csv")

# Store current set of random questions
current_questions <- reactiveVal()

# Initial random questions when app starts
current_questions(df_quiz[sample(1:nrow(df_quiz), 10), c("German", "Answer")])

# When "Regenerate Quiz" button is clicked, generate new random questions
observeEvent(input$regenerateQuiz, {
  current_questions(df_quiz[sample(1:nrow(df_quiz), 10), c("German", "Answer")])
  output$resultQuiz <- renderText("")  # Clear previous result when regenerating quiz
  output$tableResultQuiz <- renderDT(NULL)
})

# Dynamically generate UI for random questions
output$questions_ui <- renderUI({
  selected_questions <- current_questions()
  colnames(selected_questions) <- c("q", "a")
  
  lapply(1:nrow(selected_questions), function(i) {
    fluidRow(
      column(8, strong(selected_questions$q[i])),
      column(4, radioButtons(
        inputId = paste0("q", i),
        label = NULL,
        choices = list("True" = TRUE, "False" = FALSE),
        selected = NULL,
        inline = TRUE
      ))
    )
  })
})

# When "Submit Answers" button is clicked, evaluate answers
observeEvent(input$submitQuiz, {

  selected_questions <- current_questions()
  score <- 0

  # Check each question's answer
  for (i in 1:nrow(selected_questions)) {
    if (as.logical(input[[paste0("q", i)]]) == selected_questions$Answer[i]) {
      score <- score + 1
    }
  }
  
  colnames(selected_questions) <- c("Question", "Correct Answer")
  
  selected_questions$`Your Answer` <- c(input$q1, input$q2, input$q3,
                                        input$q4, input$q5, input$q6,
                                        input$q7, input$q8, input$q9,
                                        input$q10)

  selected_questions$`Correct Answer` <- as.character(selected_questions$`Correct Answer`)
  
  selected_questions <- selected_questions %>%
    mutate(Points = ifelse(selected_questions$`Correct Answer` != selected_questions$`Your Answer`, -0.5, 1))
  
  points <- sum(selected_questions$Points)
  
  df <- datatable(selected_questions, 
                  rownames = FALSE,
                  options = list(
                    dom = "t",   # Only show the table, no search or pagination
                    pageLength = 10
                  )) %>%
    formatStyle(
      columns = names(selected_questions),
      target = 'row',
      backgroundColor = styleEqual(c(-0.5, 1), c("lightpink", "transparent"))
    )
  
  output$tableResultQuiz <- renderDT(df)
  
  # Display result
  output$resultQuiz <- renderText({
    paste("You got", score, "out of", nrow(selected_questions), 
          "correct! At the exam you would have achieved", max(0, points), 
          "out of 10 Points.")
  })
})