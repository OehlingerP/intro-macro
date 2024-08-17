###############################################
#
# User interface for ISLM model
#
##############################################

islmLMCurveTab <- tabPanel("LM Curve",
                    withMathJax(), 
                    fluidPage(
                      tags$h2("LM Curve"),
                      tags$p("The LM curve represents all the equilibria in the money market, showing combinations of interest rates and 
                             levels of output where the money supply equals the money demand. The equilibrium condition is given by:"),
                      withMathJax("$$M = PY \\cdot L(i) \\Leftrightarrow \\frac{M}{P} = Y \\cdot L(i)$$"),
                      tags$p("where, \\(M\\) represents the nominal money supply, \\(P\\) is the price level, and \\(L(i)\\) denotes the liquidity preference, 
                             which depends on the interest rate. At equilibrium, the real money supply (\\(\\frac{M}{P}\\)) equals the real money demand
                             (\\(Y \\cdot L(i)\\)). Since central banks typically control the interest rate directly rather than the money supply, we often 
                             assume the interest rate is fixed based on central bank policy. In this case, the LM curve is represented as a horizontal line, 
                             indicating that the money market is in equilibrium at a specific interest rate regardless of the level of output (the central bank
                             keeps it in equilibrium)."),
                      tags$p("<b>Note:</b> Some textbooks may present an upward-sloping LM curve, which reflects a central bank targeting the money supply. 
                             However, since most central banks now primarily target interest rates, we will focus on this more current approach. The case of 
                             targeting money supply might be added in the future.")
                      
                  )
)