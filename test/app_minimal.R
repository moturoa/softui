
#library(softui)
devtools::load_all()

library(shiny)
library(dplyr)

sidebar <- softui::dashboard_sidebar(
  
  menu = softui::sidebar_menu(
    
    softui::menu_item("Page1", icon = bsicon("bar-chart-fill"),
                      softui::menu_subitem("Sub-pagina 1", tabName = "page1"),
                      softui::menu_subitem("Sub-pagina 2", tabName = "page2")
                      ),
    softui::menu_item("Page2", icon = bsicon("bar-chart-fill"),
                      softui::menu_subitem("Sub-pagina 3", tabName = "page3"),
                      softui::menu_subitem("Sub-pagina 4", tabName = "page4")
    )
    #softui::menu_item("Page2", tabName = "page2", icon = bsicon("tools"))
  )
  
  # ui_above = action_button("btn_watch", "Bekijk video!", status = "info"),
  # ui_below = action_button("btn_update", "Systeem herladen", status = "success")
)

body <- softui::dashboard_body(

  softui::tab_items(
    softui::tab_item("page1",
                     
                     column(7, class = "mx-auto",
                      softui::box(title = "Page 1", width = 12, id = "thisismybox",
                                  
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
                        uiOutput("idletime"),
                        tags$hr(),
                        verbatimTextOutput("txtout")
                      )
                     )
    ),

    softui::tab_item("page2",
                     softui::box(title = "Page 2", width = 12,
                                 
                                 
                                 
                                 value_icon_table(
                                   value_icon_item("Signalen", bsicon("shield-shaded"),
                                                   value = "121", value_suffix = "ingevoerd",
                                                   sub_value = "+12", sub_value_suffix = "vorige maand"
                                                   ),
                                   value_icon_item("Acties", bsicon("flag-fill"),
                                                   value = "54", value_suffix = "ingevoerd",
                                                   sub_value = "+5", sub_value_suffix = "vorige maand"
                                   )
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
  
  softui::route_page_link("persoon", tabName = "page2", input = input)
  
  observeEvent(input$clickme, {
    softui::collapse_box("thisismybox")
  })

  
  output$txtout <- renderPrint({
    reactiveValuesToList(input)
  })
  
  
  idle_time <- softui::idle_timeout(timeout_warning = 30) 
  output$idletime <- renderUI(tags$p("Idle time:",idle_time()))
}

shinyApp(ui, server)



