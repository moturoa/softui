


library(shiny)
library(dplyr)
library(shinyWidgets)
library(bslib)
library(fontawesome)

library(softui)

sidebar <- softui::dashboard_sidebar(
  softui::sidebar_menu(id = "sidebar",
    softui::menu_item("Analyse", tabName = "analyse", icon = bsicon("bar-chart-fill")),
    softui::menu_item("Administratie", tabName = "administratie", icon = bsicon("tools"))
  )
)



body <- softui::dashboard_body(
  

  softui::tab_items(
    softui::tab_item("analyse",

             tags$h2(class="font-weight-bolder mb-0", "SoftUI test app"),
             softui::fluid_row(
               column(8,

                 softui::fluid_row(
                   column(6,
                          
                     softui::value_box("1251", "Documenten", "+18",
                               width = 12,
                               icon = bsicon("file-earmark-bar-graph")),
                     softui::value_box("820", "Personen", "+4",
                               width = 12,
                               icon = bsicon("person-plus-fill"))
                   ),
                   column(6,
                     softui::value_box("48", "Open dossiers", "-14", sub_status = "danger",
                               width = 12,
                               icon = bsicon("file-earmark-lock2")),
                     softui::value_box("120", "Geleverde datasets", "-10", sub_status = "danger",
                               width = 12,
                               icon = bsicon("box-seam"))
                   )
                 )
               )
               
             ),
             fluid_row(
               softui::tab_box(width = 6, type = "pills", fill = TRUE,

                        softui::tab_panel("Data", icon = bsicon("clipboard-data"),

                          fluid_row(
                            column(6, 
                                 sliderInput("slide1", "Slider", min=0, max=100, value = c(0,50)),
                                 textInput("text1", "Text"),
                                 shinyWidgets::numericRangeInput("num1", "Num range", value = c(0,100)),
                                 shinyWidgets::materialSwitch("tog1", "Toggle", value = TRUE, status = "primary")
                            ),
                            column(6, 
                                 selectInput("sel1", "Select", choices = rownames(mtcars), multiple=TRUE),
                                 selectInput("sel1", "Select", choices = rownames(mtcars), multiple=FALSE)
                            )
                          )
                        ),
                        softui::tab_panel("Test", icon = icon("chart-bar"),
                                          
                                          tags$p("Test icon: ", icon("home")),
                                          actionButton("btn1", "Primary", class = "btn-primary"),
                                          actionButton("btn2", "Secondary", class = "btn-secondary"),
                                          actionButton("btn3", "Warning", class = "btn-warning", onclick = "selectMenuItem('HIER!!!');"),
                                          actionButton("btn4", "Success", class = "btn-success"),
                                          actionButton("btn5", "Info", class = "btn-info"),
                                          actionButton("btn6", "Light", class = "btn-light")
                                          
                                          ),
                        softui::tab_panel("Analyse",
                                 icon = bsicon("graph-up"),
                                 plotOutput("plot1")
                       )
               ),
               column(6,
                  softui::box(
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

    softui::tab_item("administratie",


            softui::fluid_page(
              softui::fluid_row(
                softui::box(
                   title = "Box 1",
                   width = 6,
                   tags$p(
                     "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sit amet tortor ut libero finibus dictum bibendum ut lorem. Ut nisi arcu, feugiat vitae tortor at, iaculis venenatis metus. Morbi dui elit, aliquam at sem molestie, dignissim malesuada dui. Vivamus cursus a dolor et laoreet. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pharetra lectus ac ex hendrerit, in cursus nulla eleifend. Pellentesque ut velit fringilla, pulvinar nisl non, mollis purus. Etiam blandit augue quis augue congue fringilla. Pellentesque rutrum, tellus a venenatis porta, nisl augue tincidunt nisl, at tempor elit nisl ac massa. Praesent finibus, nibh vehicula euismod malesuada, diam nunc pellentesque ipsum, ac tempus tellus mauris sit amet ligula. Nullam euismod eget velit ac consequat. Integer finibus blandit diam, nec sollicitudin neque viverra eu."
                   )
                 ),
                softui::box(
                   title = "Box 2",
                   width = 6,
                   tags$p(
                     "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sit amet tortor ut libero finibus dictum bibendum ut lorem. Ut nisi arcu, feugiat vitae tortor at, iaculis venenatis metus. Morbi dui elit, aliquam at sem molestie, dignissim malesuada dui. Vivamus cursus a dolor et laoreet. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pharetra lectus ac ex hendrerit, in cursus nulla eleifend. Pellentesque ut velit fringilla, pulvinar nisl non, mollis purus. Etiam blandit augue quis augue congue fringilla. Pellentesque rutrum, tellus a venenatis porta, nisl augue tincidunt nisl, at tempor elit nisl ac massa. Praesent finibus, nibh vehicula euismod malesuada, diam nunc pellentesque ipsum, ac tempus tellus mauris sit amet ligula. Nullam euismod eget velit ac consequat. Integer finibus blandit diam, nec sollicitudin neque viverra eu."
                   )
                 )
               ),
              softui::fluid_row(
                softui::box(
                   title = "Box 3",
                   width = 6,
                   tags$p(
                     "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sit amet tortor ut libero finibus dictum bibendum ut lorem. Ut nisi arcu, feugiat vitae tortor at, iaculis venenatis metus. Morbi dui elit, aliquam at sem molestie, dignissim malesuada dui. Vivamus cursus a dolor et laoreet. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pharetra lectus ac ex hendrerit, in cursus nulla eleifend. Pellentesque ut velit fringilla, pulvinar nisl non, mollis purus. Etiam blandit augue quis augue congue fringilla. Pellentesque rutrum, tellus a venenatis porta, nisl augue tincidunt nisl, at tempor elit nisl ac massa. Praesent finibus, nibh vehicula euismod malesuada, diam nunc pellentesque ipsum, ac tempus tellus mauris sit amet ligula. Nullam euismod eget velit ac consequat. Integer finibus blandit diam, nec sollicitudin neque viverra eu."
                   )
                 ),
                softui::box(
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


header <- softui::dashboard_header(

  softui::dropdown_item(bsicon("gear-fill"), 
                        tags$p("Version: 0.1"),
                        tags$p("More information here"),
                        header = "App Info",
                        align_right = TRUE
                        ),
  softui::dropdown_item(bsicon("person-circle"), 
                        header = "Gebruiker",
                        tags$p("Ingelogd als Remko"),
                        align_right = TRUE
  )

)






#library(softui)

library(ggplot2)

ui <- softui::dashboard_page(title = "Shinto App",
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

  
  observeEvent(input$btn1, {
    showModal(
      modalDialog(
        title = "Dit is een test model",
        size = "l",
        tags$h2("Tekst in h2"),
        tags$h3("Tekst in h3"),
        tags$h4("Tekst in h4"),
        tags$h5("Tekst in h5")
      )
    )
  })
  
  
  observeEvent(input$btn2, {
    
    softui::update_tab_item("administratie")
    
  })
  
}

shinyApp(ui, server)



