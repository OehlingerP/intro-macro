homeTab <- tabPanel("Home", 
                      fluidPage(
                        tags$head(
                          tags$link(rel = "stylesheet", type = "text/css", href = "https://cdn.jsdelivr.net/npm/chartist@0.11.4/dist/chartist.min.css"),
                          tags$script(src = "https://cdn.jsdelivr.net/npm/chartist@0.11.4/dist/chartist.min.js"),
                          # Include the external JavaScript file
                          tags$script(src = "chart-script.js"),
                          # Include the external CSS file
                          tags$link(rel = "stylesheet", type = "text/css", href = "chartist-style.css"),
                          # for motivational text (fade in)
                          # tags$link(rel = "stylesheet", type = "text/css", href = "motivational-text-style.css"),
                          # tags$script(src = "motivational-text.js"),
                          # typed.js
                          tags$script(src ="https://unpkg.com/typed.js@2.1.0/dist/typed.umd.js"),
                          tags$link(rel = "stylesheet", type = "text/css", href = "motivational-text-style.css"),
                          tags$script(src = "motivational-text-typed.js")
                        ),
                        fluidRow(
                          class = "landing-page",
                          column(12,
                                 h1("Welcome to Macroeconomics 101")
                          ),
                        ),
                        fluidRow(
                          class = "landing-page",
                          column(4,
                                 # fade in
                                 # div(id = "motivational-text",
                                 #     class = "motivational-text",
                                 #     "Ever wondered why central banks raise interest rates when inflation surges? Discover the answers and more in our Introduction to Macroeconomics course."
                                 # ),
                                 # typed
                                 tags$div(id = "motivational-text", class = "motivational-text")
                          ),
                          column(8, 
                                 class = "landing-page-chart-col",
                                 h4("It's 2020 in the U.S. – can you guess what these three time series represent?"),
                                 tags$div(class = "ct-chart", style = "position: relative; height: 400px;")) 
                        ),
                        fluidRow(
                                 class = "landing-page",
                          column(12,
                                 div(class = "course-description",
                                     p(tags$strong("If any of the questions above sparked your curiosity, this course is a great opportunity to explore further!")),
                                     p("In this interactive introduction to macroeconomics, you’ll engage with a variety of questions, exercises, and conceptual solutions. 
                                       The course is designed to be engaging and hands-on, providing you with a solid foundation in macroeconomic principles. For now, we'll 
                                       focus exclusively on the very short run. Based on student feedback, I may extend the course to cover medium and long-term perspectives in the future."),
                                     tags$ul(
                                       tags$li(strong("Interactive Learning:"), " Dive into thought-provoking questions and real-world exercises that will help solidify your understanding of macroeconomic concepts."),
                                       tags$li(strong("Instant Feedback:"), " For each question, you’ll have the option to view the answer. However, it's important to approach this with discipline. Take the time to thoroughly think through each problem before checking the solution. This approach ensures you fully grasp the material and avoids merely memorizing answers."),
                                       tags$li(strong("Self-Paced Exploration:"), " The course is designed to fit into your schedule, allowing you to learn at your own pace. Stay committed, and you’ll find the concepts becoming clearer and more intuitive over time.")
                                     ),
                                     h4("Tips for Success:"),
                                     tags$ul(
                                       tags$li(strong("Engage Deeply:"), " Don’t just skim through the questions and answers. Spend time understanding the underlying principles and how they apply to real-world scenarios."),
                                       tags$li(strong("Reflect and Apply:"), " After reviewing each answer, reflect on the problem-solving process and apply what you’ve learned to similar questions."),
                                       tags$li(strong("Stay Disciplined:"), " Resist the urge to click on answers too quickly. True learning happens when you challenge yourself and work through difficulties.")
                                     ),
                                     p("By embracing these practices, you'll enhance your learning experience and gain a robust understanding of macroeconomic concepts that will serve you well in both academic and real-world contexts. Dive in, stay curious, and enjoy the journey through the fascinating world of macroeconomics!"),
                                     h4("Course Status and Feedback:"),
                                     p("Please note that this course is still a work in progress. If you encounter any errors or find that something isn’t well explained, feel free to email me at [peter.oehlinger@jku.at]. Together, we can improve this course and make it a valuable learning experience."),
                                     p("Additionally, keep in mind that this course is not a substitute for a comprehensive textbook. For a deeper understanding of the subject, please refer to the recommended textbook and other course materials.")
                                     )
                          )
                        )
                        #,
                        # fluidRow(
                        #   class = "landing-page",
                        #   column(8, 
                        #   img(src = "stock-image.png", alt = "Illustration of increasing stock prices", width = "100%", height = "auto")),
                        #   column(4)
                        # )
                    )
)

# add for typed motivational text (before add typed.js libraries)
# tags$head(
#   tags$link(rel = "stylesheet", type = "text/css", href = "style.css"),
#   tags$script(src = src="https://unpkg.com/typed.js@2.1.0/dist/typed.umd.js"),
#   tags$script(src = "script.js")
# ),
# 
# div(id = "motivational-text", class = "motivational-text"),