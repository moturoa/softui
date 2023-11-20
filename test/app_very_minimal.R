

#library(softui)
devtools::load_all()

library(shiny)
library(dplyr)

sidebar <- softui::dashboard_sidebar(
  
  menu = softui::sidebar_menu(
    
    softui::menu_item("Page 1", tabName = "page1", icon = bsicon("tools"))
  )
  
)

body <- softui::dashboard_body(
  
  softui::tab_items(
    softui::tab_item("page1",
       
                     
              
                                 
       )
    )
  
)

header <- softui::dashboard_header(
  tag_line = "A tag line"
)

ui <- softui::dashboard_page(title = "Shinto App",
                             loadingscreen_time = 1,
                             header = header,
                             sidebar = sidebar,
                             body = body)

server <- function(input, output, session){
  

}

shinyApp(ui, server)




