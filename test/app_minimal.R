
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
                      softui::box(title = "Page 1", width = 12)
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

shinyApp(ui, server)
