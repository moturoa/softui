


library(shiny)
library(dplyr)

devtools::load_all()

#library(softui)
ui <- dashboard_page("Test app!")

server <- function(input, output, session) {

}

shinyApp(ui, server)



