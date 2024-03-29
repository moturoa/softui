



#devtools::load_all()
library(softui)

library(shiny)
library(dplyr)
library(bslib)
library(fontawesome)
library(ggplot2)
library(dqshiny)
library(shinyWidgets)

sidebar <- softui::dashboard_sidebar(
  softui::sidebar_menu(id = "sidebar",
    softui::menu_item("Analyse", tabName = "analyse", icon = bsicon("bar-chart-fill")),
    softui::menu_item("Administratie", tabName = "administratie", icon = bsicon("tools")),
    
    softui::menu_item("Submenu", icon = bsicon("cloud-moon-fill"),
                      
                      softui::menu_subitem("Kleine pagina 1", "minipage1"),
                      softui::menu_subitem("Kleine pagina 2", "minipage2")
                      
                      ),
    
    softui::menu_item("Submenu2", icon = bsicon("cloud-moon-fill"),
                      
                      softui::menu_subitem("Kleine pagina 3", "minipage3"),
                      softui::menu_subitem("Kleine pagina 4", "minipage4")
                      
    ),
    
    softui::menu_output("extra_menu"),  # typical menuoutput
    softui::restricted_menu_item("superuser_menu")    # more integrated / experimental

  )
)



body <- softui::dashboard_body(
  

  softui::tab_items(
    softui::tab_item("analyse",

             shiny::tags$h2(class="font-weight-bolder mb-0", "SoftUI test app"),
             softui::fluid_row(
               softui::box(
                 softui::alert_box("Dit is een belangrijke tekst!", status = "warning"),
                 softui::action_button("btn_disable", "Test disable", status = "warning")
               )
             ),
             
             softui::fluid_row(
               column(8,

                 softui::fluid_row(
                   column(6,
                          
                    
                          
                          
                     softui::value_box("1251", "Documenten", "+18",
                               width = 12,
                               height = "200px",
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
               
               softui::tab_box(width = 6, 
                               id = "front_tabbox",
                               fill = TRUE,

                        softui::tab_panel("Picker select", value = "picker",
                                          icon = bsicon("list-task"),
                                          
                                          actionButton("btn_switch", "Go to other tab", class = "btn-primary")

                        ),       
                               
                        softui::tab_panel("Data", icon = bsicon("clipboard-data"), value = "data",

                          fluid_row(
                            column(6, 
                                 sliderInput("slide1", "Slider", min=0, max=100, value = c(0,50)),
                                 textInput("text1", "Text"),
                                 shinyWidgets::numericRangeInput("num1", "Num range", value = c(0,100)),
                                 shinyWidgets::materialSwitch("tog1", "Toggle", value = TRUE, status = "primary")
                            ),
                            column(6, 
                                 selectInput("sel1", "Select", choices = rownames(mtcars), multiple=TRUE),
                                 selectInput("sel1", "Select", choices = rownames(mtcars), multiple=FALSE),
                                 
                                 # werkt goed!
                                 # --> alleen enkele selectie
                                 dqshiny::autocomplete_input("aut1","Autocomplete", 
                                                             placeholder = "Zoek iets",
                                                             contains = TRUE,
                                                             options = rownames(mtcars)),
                                 
                                 # werkt niet!
                                 shinyWidgets::pickerInput("pick1", "Picker", choices = rownames(mtcars), multiple = TRUE)
                            )
                          )
                        ),
                        softui::tab_panel("Buttons", icon = icon("chart-bar"), value = "buttons",
                                          

                                          shiny::tags$p("Test icon: ", icon("home")),
                                          actionButton("btn1", "Primary", class = "btn-primary", icon = bsicon("check")),
                                          actionButton("btn2", "Secondary", class = "btn-secondary", icon = bsicon("clipboard-data")),
                                          actionButton("btn3", "Warning", class = "btn-warning", icon = bsicon("alarm-fill")),
                                          actionButton("btn4", "Success", class = "btn-success", icon = bsicon("bricks")),
                                          actionButton("btn5", "Info", class = "btn-info"),
                                          actionButton("btn6", "Light", class = "btn-light")
                                          
                                          ),
                        softui::tab_panel("Analyse",
                                 icon = bsicon("graph-up"),
                                 
                                 
                                 softui::tabset_panel(
                                   softui::tab_panel(
                                     title = "Test tab 1",
                                     tags$p("content tab 1")
                                   ),
                                   softui::tab_panel(
                                     title = "Test tab 2",
                                     tags$p("content tab 2")
                                   )
                                 )
                                 
                                 
                       )
               ),
               column(6,
                  softui::box(
                     title = "Achtergrond",
                     subtitle = "Meer informatie over deze analyse",
                     tag = "info",
                     
                     
                     softui::sub_box(
                       collapsible = TRUE, collapsed = TRUE, title = "Sub box",
                       tags$p("hidden content"),
                       tags$p("more hidden content")
                     ),

                     shiny::tags$p(
                       "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sit amet tortor ut libero finibus dictum bibendum ut lorem. Ut nisi arcu, feugiat vitae tortor at, iaculis venenatis metus. Morbi dui elit, aliquam at sem molestie, dignissim malesuada dui. Vivamus cursus a dolor et laoreet. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pharetra lectus ac ex hendrerit, in cursus nulla eleifend. Pellentesque ut velit fringilla, pulvinar nisl non, mollis purus. Etiam blandit augue quis augue congue fringilla. Pellentesque rutrum, tellus a venenatis porta, nisl augue tincidunt nisl, at tempor elit nisl ac massa. Praesent finibus, nibh vehicula euismod malesuada, diam nunc pellentesque ipsum, ac tempus tellus mauris sit amet ligula. Nullam euismod eget velit ac consequat. Integer finibus blandit diam, nec sollicitudin neque viverra eu."
                     )

                 )
               )

             )
    ),

    softui::tab_item("administratie",


            softui::fluid_page(
              
              softui::box(width = 6, title = "Timeline", icon = bsicon("alarm-fill", class = "text-info text-gradient"),
                          
                timeline(
                  timeline_block("Geboorte", "1956-6-1", icon_name = "bell-fill", icon_status = "success",
                                 text = shinipsum::random_text(nwords=20)),
                  timeline_block("Gebeurtenis 1", "1970-1-6", icon_name = "bag-fill", icon_status = "info",
                                 text = shinipsum::random_text(nwords=20)),
                  timeline_block("Gebeurtenis 2", "2002-6-1", icon_name = "bandaid-fill", icon_status = "warning",
                                 text = shinipsum::random_text(nwords=20)),
                  timeline_block("Gebeurtenis 3", "2014-7-15", icon_name = "chat-fill", icon_status = "primary",
                                 text = shinipsum::random_text(nwords=20)),
                  timeline_block("Overlijden", "2021-4-1", icon_name = "hourglass-bottom", icon_status = "danger",
                                 text = shinipsum::random_text(nwords=20))
                )
                          
              ),
              
              
              softui::fluid_row(
                softui::box(
                   title = "Box 1",
                   subtitle = "This is a subtitle",
                   width = 6,
                   collapsible =TRUE,
                   collapsed=FALSE,
                   shiny::tags$p(
                     "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sit amet tortor ut libero finibus dictum bibendum ut lorem. Ut nisi arcu, feugiat vitae tortor at, iaculis venenatis metus. Morbi dui elit, aliquam at sem molestie, dignissim malesuada dui. Vivamus cursus a dolor et laoreet. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pharetra lectus ac ex hendrerit, in cursus nulla eleifend. Pellentesque ut velit fringilla, pulvinar nisl non, mollis purus. Etiam blandit augue quis augue congue fringilla. Pellentesque rutrum, tellus a venenatis porta, nisl augue tincidunt nisl, at tempor elit nisl ac massa. Praesent finibus, nibh vehicula euismod malesuada, diam nunc pellentesque ipsum, ac tempus tellus mauris sit amet ligula. Nullam euismod eget velit ac consequat. Integer finibus blandit diam, nec sollicitudin neque viverra eu."
                   )
                 ),
                softui::box(
                   title = "Box 2",
                   subtitle = "This is a subtitle",
                   tag = "info",
                   width = 6,
                   collapsible =TRUE,
                   collapsed=TRUE,
                   shiny::tags$p(
                     "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sit amet tortor ut libero finibus dictum bibendum ut lorem. Ut nisi arcu, feugiat vitae tortor at, iaculis venenatis metus. Morbi dui elit, aliquam at sem molestie, dignissim malesuada dui. Vivamus cursus a dolor et laoreet. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pharetra lectus ac ex hendrerit, in cursus nulla eleifend. Pellentesque ut velit fringilla, pulvinar nisl non, mollis purus. Etiam blandit augue quis augue congue fringilla. Pellentesque rutrum, tellus a venenatis porta, nisl augue tincidunt nisl, at tempor elit nisl ac massa. Praesent finibus, nibh vehicula euismod malesuada, diam nunc pellentesque ipsum, ac tempus tellus mauris sit amet ligula. Nullam euismod eget velit ac consequat. Integer finibus blandit diam, nec sollicitudin neque viverra eu."
                   )
                 )
               ),
              softui::fluid_row(
                softui::box(
                   title = "Box 3",
                   width = 6,
                   height = 1000,
                   collapsible =TRUE,
                   shiny::tags$p(
                     "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sit amet tortor ut libero finibus dictum bibendum ut lorem. Ut nisi arcu, feugiat vitae tortor at, iaculis venenatis metus. Morbi dui elit, aliquam at sem molestie, dignissim malesuada dui. Vivamus cursus a dolor et laoreet. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pharetra lectus ac ex hendrerit, in cursus nulla eleifend. Pellentesque ut velit fringilla, pulvinar nisl non, mollis purus. Etiam blandit augue quis augue congue fringilla. Pellentesque rutrum, tellus a venenatis porta, nisl augue tincidunt nisl, at tempor elit nisl ac massa. Praesent finibus, nibh vehicula euismod malesuada, diam nunc pellentesque ipsum, ac tempus tellus mauris sit amet ligula. Nullam euismod eget velit ac consequat. Integer finibus blandit diam, nec sollicitudin neque viverra eu."
                   )
                 ),
                softui::box(
                   title = "Box 4",
                   width = 6,
                   shiny::tags$p(
                     "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sit amet tortor ut libero finibus dictum bibendum ut lorem. Ut nisi arcu, feugiat vitae tortor at, iaculis venenatis metus. Morbi dui elit, aliquam at sem molestie, dignissim malesuada dui. Vivamus cursus a dolor et laoreet. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pharetra lectus ac ex hendrerit, in cursus nulla eleifend. Pellentesque ut velit fringilla, pulvinar nisl non, mollis purus. Etiam blandit augue quis augue congue fringilla. Pellentesque rutrum, tellus a venenatis porta, nisl augue tincidunt nisl, at tempor elit nisl ac massa. Praesent finibus, nibh vehicula euismod malesuada, diam nunc pellentesque ipsum, ac tempus tellus mauris sit amet ligula. Nullam euismod eget velit ac consequat. Integer finibus blandit diam, nec sollicitudin neque viverra eu."
                   )
                 )
               )

              
             )

    ),
    
    softui::tab_item("extra", 
                     
                     
                     softui::fluid_page(
                       softui::fluid_row(
                         softui::box(width = 6,
                                     title = "Extra!",
                                     shiny::tags$p("Extra, extra, read all about it")
                         )
                       )
                     )
                     
                     
    ),
    
    softui::tab_item("administratie", 
                     
                     
                     shiny::tags$p("Found me!")
                     
                     ),
    
    softui::tab_item("minipage1", 
                     
                     
                     shiny::tags$p("Minipage 1 !!")
                     
    ),
    
    softui::tab_item("minipage2", 
                     
                     
                     shiny::tags$p("Minipage 2 !!")
                     
    ),
    
    softui::tab_item("minipage3", 
                     
                     
                     shiny::tags$p("Minipage 3 !!")
                     
    ),
    
    softui::tab_item("minipage4", 
                     
                     
                     shiny::tags$p("Minipage 4 !!")
                     
    )
    

  )
)


header <- softui::dashboard_header(

  softui::dropdown_item(bsicon("gear-fill"), 
                        shiny::tags$p("Version: 0.1"),
                        shiny::tags$p("More information here"),
                        header = "App Info",
                        align_right = TRUE
                        ),
  softui::dropdown_item(bsicon("person-circle"), 
                        header = "Gebruiker",
                        shiny::tags$p("Ingelogd als Remko"),
                        align_right = TRUE
  ),
  
  tag_line = "Wat een nuttige applicatie"
  
)



ui <- softui::dashboard_page(title = "Shinto App",
                             loadingscreen_time = 1,
                             header = header,
                             sidebar = sidebar,
                             body = body)

server <- function(input, output, session) {


  shiny::callModule(restricted_menu_item_module, "superuser_menu", 
             text = "Superuser", 
             tabName = "superuser",
             icon = bsicon("incognito"),
             user_group = "superuser",
             allowed_groups = "superuser")
  
  
  output$extra_menu <- renderUI({
    softui::menu_item("Extra", tabName = "extra", icon = bsicon("cart-plus"))
  })
  
  output$plot1 <- renderPlot({

    ggplot(mtcars, aes(x = wt, y = disp, colour = cyl)) +
      geom_point(size=4) +
      theme_minimal()

  })
  
  observeEvent(input$btn_disable, {
    disable_link("administratie")
  })
  
  observeEvent(input$btn_press, {message("pressed")})

  
  observeEvent(input$btn1, {
    softui::go_to_page("minipage2")
  })
  
  observeEvent(input$btn_switch, {
    update_tabpanel("front_tabbox", selected = "buttons")
  })
  
  
  observeEvent(input$btn1, {
    showModal(
      modalDialog(
        title = "Dit is een test model",
        size = "l",
        shiny::tags$h2("Tekst in h2"),
        shiny::tags$h3("Tekst in h3"),
        shiny::tags$h4("Tekst in h4"),
        shiny::tags$h5("Tekst in h5")
      )
    )
  })
  
  output$extra_menu <- renderUI({
    softui::menu_link(tabName = "extra",icon = bsicon("send-plus-fill"),text = "Extra!")
  })


}

shinyApp(ui, server)



