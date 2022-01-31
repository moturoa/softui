


library(shiny)
library(bslib)
library(shinyWidgets)

devtools::load_all()


ui <- fluidPage(theme = bs_theme(version = 5),

                
                picker_select_ui("test", "Select mtcar", width = 300),
                
                tags$hr(),
                verbatimTextOutput("txt_out")
                
)

server <- function(input, output, session) {
  
  out <- callModule(picker_select_module, "test", rownames(mtcars))
  
  
  output$txt_out <- renderPrint({
    out()
  })
  
}

shinyApp(ui, server)
