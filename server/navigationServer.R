observeEvent(input$prev_goals, {
  session$sendCustomMessage(type = 'navigatePage', message = list(direction = 'prev'))
})

observeEvent(input$next_goals, {
  session$sendCustomMessage(type = 'navigatePage', message = list(direction = 'next'))
})

observeEvent(input$prev_gdp, {
  session$sendCustomMessage(type = 'navigatePage', message = list(direction = 'prev'))
})

observeEvent(input$next_gdp, {
  session$sendCustomMessage(type = 'navigatePage', message = list(direction = 'next'))
})

observeEvent(input$prev_unemp, {
  session$sendCustomMessage(type = 'navigatePage', message = list(direction = 'prev'))
})

observeEvent(input$next_unemp, {
  session$sendCustomMessage(type = 'navigatePage', message = list(direction = 'next'))
})

observeEvent(input$prev_rates, {
  session$sendCustomMessage(type = 'navigatePage', message = list(direction = 'prev'))
})

observeEvent(input$next_rates, {
  session$sendCustomMessage(type = 'navigatePage', message = list(direction = 'next'))
})

observeEvent(input$prev_inflation, {
  session$sendCustomMessage(type = 'navigatePage', message = list(direction = 'prev'))
})

observeEvent(input$next_inflation, {
  session$sendCustomMessage(type = 'navigatePage', message = list(direction = 'next'))
})

observeEvent(input$prev_exercises, {
  session$sendCustomMessage(type = 'navigatePage', message = list(direction = 'prev'))
})

observeEvent(input$next_exercises, {
  session$sendCustomMessage(type = 'navigatePage', message = list(direction = 'next'))
})