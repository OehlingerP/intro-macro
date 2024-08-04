###############################################
#
# User interface for ISLM model
#
##############################################

islmTab <- tabPanel("Plot",
         sidebarLayout(
           sidebarPanel(
             radioButtons("plotType", "Plot type",
                          c("Scatter"="p", "Line"="l")
             )
           ),
           mainPanel(
             plotOutput("plot")
           )
         )
)