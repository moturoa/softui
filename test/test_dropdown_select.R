


library(shiny)
library(bslib)
library(shinyWidgets)

devtools::load_all()


ui <- fluidPage(theme = bs_theme(version = 5),

                fluidRow(
                  column(4, 
                         picker_select_ui("test", "Select mtcar", width = 350)       
                  ), 
                  column(4,
                         
                    actionButton("btn_update", "Set choices")       
                  )
                ),
                fluidRow(
                  tags$hr(),
                  verbatimTextOutput("txt_out")  
                )
                
)

server <- function(input, output, session) {
  
  out <- callModule(picker_select_module, "test", choices = sort(readRDS("../test/ehv_projecten.rds")$projectnaam), update = test_update)
  test_update <- reactiveVal()
  
  observeEvent(input$btn_update, {
    test_update(list(choices = letters, selected = letters[1:3]))
  })
  
  
  output$txt_out <- renderPrint({
    out()
  })
  
}

shinyApp(ui, server)
