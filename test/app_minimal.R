
library(softui)
library(shiny)
library(dplyr)

sidebar <- softui::dashboard_sidebar(
  softui::sidebar_menu(
    softui::menu_item("Page1", tabName = "page1", icon = bsicon("bar-chart-fill")),
    softui::menu_item("Page2", tabName = "page2", icon = bsicon("tools"))
  )
)

body <- softui::dashboard_body(

  softui::tab_items(
    softui::tab_item("page1",
                     
                     column(7, class = "mx-auto",
                      softui::box(title = "Page 1", width = 12,
                                  
                                  shiny::tags$a("Dit een een klikbare link", href = "https://www.google.com"),
                                  shiny::tags$a(shiny::tags$span("Dit een een klikbare link", class = "page_link")),
                                  
                                  
                                  
                                  actionButton("btn1", "Button", class = "bg-gradient-primary"),
                                  actionButton("btn1", "Button", class = "bg-gradient-secondary"),
                                  actionButton("btn1", "Button", class = "bg-gradient-success"),
                                  actionButton("btn1", "Button", class = "bg-gradient-warning"),
                                  actionButton("btn1", "Button", class = "bg-gradient-danger"),
                                  actionButton("btn1", "Button", class = "bg-gradient-info"),
                                  
                                  shiny::tags$br(),
                                  
                                  actionButton("btn1", "Button", class = "btn-primary"),
                                  actionButton("btn1", "Button", class = "btn-success"),
                                  actionButton("btn1", "Button", class = "btn-secondary"),
                                  actionButton("btn1", "Button", class = "btn-warning"),
                                  actionButton("btn1", "Button", class = "btn-danger"),
                                  actionButton("btn1", "Button", class = "btn-info")
                                  
                                  
                                  )
                     )
    ),

    softui::tab_item("page2",
                     softui::box(title = "Page 2", width = 12)
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

server <- function(input, output, session){}

shinyApp(ui, server)
