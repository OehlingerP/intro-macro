output$a1goodsEq <- renderText({
  
  if(input$a1goodsEqBttn %% 2 == 1){
    
    "In GDP accounting, \\(Y\\) denotes both income and production because GDP 
    can be measured from two equivalent perspectives: the production approach 
    and the income approach. The production approach calculates GDP as the total 
    value of goods and services produced, while the income approach sums up all 
    incomes earned from production, such as wages and profits. Both methods yield 
    the same \\(Y\\), reflecting the interconnection between output and income in the economy."
    
  }
  
})

output$a1FinancialSupply <- renderText({
  
  if(input$a1FinancialSupplyBttn %% 2 == 1){
    
    "The main objective of a central bank is price stability. In some countries, 
    such as the U.S., central banks should also support full employment."
    
  }
  
})