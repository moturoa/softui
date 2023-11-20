


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
                     
        softui::tab_page(ui_above_nav = tags$h4("Casus"),
          
          softui::tab_panel(title = "tab1", style = "background-color: hotpink;",
                            
              softui::box(title = "sub-box1", plotOutput("plot1")),
              softui::box(title = "sub-box2", plotOutput("plot2"))
          ),
          softui::tab_panel(title = "tab2",
              
              softui::box(title = "sub-box3", plotOutput("plot1")),
              softui::box(title = "sub-box4", plotOutput("plot2"))
          )
          
        ) 
                     
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





