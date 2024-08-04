###############################################
#
# Server logic for islm tab
#
###############################################

# Derivation of the IS Curve

  # Reactive values to store equilibria
  eqStorage <- reactiveValues(equilibria = data.frame(iVal = numeric(), yVal = numeric()))
  
  # Update goods market plot based on interest rate
  output$plotGoodsMarket <- renderPlot({
    
    # Plot the goods market
    plot <- ggplot() +
      geom_abline(intercept = 1000 - 5000*input$interestRateIS,
                  slope = 0.5) +
      geom_abline(slope = 1) +
      #geom_vline(xintercept = input$interestRateIS) +
      scale_y_continuous(limits = c(0, 3000), expand = c(0,0)) +
      scale_x_continuous(limits = c(0, 3000), expand = c(0,100))
    
    gx_theme(plot,
             x_title = "Output/Income",
             y1_title = "Demand")
  })
  
  # Update equilibrium plot and store the equilibrium
  observe({
    eq_i <- input$interestRateIS
    eq_y <- 2*(1000 - 5000*input$interestRateIS)
    new_equilibria <- data.frame(iVal = eq_i,
                                 yVal = eq_y)
    
    isolate({
      eqStorage$equilibria <- rbind(eqStorage$equilibria, new_equilibria)
    })

  })

  # Render the equilibria plot
  output$plotIS <- renderPlot({
    eq_data <- eqStorage$equilibria

    plot <- ggplot(eq_data, aes(x = yVal, y = iVal)) +
      #geom_vline(xintercept = input$interestRateIS) +
      geom_point(color = "blue") +
      scale_y_continuous(limits = c(0, 0.3), expand = c(0,0)) +
      scale_x_continuous(limits = c(0, 3000), expand = c(0,100))

    gx_theme(plot,
             x_title = "Output",
             y1_title = "Interest Rate")

  })

  # Reset button functionality
  observeEvent(input$resetIS, {
    # Reset the slider to its default value
    updateSliderInput(session, "interest_rate", value = 0.02)
    # Clear the equilibria data
    isolate({
      eqStorage$equilibria <- data.frame(iVal = numeric(), yVal = numeric())
    })
    
  })


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

output$islmEquilibrium <- renderText({
  
  c0 <- input$c0_islm
  c1 <- input$c1_islm
  I0 <- input$I0_islm
  I1 <- input$I1_islm
  I2 <- input$I2_islm
  G <- input$G_islm
  T_islm <- input$T_islm
  i_islm <- input$i_islm
  
  paste("The equilibrium is", round((1/(1-c1-I1))*(c0-c1*T_islm+I0+G-I2*i_islm)))})

output$dynamicEquilibriumFormula <- renderUI({
  
  c0 <- input$c0_islm
  c1 <- input$c1_islm
  I0 <- input$I0_islm
  I1 <- input$I1_islm
  I2 <- input$I2_islm
  G <- input$G_islm
  T_islm <- input$T_islm
  i_islm <- input$i_islm
  
  HTML(paste0("$$\\begin{align}Y &= ", 
              "\\frac{1}{1-", c1, "-", I1,"}(", c0,"-",c1,"*", T_islm, "+", 
              I0, "-", I2, "*i", "+", G, ")\\\\",
              "&=", round(1/(1-c1-I1)), "(",c0-c1*T_islm+I0+G,"-",I2,"*i)\\\\",
              "&=", round((1/(1-c1-I1))*(c0-c1*T_islm+I0+G-I2*i_islm)), "\\end{align}$$"))
})

observe({
  # Trigger MathJax re-rendering after the LaTeX code is updated
  session$sendCustomMessage("updateMathJax", list())
})

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
