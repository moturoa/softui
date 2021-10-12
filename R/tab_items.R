tab_items <- function(){


  fluid_page(

    tags$div(
    class = "tab-content",

    tags$div(class = "tab-pane fade show active",
             id = "shiny-tab-analyse",

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
                   tab_item("Een", tags$p("content"), icon = icon("home")),
                   tab_item("Twee", tags$p("meer content"))
                 )

               )
             )),
    tags$div(
      class = "tab-pane",
      id = "shiny-tab-administratie",
      tags$h2("Administratie"),
      tags$p(
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sit amet tortor ut libero finibus dictum bibendum ut lorem. Ut nisi arcu, feugiat vitae tortor at, iaculis venenatis metus. Morbi dui elit, aliquam at sem molestie, dignissim malesuada dui. Vivamus cursus a dolor et laoreet. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pharetra lectus ac ex hendrerit, in cursus nulla eleifend. Pellentesque ut velit fringilla, pulvinar nisl non, mollis purus. Etiam blandit augue quis augue congue fringilla. Pellentesque rutrum, tellus a venenatis porta, nisl augue tincidunt nisl, at tempor elit nisl ac massa. Praesent finibus, nibh vehicula euismod malesuada, diam nunc pellentesque ipsum, ac tempus tellus mauris sit amet ligula. Nullam euismod eget velit ac consequat. Integer finibus blandit diam, nec sollicitudin neque viverra eu."
      )
    )
  ))

}
