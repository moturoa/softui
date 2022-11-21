

library(softui)

ui <- softui::simple_page(
  
  softui::box(
    title = "Test", icon = bsicon("bug"),
    
    softui::action_button("btn_contrast", "Hoog contrast"),
    
    
    tags$hr(),
    textInput("txt_variable", "root: Variable", value = ""),
    textInput("txt_value", "new value", value = ""),
    softui::action_button("btn_set_variable", "Set", status = "success"),
    
    tags$div(style = "height: 300px; width: 100%; background-color: --bs-gray-100;")
  )
)

server <- function(input, output, session) {
  observeEvent(input$btn_contrast, {
    set_background_grey_level(200)
  })
  
  
  observeEvent(input$btn_set_variable, {
    set_css_variable(input$txt_variable, input$txt_value)
  })
}

shinyApp(ui, server)
