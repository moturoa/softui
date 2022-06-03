

devtools::load_all()


library(shiny)

ui <- softui::simple_page(
  softui::box(title = "This is a box", width = 4,
    softui::sub_box(title = "Test", icon = bsicon("gear-fill"),
                    collapsed = TRUE,
                    tags$p("content"))
  )

)

server <- function(input, output, session) {
  
}

shinyApp(ui, server)
