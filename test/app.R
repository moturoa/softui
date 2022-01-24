


library(shiny)
library(dplyr)
library(shinyWidgets)

library(bslib)
devtools::load_all()
#library(softui)

sidebar <- dashboard_sidebar(
  sidebar_menu(
    menu_item("Analyse", tabName = "analyse", icon = bsicon("bar-chart-fill")),
    menu_item("Administratie", tabName = "administratie", icon = bsicon("tools"))
  )
)



body <- dashboard_body(
  includeCSS(system.file("assets/css/soft-ui-dashboard.css", package = "softui")),
  includeCSS(system.file("assets/softuiextra/softuiextra.css", package = "softui")),
  
  tab_items(
    tab_item("analyse",

             tags$h2(class="font-weight-bolder mb-0", "SoftUI test app"),
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
               tab_box(width = 6, type = "pills", fill = TRUE,

                       tab_panel("Data",
                                 icon = bsicon("clipboard-data"),

                                 sliderInput("slide1", "Slider", min=0, max=100, value = c(0,50)),
                                 textInput("text1", "Text"),
                                 shinyWidgets::numericRangeInput("num1", "Num range", value = c(0,100)),
                                 shinyWidgets::materialSwitch("tog1", "Toggle", value = TRUE, status = "primary"),
                                 
                                 selectInput("sel1", "Select", choices = rownames(mtcars), multiple=TRUE),
                                 selectInput("sel1", "Select", choices = rownames(mtcars), multiple=FALSE)

                                 ),
                       tab_panel("Analyse",
                                 icon = bsicon("graph-up"),
                                 plotOutput("plot1")
                       )
               ),
               column(6,
                 box(
                     title = "Achtergrond",
                     subtitle = "Meer informatie over deze analyse",
                     tag = "info",

                     tags$p(
                       "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sit amet tortor ut libero finibus dictum bibendum ut lorem. Ut nisi arcu, feugiat vitae tortor at, iaculis venenatis metus. Morbi dui elit, aliquam at sem molestie, dignissim malesuada dui. Vivamus cursus a dolor et laoreet. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pharetra lectus ac ex hendrerit, in cursus nulla eleifend. Pellentesque ut velit fringilla, pulvinar nisl non, mollis purus. Etiam blandit augue quis augue congue fringilla. Pellentesque rutrum, tellus a venenatis porta, nisl augue tincidunt nisl, at tempor elit nisl ac massa. Praesent finibus, nibh vehicula euismod malesuada, diam nunc pellentesque ipsum, ac tempus tellus mauris sit amet ligula. Nullam euismod eget velit ac consequat. Integer finibus blandit diam, nec sollicitudin neque viverra eu."
                     )

                 )
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

  header_item(bsicon("person-square")),
  header_item(bsicon("gear-fill"))

)






#library(softui)

library(ggplot2)

ui <- dashboard_page(title = "Shinto App",
                     header = header,
                     sidebar = sidebar,
                     body = body)

server <- function(input, output, session) {


  output$plot1 <- renderPlot({

    ggplot(mtcars, aes(x = wt, y = disp, colour = cyl)) +
      geom_point(size=4) +
      theme_minimal()

  })
  
  observeEvent(input$btn_press, {message("pressed")})

}

shinyApp(ui, server)



