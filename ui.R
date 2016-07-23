library(shiny)

# Define UI for random distribution application 
shinyUI(pageWithSidebar(
  
  headerPanel("Stock Explorer"),
  
  sidebarPanel(
    
    helpText("Select the industry to pick from"),
    
    textInput("symb", "Symbol", "HDFC"),
    
    dateRangeInput("dates", 
                   "Compare to historic returns from",
                   start = "2013-01-01", end = "2016-01-01"),
    
    actionButton("get", "Get Stock"),
    
    br(),
    br(),
    
    uiOutput("newBox")
    
    ),
  
  # Show a tabset that includes a plot, summary, and table view
  # of the generated distribution
  mainPanel(
    tabsetPanel(
      tabPanel("Charts", plotOutput("chart")), 
      tabPanel("Model", div(h3(textOutput("ks"))), 
               div(h3(textOutput("ksp"))), 
               plotOutput("hist")), 
      tabPanel("VaR", h3(textOutput("text3"))),
      id = "tab"
    )
  )
))
