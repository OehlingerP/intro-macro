###############################################
#
# User interface for the goods market graphical equilibrium tab
#
##############################################

goodsGraphicalTab <- tabPanel("Graphical Solution", 
                               withMathJax(),
                              fluidPage(
                                h2("Graphical Solution"),
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
                                  column(6, 
                                         plotlyOutput("plotGoodsMarketEq"),
                                         br(),
                                         uiOutput("textStep1GoodsMarketEqPlot"),
                                         br(),
                                         uiOutput("textStep2GoodsMarketEqPlot"), 
                                         br(),
                                         uiOutput("textStep3GoodsMarketEqPlot")),
                                  column(4, 
                                         h4("Exercise - Graphical Solution"),
                                         p("On the left, you see a graph with income on the horizontal 
                                           axis and demand/output on the vertical axis. Demand and output 
                                           are on one axis because in equilibrium the two are the same."),
                                         p("Step 1: Draw the line representing all points of equilibrium, 
                                           where income equals production."),
                                         awesomeCheckbox(
                                           inputId = "degree45Line",
                                           label = "Show solution"
                                         ),
                                         br(),
                                         p("Step 2: Draw the demand function and find equilibrium output. Why must the 
                                           two lines cross?"),
                                         awesomeCheckbox(
                                           inputId = "zzLine",
                                           label = "Show solution"
                                         ),
                                         br(),
                                         p("Step 3: What happens if government spending increases? Find the new equilibrium."),
                                         awesomeCheckbox(
                                           inputId = "goodsMarketGincrease",
                                           label = "Show solution"
                                         ))
                                ),
                                p("Next, we will explore a step-by-step graphical solution to better understand
                                  how we transition from one equilibrium to another and how the multiplier 
                                  mechanism operates."),
                                fluidRow(
                                  column(4,
                                         h4("Exercise - Transition to the New Equilibrium"),
                                         p("Consider again an increase in government spending. Break down the process into
                                           individual steps: What is the immediate response when the government increases
                                           its expenditure—demand, production, or income? From there consider what responds 
                                           next and so on. This will give you an intuition of how the multiplier works."),
                                         sliderTextInput(
                                           inputId = "stepsTransPlot",
                                           label = "Go through steps:", 
                                           grid = TRUE,
                                           force_edges = TRUE,
                                           choices = c("Start", "Step 1", "Step 2", 
                                                       "Step 3", "Step 4", "Show all steps")
                                         ),
                                         uiOutput("textGoodsMarketTransPlot")),
                                  column(6,
                                         plotlyOutput("plotGoodsMarketTrans"))
                                ),
                                fluidRow(
                                  column(6, 
                                         plotlyOutput("plotGoodsMarketNonLinear")),
                                  column(4, 
                                         h4("Exercise - Non-Linear Consumption Function"),
                                         p("On the left, you see a graph with income on the horizontal 
                                           axis and demand/output on the vertical axis. This time however 
                                           consumption is assumed to be non-linear. The graph was built using",
                                           withMathJax("Y = c_0 + c_1Y -c_2Y^2+G"), "with, ", withMathJax("c_0=0.1"),
                                           " ", withMathJax("c_1=0.5"), " ", withMathJax("c_2=0.06"), " ", withMathJax("G=0.1"),
                                           ". Solve for the equilibrium output in this non-linear model and compare your results
                                           to the equilibrium shown here. What differences and/or complications do you observe compared
                                           to the liner consumption function?"),
                                         awesomeCheckbox(
                                           inputId = "plotNonLinearEq",
                                           label = "Show equilibrium"
                                         ))
                                )
                               )
)