


library(shiny)
library(dplyr)

#library(bslib2)
devtools::load_all()

#library(softui)
ui <- dashboard_page(title = "Shinto App")

server <- function(input, output, session) {

}

shinyApp(ui, server)



