###############################################
#
# User interface for goods market components
#
##############################################

goodsComponentsTab <- tabPanel("Aggregate Demand", 
                          withMathJax(),
                          fluidPage(
                            h2("Aggregate Demand"),
                            tags$p("On the goods market we are interested in the relationship
                                   between income/output and aggregate demand. We defined GDP
                                   as the total value of goods and services produced. Remember,
                                   that GDP can also be calculated by adding up all incomes generated
                                   in the economy. This is why we write ``income/output'' as it is
                                   basically the same. This will be crucial when we want to solve our model.
                                   The production of goods refers to the supply side of the economy. How does
                                   the demand side look like?"),
                            
                            tags$p("Aggregate demand can be split up into the following components:"),
                            tags$ul(
                              tags$li(tags$strong("Private Consumption, \\(C\\):"), "Goods and services purchased
                                      by private consumers (e.g. food, movie tickets, etc.). Corresponds to the 
                                      largest share of GDP."),
                              tags$li(tags$strong("Investments, \\(I\\):"), "Business investments (e.g. machinery, 
                                      equipment, etc.), housing investments and public investments (e.g. 
                                      transportation infrastructure)."),
                              tags$li(tags$strong("Government Spending, \\(G\\):"), "Expenditure on goods and 
                                      services by the public sector, i.e. the federal government, states and 
                                      municipalities. Does not include government transfer payments (e.g. social 
                                      security) or interest payments, as these do not correspond to expenditure 
                                      on goods or services and, thus, do not contribute to aggregate demand."),
                              tags$li(tags$strong("Exports, \\(X\\):"), "Purchases of domestically produced goods 
                                      and services by private individuals, companies or the public sector abroad."),
                              tags$li(tags$strong("Imports, \\(IM\\):"), "Domestic purchases of goods and services
                                      produced abroad by private individuals, companies or the state sector.")
                            ),
                            tags$p("Aggregate Demand, \\(Z\\), results from the sum of the individual demand 
                                   components:"),
                            withMathJax("$$Z:= C+I+G+X-IM$$"),
                            fluidRow(class = "question",
                                     column(12, 
                                            p("Question: Why do we subtract imports in the aggregate demand equation?"), 
                                            actionBttn(
                                              inputId = "a2goodsBttn",
                                              label = "Show Answer", 
                                              style = "minimal",
                                              color = "danger"
                                            ),
                                            textOutput("a2goods"))
                            ),
                            tags$h3("Assumptions"),
                            tags$p("To keep our model a simple as possible we will assume the following:"), 
                            tags$ul(
                              tags$li("Only one good is produced, consumed and invested (one-good economy)."),
                              tags$li("There are no inventories (everything produced will be consumed)."),
                              tags$li("Companies fulfill every demand at the given price \\(P\\) (we treat
                                      prices as given, can be relaxed)"),
                              tags$li("We consider a closed economy (no imports, no exports).")
                            ),
                            fluidRow(class = "question",
                                     column(12, 
                                            p("Question: How reasonable are those assumptions?"), 
                                            actionBttn(
                                              inputId = "a3goodsBttn",
                                              label = "Show Answer", 
                                              style = "minimal",
                                              color = "danger"
                                            ),
                                            uiOutput("a3goods"))
                            ),
                            tags$p("Due to our last assumption, aggregate demand simplifies to:"),
                            withMathJax("$$Z:= C+I+G.$$")
                          )
                          
)