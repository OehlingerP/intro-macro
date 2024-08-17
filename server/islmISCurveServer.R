###############################################
#
# Server logic for is curve tab
#
###############################################

# Derivation of the IS Curve

  # Reactive values to store equilibria
  eqStorage <- reactiveValues(equilibria = data.frame(iVal = numeric(), yVal = numeric()))
  
  # Update goods market plot based on interest rate
  output$plotGoodsMarket <- renderPlotly({
    
    # Plot the goods market
    plot <- ggplot() +
      geom_abline(intercept = 1000 - 5000*input$interestRateIS,
                  slope = 0.5, color = gx_colors()[2]) +
      geom_abline(slope = 1) +
      #geom_vline(xintercept = input$interestRateIS) +
      scale_y_continuous(limits = c(0, 3000), expand = c(0,0)) +
      scale_x_continuous(limits = c(0, 3000), expand = c(0,100))
    
    plot <- gx_theme(plot,
             x_title = "Output/Income",
             y1_title = "Demand")
    
    ggplotly(plot)
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
  output$plotIS <- renderPlotly({
    eq_data <- eqStorage$equilibria

    plot <- ggplot(eq_data, aes(x = yVal, y = iVal)) +
      #geom_vline(xintercept = input$interestRateIS) +
      geom_point(color = gx_colors()[2]) +
      geom_line(color = gx_colors()[2]) +
      scale_y_continuous(limits = c(0, 0.3), expand = c(0,0)) +
      scale_x_continuous(limits = c(0, 3000), expand = c(0,100))

    plot <- gx_theme(plot,
             x_title = "Output",
             y1_title = "Interest Rate")

    ggplotly(plot)
    
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
