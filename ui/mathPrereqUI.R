###############################################
#
# User interface for math prerequisites
#
##############################################

mathPrereqTab <- tabPanel("Math Prerequisites",
                          withMathJax(),  # Enable MathJax for rendering mathematical expressions
                          fluidPage(
                            titlePanel("Mathematical Prerequisites"),
                            p("In our macroeconomics course, understanding some fundamental mathematical 
                              concepts is essential for grasping key economic models and analyses. Below 
                              is a brief overview of the key mathematical concepts you’ll need, along with 
                              some examples. For detailed explanations and further study, please refer to 
                              standard math textbooks."),
                            p(tags$strong("It’s not a lot of math, and it’s not difficult, but you need to 
                                          understand the concepts below, or the course will be challenging.")),
                            # Notes on mathematical concepts
                              tags$h3("Growth Rates"),
                              tags$p("Growth rates measure the percentage change in a variable over time. They are crucial for understanding 
                                     economic growth and changes in variables such as GDP. The general formula for growth rates is:"),
                            withMathJax("$$g=\\frac{x_{t+1}-x_t}{x_t}$$"),
                            p("where \\(x\\) is some variable of interest in time periods \\(t\\) and \\(t+1\\). Multiply by 100 to get the growth rate in percent."),
                            fluidRow(class = "question",
                                     column(12, 
                                            p("Exercise: Assume GDP grows from $1,000 billion to $1,050 billion from 2021 to 2022. Calculate the GDP growth in percent."), 
                                            actionBttn(
                                              inputId = "a1MathBttn",
                                              label = "Show Answer", 
                                              style = "minimal",
                                              color = "danger"
                                            ),
                                            uiOutput("a1Math"))
                            ),
                              tags$h3("Rearranging Equations"),
                              tags$p("This is useful in economic models where solving for one variable depends on rearranging a formula. We will 
                                     need this in every class."),
                            fluidRow(class = "question",
                                     column(12, 
                                            p("Exercise: Calculate y in \\(y = c_0 + c_1y\\)"), 
                                            actionBttn(
                                              inputId = "a2MathBttn",
                                              label = "Show Answer", 
                                              style = "minimal",
                                              color = "danger"
                                            ),
                                            uiOutput("a2Math"))
                            ),
                            fluidRow(class = "question",
                                     column(12, 
                                            p("Exercise: Calculate y in \\(y = c_0 + c_1(y-(t_0+t_1y))\\)"), 
                                            actionBttn(
                                              inputId = "a3MathBttn",
                                              label = "Show Answer", 
                                              style = "minimal",
                                              color = "danger"
                                            ),
                                            uiOutput("a3Math"))
                            ),
                            

                              tags$h3("Linear Functions in a Graph"),
                              tags$p("A linear function is represented by a straight line in a graph. It has the general 
                                     form \\(y = ax + b\\), where \\(a\\) is the slope and \\(b\\) is the y-intercept."),
                            fluidRow(class = "question",
                                     column(12, 
                                            p("Exercise: Draw the line y = 10+0.5x in the xy-diagram."), 
                                            actionBttn(
                                              inputId = "a4MathBttn",
                                              label = "Show Answer", 
                                              style = "minimal",
                                              color = "danger"
                                            ),
                                            plotlyOutput("a4Math"))
                            ),
                            fluidRow(class = "question",
                                     column(12, 
                                            p("Exercise: Draw the line that shows all points where x and y are equal in the xy-diagram."), 
                                            actionBttn(
                                              inputId = "a5MathBttn",
                                              label = "Show Answer", 
                                              style = "minimal",
                                              color = "danger"
                                            ),
                                            plotlyOutput("a5Math"))
                            ),
                            fluidRow(class = "question",
                                     column(12, 
                                            p("Exercise: Draw the line y = a + bz in the xy-diagram."), 
                                            actionBttn(
                                              inputId = "a6MathBttn",
                                              label = "Show Answer", 
                                              style = "minimal",
                                              color = "danger"
                                            ),
                                            plotlyOutput("a6Math"))
                            ),
                              tags$h3("Partial Derivatives"),
                              tags$p("Partial derivatives measure how a function changes as one variable changes while keeping 
                                     other variables constant."),
                            fluidRow(class = "question",
                                     column(12, 
                                            p("Exercise: Given the equation \\(Y = \\frac{1}{1-c_1}(c_0-c_1t_1)\\), calculate the partial 
                                              derivatives with respect to \\(c_0\\) and \\(t_1\\)."), 
                                            actionBttn(
                                              inputId = "a7MathBttn",
                                              label = "Show Answer", 
                                              style = "minimal",
                                              color = "danger"
                                            ),
                                            uiOutput("a7Math"))
                            )
                            
                          )
)