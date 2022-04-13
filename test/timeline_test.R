


library(softui)
library(shiny)
library(dplyr)



time_data <- tibble::tribble(
  ~timestamp, ~title, ~text, ~icon_name, ~icon_status, 
  "1956-6-1","Geboorte", shinipsum::random_text(nwords=20),"bell-fill","success",
  "1970-1-6","Gebeurtenis 1",shinipsum::random_text(nwords=20),"bag-fill", "info",
  "2002-6-1","Gebeurtenis 2",shinipsum::random_text(nwords=20),"bandaid-fill", "warning",
  "2014-7-15","Gebeurtenis 3",shinipsum::random_text(nwords=20),"chat-fill", "primary",
  "2021-4-1", "Overlijden",shinipsum::random_text(nwords=20), "hourglass-bottom", "danger"
)


ui <- softui::simple_page(
  
  softui::fluid_row(
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
                
    ),
    softui::box(title = "Test", width = 6,
                
        uiOutput("timeline")
                
    )
  )
)

server <- function(input, output, session) {
  
  output$timeline <- renderUI({
    
    softui::timeline_from_data(time_data)
    
  })
}

shinyApp(ui, server)





