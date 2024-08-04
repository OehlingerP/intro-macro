###############################################
#
# Server logic for islm tab
#
###############################################

# Derivation of the IS Curve



# ISLM Full Model (3 plots)
output$goodsMarketPlot <- renderPlot({
  
  plot <- ggplot() +
    geom_abline(slope = 1) +
    geom_abline(intercept = input$c0_islm - input$c1_islm*input$T_islm + input$I0_islm - input$I2_islm*input$i_islm+input$G_islm, 
                slope = input$c1_islm + input$I1_islm) +
    scale_y_continuous(limits = c(0, 5000), expand = c(0,0)) +
    scale_x_continuous(limits = c(0, 5000), expand = c(0,100))
  
  gx_theme(plot,
           x_title = "Output/Income",
           y1_title = "Demand")

})

output$interestRatePlot <- renderPlot({
  
  plot <- ggplot() +
    geom_hline(yintercept = input$i_islm) +
    scale_y_continuous(limits = c(-0.05, 0.5), expand = c(0,0)) +
    scale_x_continuous(limits = c(0, 5000), expand = c(0,100))
  
  gx_theme(plot,
           x_title = "Output",
           y1_title = "Interest Rate")
  
})

output$islmPlot <- renderPlot({
  
  plot <- ggplot() +
    geom_abline(intercept = (input$c0_islm-input$c1_islm*input$T_islm+input$I0_islm+input$G_islm)/input$I2_islm,
                slope = -(1-input$c1_islm-input$I1_islm)/input$I2_islm) +
    geom_hline(yintercept = input$i_islm) +
    scale_y_continuous(limits = c(-0.05, 0.5), expand = c(0,0)) +
    scale_x_continuous(limits = c(0, 5000), expand = c(0,100))
  
  gx_theme(plot,
           x_title = "Output",
           y1_title = "Interest Rate")
  
})

output$islmEquilibrium <- renderText({paste("The equilibrium is", input$c0_islm/(1-input$c1_islm))})

output$test <- renderText({paste((input$c0_islm-input$c1_islm*input$T_islm+input$I0_islm+input$G_islm)/input$I2_islm, -input$I2_islm/(1-input$c1_islm-input$I1_islm))})

# restriction on slope parameters (not allowed to be larger 1 as the model is unstable)
observe({
  # Retrieve the input values
  num1 <- input$c1_islm
  num2 <- input$I1_islm
  
  # Check if the sum exceeds the limit
  if (num1 + num2 >= 1) {
    # Adjust the input values to keep the sum within the limit
    if (num1 > num2) {
      num1 <- 0.99 - num2
      updateNumericInput(session, "c1_islm", value = num1)
    } else {
      num2 <- 0.99 - num1
      updateNumericInput(session, "I1_islm", value = num2)
    }
    
    # Provide feedback to the user
    output$message <- renderText("The sum of the two numbers cannot exceed 1. Adjusted automatically.")
  } 
})

# input validation
iv <- InputValidator$new()
iv$add_rule("c0_islm", sv_between(50, 500))
iv$add_rule("c1_islm", sv_between(0.01, 0.99))
iv$add_rule("I0_islm", sv_between(0, 500))
iv$add_rule("I1_islm", sv_between(0.0, 0.99))
iv$add_rule("I2_islm", sv_between(0, 10000))


iv$add_rule("G_islm", sv_between(0, 500))
iv$add_rule("T_islm", sv_between(0, 500))
iv$add_rule("i_islm", sv_between(-0.01, 0.5))
iv$enable()

# add text 
output$rmdContent <- renderUI({
  # Render the R Markdown file to HTML
  rmarkdown::render("lecture_notes.Rmd", output_format = "html_document", quiet = TRUE)
  # Read and display the rendered HTML file
  HTML(readLines("lecture_notes.html"))
})
