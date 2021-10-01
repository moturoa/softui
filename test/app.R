


library(shiny)
library(dplyr)

devtools::load_all()

#library(softui)
ui <- dashboard_page(title = "Shinto App")

server <- function(input, output, session) {

}

shinyApp(ui, server)



