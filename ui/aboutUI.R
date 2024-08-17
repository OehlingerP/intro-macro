###############################################
#
# UI for about us tab
#
###############################################

aboutTab <- tabPanel("About", value = "about",
                    fluidPage(width=8,
                     h3("About this Website"),
                     p("Welcome to the Introduction to Macroeconomics Shiny App! This app is designed to 
                     complement the lecture series I hold at Johannes Kepler University Linz, Austria. My 
                     aim is to provide an interactive learning tool that helps students better grasp the 
                     fundamental concepts of macroeconomics. By engaging with the app, I hope you’ll find 
                     the theories and models more intuitive and easier to apply in real-world scenarios."),
                     p("This app is very much a work in progress. I’m continuously working on it to enhance
                     its functionality and add more features based on student feedback and the evolving 
                     needs of the course. Your suggestions are always welcome, as they help me improve the
                     app for future users."),
                     br(),
                     h3("About Me"),
                     p("I’m currently a PhD candidate at Johannes Kepler University Linz, specializing in 
                       macroeconomics and international economics. Alongside my academic pursuits, I have 
                       a strong passion for programming and data visualization, which has inspired me to 
                       create this app."),
                     p("For more information about me and my research visit me on my website: ", 
                       a(href = "https://www.peteroehlinger.com", "https://www.peteroehlinger.com", target = "_blank"))
           )
  )#Tab panel

