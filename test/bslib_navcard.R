


library(shiny)
library(bslib)

ui <- fluidPage(
  theme = bslib::bs_theme(version = 5),

  navs_tab_card(
    header = tagList(tags$h4("Title")),
    nav("Een", "Content", icon = icon("home")),
    nav("Twee", "Meer content"),
  )
)

server <- function(input, output, session) {

}

shinyApp(ui, server)
