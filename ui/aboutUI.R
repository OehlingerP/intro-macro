###############################################
#
# UI for about us tab
#
###############################################

aboutTab <- 
  
  tabPanel("About", value = "about",
           sidebarPanel(width=1),
           mainPanel(width=8,
                     h3("About this course", style = "color:black; font-weight: 600"),
                     p("This website is designed to provide an overview of key concepts in macroeconomics and 
                       supplement your learning. However, it is not a substitute for a comprehensive textbook. 
                       For a deeper understanding of the subject, please refer to the recommended textbook and 
                       other course materials. This site highlights only a selection of fundamental topics and 
                       should be used in conjunction with your full course resources."),
                     br(),
                     h3("About the author", style = "color:black; font-weight: 600"),
                     p("")
           )
  )#Tab panel