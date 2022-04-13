


library(softui)
library(shiny)
library(dplyr)

ui <- softui::fluid_page(
  softui::softui_dependencies(),
  
  
  softui::box(title = "Test", width = 6,
              
              
              timeline(
                timeline_block("Geboorte", "1956-6-1", icon_name = "bell-fill", icon_status = "success",
                               text = shinipsum::random_text(nwords=20)),
                timeline_block("Gebeurtenis 1", "1970-1-6", icon_name = "bag-fill", icon_status = "info",
                               text = shinipsum::random_text(nwords=20)),
                timeline_block("Gebeurtenis 2", "2002-6-1", icon_name = "bandaid-fill", icon_status = "warning",
                               text = shinipsum::random_text(nwords=20)),
                timeline_block("Gebeurtenis 3", "2014-7-15", icon_name = "chat-fill", icon_status = "primary",
                               text = shinipsum::random_text(nwords=20)),
                timeline_block("Overlijden", "2021-4-1", icon_name = "hourglass-bottom", icon_status = "danger",
                               text = shinipsum::random_text(nwords=20))
              ) 
              
  )
)

server <- function(input, output, session) {
  
}

shinyApp(ui, server)
