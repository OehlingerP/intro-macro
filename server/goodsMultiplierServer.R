
output$partialGoodsMarket1 <- renderUI({

  if("\\(c_0\\)" %in% input$checkboxGroupPartial){
    
    withMathJax("$$\\frac{\\partial Y}{\\partial c_0} = \\frac{1}{1-c_1}$$")
    
  }
  
})

output$partialGoodsMarket2 <- renderUI({
  
  if("\\(I\\)" %in% input$checkboxGroupPartial){
    
    withMathJax("$$\\frac{\\partial Y}{\\partial I} = \\frac{1}{1-c_1}$$")
    
  }
  
})

output$partialGoodsMarket3 <- renderUI({
  
  if("\\(G\\)" %in% input$checkboxGroupPartial){
    
    withMathJax("$$\\frac{\\partial Y}{\\partial G} = \\frac{1}{1-c_1}$$")
    
  }
  
})

output$partialGoodsMarket4 <- renderUI({
  
  if("\\(T\\)" %in% input$checkboxGroupPartial){
    
    withMathJax("$$\\frac{\\partial Y}{\\partial T} = \\frac{-c_1}{1-c_1}$$")
    
  }
  
})

