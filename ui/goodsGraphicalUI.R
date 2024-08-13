###############################################
#
# User interface for the goods market graphical equilibrium tab
#
##############################################

goodsGraphicalTab <- tabPanel("Graphical Equilibrium", 
                               withMathJax(),
                               mainPanel(
                                p("We will now solve for the equilibrium output graphically. This 
                                  approach will enhance our understanding of the equilibrium concept 
                                  and also illustrate how the multiplier effect operates in practice. 
                                  By visualizing the equilibrium output on a graph, we can see how 
                                  changes in spending influence overall economic activity and how the 
                                  multiplier amplifies these effects."),
                                p("We will explore this concept through a step-by-step exercise. Take your 
                                  time to think through each step before checking the solution. If your initial 
                                  attempt doesn't match the expected result, carefully review where you might 
                                  have gone wrong to improve your understanding."),
                                fluidRow(
                                  column(8, 
                                         plotlyOutput("plotGoodsMarketEq")),
                                  column(4, 
                                         p("On the left, you see a graph with income on the horizontal 
                                           axis and demand/output on the vertical axis. Demand and output 
                                           are on one axis because in equilibrium the two are the same."),
                                         p("Step 1: Draw the line representing all points of equilibrium, 
                                           where income equals production."),
                                         awesomeCheckbox(
                                           inputId = "degree45Line",
                                           label = "Show solution"
                                         ),
                                         textOutput("textStep1GoodsMarketEqPlot"),
                                         br(),
                                         p("Step 2: Draw the demand function and find equilibrium output. Why must the 
                                           two lines cross?"),
                                         awesomeCheckbox(
                                           inputId = "zzLine",
                                           label = "Show solution"
                                         ),
                                         textOutput("textStep2GoodsMarketEqPlot"),
                                         br())
                                )
                               )
)