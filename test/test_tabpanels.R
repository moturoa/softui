
library(shiny)
library(softui)
library(dplyr)

ui <- softui::simple_page(
  
  
  softui::tab_box(id = "mytabbox",
    softui::tab_panel("Tab 1", tags$p("tab 1 content")),
    softui::tab_panel("Tab 2", tags$p("tab 2 content"))
  ),
  
  verbatimTextOutput("out")
  
)

server <- function(input, output, session) {
 
  
  output$out <- renderPrint({
    reactiveValuesToList(input)
  })
   
}

shinyApp(ui, server)
