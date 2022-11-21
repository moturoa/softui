

library(softui)

ui <- softui::simple_page(
  
  softui::box(
    title = "Test", icon = bsicon("bug"),
    
    softui::action_button("btn_contrast", "Hoog contrast")
  )
)

server <- function(input, output, session) {
  observeEvent(input$btn_contrast, {
    set_background_grey_level(200)
  })
}

shinyApp(ui, server)
