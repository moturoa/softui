

library(shiny)
#library(softui)
library(dplyr)

ui <- fluidPage(
  
  
  tabsetPanel(id = "mytabbox",
                  tabPanel("Tab 1", tags$p("tab 1 content")),
                  tabPanel("Tab 2", tags$p("tab 2 content"))
  ),
  
  verbatimTextOutput("out")
  
)

server <- function(input, output, session) {
  
  
  output$out <- renderPrint({
    reactiveValuesToList(input)
  })
  
}

shinyApp(ui, server)

