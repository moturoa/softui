
library(softui)
#devtools::load_all()

library(shiny)
library(dplyr)

sidebar <- softui::dashboard_sidebar(
  menu = softui::sidebar_menu(
    softui::menu_item("Page1", tabName = "page1", icon = bsicon("bar-chart-fill")),
    softui::menu_item("Page2", tabName = "page2", icon = bsicon("tools"))
  ),
  
  ui_above = action_button("btn_watch", "Bekijk video!", status = "info"),
  ui_below = action_button("btn_update", "Systeem herladen", status = "success")
)

body <- softui::dashboard_body(

  softui::tab_items(
    softui::tab_item("page1",
                     
                     column(7, class = "mx-auto",
                      softui::box(title = "Page 1", width = 12, id = "thisismybox",
                                  
                                  uiOutput("idletime"),
                                  
                                  shiny::tags$a("Dit een een klikbare link", target = "_blank", href = "https://www.google.com"),
                                  tags$br(),
                                  HTML(softui::page_link(id = "abcdefgh", label = "Dit is een page_link, click me!", id_out = "persoon")),
                                  tags$br(),
                                  
                                  actionButton("btn1", softui::with_tooltip("Button","Can you read this or what?!?!"), class = "bg-gradient-primary"),
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
                                  
                                  
                        ),
                      softui::action_button("clickme", "Collapse Box!"),
                      
                      softui::box(
                        verbatimTextOutput("txtout")
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

server <- function(input, output, session){
  
  softui::route_page_link("persoon", tabName = "page2", input = input)
  
  observeEvent(input$clickme, {
    softui::collapse_box("thisismybox")
  })
  
  output$idletime <- renderUI({
    tags$p("Idle time:", input$softui_app_idle_time)
  })
  
  output$txtout <- renderPrint({
    reactiveValuesToList(input)
  })
}

shinyApp(ui, server)



