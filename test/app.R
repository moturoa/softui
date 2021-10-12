


library(shiny)
library(dplyr)

#library(bslib2)
devtools::load_all()


sidebar <- dashboard_sidebar(
  sidebar_menu(
    menu_item("Analyse", tabName = "analyse", icon = bsicon("bar-chart-fill")),
    menu_item("Administratie", tabName = "administratie", icon = bsicon("tools"))
  )
)



body <- dashboard_body(
  tab_items(
    tab_item("analyse",
             fluidRow(
               column(
                 7,
                 value_box("1251", "Documenten", "+18",
                           icon = bsicon("file-earmark-bar-graph")),
                 value_box("820", "Personen", "+4",
                           icon = bsicon("person-plus-fill")),

                 tags$h2("Analyse"),
                 tags$p(
                   "Hallo dan", icon("home"), bsicon("house")
                 ),
                 tags$p(
                   "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sit amet tortor ut libero finibus dictum bibendum ut lorem. Ut nisi arcu, feugiat vitae tortor at, iaculis venenatis metus. Morbi dui elit, aliquam at sem molestie, dignissim malesuada dui. Vivamus cursus a dolor et laoreet. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pharetra lectus ac ex hendrerit, in cursus nulla eleifend. Pellentesque ut velit fringilla, pulvinar nisl non, mollis purus. Etiam blandit augue quis augue congue fringilla. Pellentesque rutrum, tellus a venenatis porta, nisl augue tincidunt nisl, at tempor elit nisl ac massa. Praesent finibus, nibh vehicula euismod malesuada, diam nunc pellentesque ipsum, ac tempus tellus mauris sit amet ligula. Nullam euismod eget velit ac consequat. Integer finibus blandit diam, nec sollicitudin neque viverra eu."
                 ),

                 tab_box(selected = "Twee",
                         tab_panel("Een", tags$p("content"), icon = icon("home")),
                         tab_panel("Twee", tags$p("meer content"))
                 )

               )
             )),
    tab_item("administratie",

             tags$h2("Administratie"),
             tags$p(
               "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sit amet tortor ut libero finibus dictum bibendum ut lorem. Ut nisi arcu, feugiat vitae tortor at, iaculis venenatis metus. Morbi dui elit, aliquam at sem molestie, dignissim malesuada dui. Vivamus cursus a dolor et laoreet. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pharetra lectus ac ex hendrerit, in cursus nulla eleifend. Pellentesque ut velit fringilla, pulvinar nisl non, mollis purus. Etiam blandit augue quis augue congue fringilla. Pellentesque rutrum, tellus a venenatis porta, nisl augue tincidunt nisl, at tempor elit nisl ac massa. Praesent finibus, nibh vehicula euismod malesuada, diam nunc pellentesque ipsum, ac tempus tellus mauris sit amet ligula. Nullam euismod eget velit ac consequat. Integer finibus blandit diam, nec sollicitudin neque viverra eu."
             )
    )

  )
)


header <- dashboard_header(
  tags$li(
    class = "nav-item d-flex align-items-center",
    #bsicon("person-circle"),

    tags$a(
      class = "nav-link",
      icon("user"),
      tags$span(
        class="d-sm-inline d-none",
        "Log out"
      )
    )

  )
)

#library(softui)
ui <- dashboard_page(title = "Shinto App",
                     header = header,
                     sidebar = sidebar,
                     body = body)

server <- function(input, output, session) {

}

shinyApp(ui, server)



