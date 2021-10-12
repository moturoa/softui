


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

             fluid_row(
               column(8,


                 fluid_row(
                   column(6,
                     value_box("1251", "Documenten", "+18",
                               width = 12,
                               icon = bsicon("file-earmark-bar-graph")),
                     value_box("820", "Personen", "+4",
                               width = 12,
                               icon = bsicon("person-plus-fill"))
                   ),
                   column(6,
                     value_box("48", "Open dossiers", "-14", sub_status = "danger",
                               width = 12,
                               icon = bsicon("file-earmark-lock2")),
                     value_box("120", "Geleverde datasets", "-10", sub_status = "danger",
                               width = 12,
                               icon = bsicon("box-seam"))
                   )
                 )
               )
             ),
             fluid_row(
               box(
                   title = "Analyse",

                   tags$p(
                     "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sit amet tortor ut libero finibus dictum bibendum ut lorem. Ut nisi arcu, feugiat vitae tortor at, iaculis venenatis metus. Morbi dui elit, aliquam at sem molestie, dignissim malesuada dui. Vivamus cursus a dolor et laoreet. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pharetra lectus ac ex hendrerit, in cursus nulla eleifend. Pellentesque ut velit fringilla, pulvinar nisl non, mollis purus. Etiam blandit augue quis augue congue fringilla. Pellentesque rutrum, tellus a venenatis porta, nisl augue tincidunt nisl, at tempor elit nisl ac massa. Praesent finibus, nibh vehicula euismod malesuada, diam nunc pellentesque ipsum, ac tempus tellus mauris sit amet ligula. Nullam euismod eget velit ac consequat. Integer finibus blandit diam, nec sollicitudin neque viverra eu."
                   )

               )
             ),
             fluid_row(
               tab_box(selected = "Twee",
                     tab_panel("Een", tags$p("content"), icon = icon("home")),
                     tab_panel("Twee", tags$p("meer content"))
               )
             )

    ),

    tab_item("administratie",


             fluid_page(
               fluid_row(
                 box(
                   title = "Box 1",
                   width = 6,
                   tags$p(
                     "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sit amet tortor ut libero finibus dictum bibendum ut lorem. Ut nisi arcu, feugiat vitae tortor at, iaculis venenatis metus. Morbi dui elit, aliquam at sem molestie, dignissim malesuada dui. Vivamus cursus a dolor et laoreet. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pharetra lectus ac ex hendrerit, in cursus nulla eleifend. Pellentesque ut velit fringilla, pulvinar nisl non, mollis purus. Etiam blandit augue quis augue congue fringilla. Pellentesque rutrum, tellus a venenatis porta, nisl augue tincidunt nisl, at tempor elit nisl ac massa. Praesent finibus, nibh vehicula euismod malesuada, diam nunc pellentesque ipsum, ac tempus tellus mauris sit amet ligula. Nullam euismod eget velit ac consequat. Integer finibus blandit diam, nec sollicitudin neque viverra eu."
                   )
                 ),
                 box(
                   title = "Box 2",
                   width = 6,
                   tags$p(
                     "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sit amet tortor ut libero finibus dictum bibendum ut lorem. Ut nisi arcu, feugiat vitae tortor at, iaculis venenatis metus. Morbi dui elit, aliquam at sem molestie, dignissim malesuada dui. Vivamus cursus a dolor et laoreet. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pharetra lectus ac ex hendrerit, in cursus nulla eleifend. Pellentesque ut velit fringilla, pulvinar nisl non, mollis purus. Etiam blandit augue quis augue congue fringilla. Pellentesque rutrum, tellus a venenatis porta, nisl augue tincidunt nisl, at tempor elit nisl ac massa. Praesent finibus, nibh vehicula euismod malesuada, diam nunc pellentesque ipsum, ac tempus tellus mauris sit amet ligula. Nullam euismod eget velit ac consequat. Integer finibus blandit diam, nec sollicitudin neque viverra eu."
                   )
                 )
               ),
               fluid_row(
                 box(
                   title = "Box 3",
                   width = 6,
                   tags$p(
                     "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sit amet tortor ut libero finibus dictum bibendum ut lorem. Ut nisi arcu, feugiat vitae tortor at, iaculis venenatis metus. Morbi dui elit, aliquam at sem molestie, dignissim malesuada dui. Vivamus cursus a dolor et laoreet. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pharetra lectus ac ex hendrerit, in cursus nulla eleifend. Pellentesque ut velit fringilla, pulvinar nisl non, mollis purus. Etiam blandit augue quis augue congue fringilla. Pellentesque rutrum, tellus a venenatis porta, nisl augue tincidunt nisl, at tempor elit nisl ac massa. Praesent finibus, nibh vehicula euismod malesuada, diam nunc pellentesque ipsum, ac tempus tellus mauris sit amet ligula. Nullam euismod eget velit ac consequat. Integer finibus blandit diam, nec sollicitudin neque viverra eu."
                   )
                 ),
                 box(
                   title = "Box 4",
                   width = 6,
                   tags$p(
                     "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sit amet tortor ut libero finibus dictum bibendum ut lorem. Ut nisi arcu, feugiat vitae tortor at, iaculis venenatis metus. Morbi dui elit, aliquam at sem molestie, dignissim malesuada dui. Vivamus cursus a dolor et laoreet. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pharetra lectus ac ex hendrerit, in cursus nulla eleifend. Pellentesque ut velit fringilla, pulvinar nisl non, mollis purus. Etiam blandit augue quis augue congue fringilla. Pellentesque rutrum, tellus a venenatis porta, nisl augue tincidunt nisl, at tempor elit nisl ac massa. Praesent finibus, nibh vehicula euismod malesuada, diam nunc pellentesque ipsum, ac tempus tellus mauris sit amet ligula. Nullam euismod eget velit ac consequat. Integer finibus blandit diam, nec sollicitudin neque viverra eu."
                   )
                 )
               )
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



