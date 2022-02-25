
#' Soft UI dashboard page
#' @description Main function to make the Soft UI dashboard page in shiny.
#' @param header Made with `softui::dashboard_header`
#' @param sidebar Made with `softui::dashboard_sidebar`
#' @param body Made with `softui::dashboard_body`
#' @param title App title (shown topleft)
#' @param icon An icon for the very topleft
#' @param loadingscreen_time How many seconds to show the Shinto loading screen
#' @param busybar_color Color of the 'busy bar' when shiny is busy
#' @param disconnect_message Message to show when session is disconnected (timeout / error)
#' @export
dashboard_page <- function(header, sidebar, body, title = "", 
                           icon = softui::bsicon("speedometer"),
                           loadingscreen_time = 4,
                           busybar_color = "#346E6E",
                           shinto_logo = TRUE,
                           disconnect_message = "De sessie is verlopen of er ging iets fout!"
                           ){


  head_tag <- shiny::tags$head(
    shiny::tags$meta(charset = "utf-8"),
    shiny::tags$meta(
      name = "viewport",
      content = "width=device-width, initial-scale=1, shrink-to-fit=no"
    ),
    shiny::tags$meta(`http-equiv` = "x-ua-compatible", content = "ie=edge"),
    shiny::tags$title(title)
 
  )


  sidebar_and_title_tag <-
    shiny::tags$aside(
      class = "sidenav navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-3",
      id="sidenav-main",

      tags$div(class = "sidenav-header", #style = "height: 36px !important;",

               tags$a(class = "navbar-brand m-0", #style = "height: 36px !important; box-sizing: border-box;",

                      tags$span(class = "ms-1 font-weight-bold",
                                style = "font-size: 1.3em;",
                                icon,
                                title)
               )

      ),

      tags$hr(class="horizontal dark mt-0"),

      shiny::tags$div(class="collapse navbar-collapse w-auto h-auto max-height-vh-100 h-100",
                      id="sidenav-collapse-main",
                      sidebar,
                      
                      if(shinto_logo){
                        tags$div(
                          style = "position: fixed; bottom: 24px; left: 24px;",
                          tags$img(src = "shintologo/logoshintolabs96.png",
                                   width = "24px")
                        )  
                      } else NULL
                      
      )
    )


  dependency_tag <- tagList(
    shinyjs::useShinyjs(),
    
    shinytoastr::useToastr(),
    shintoshiny::shintoshiny_dependencies(),
    
    # Loading bar, loading screen
    shinybusy::add_busy_bar(color = busybar_color, height = "6px"),
    
    shintoshiny::disconnect_message(disconnect_message),
  )
  


  main_tag <- tags$main(
    class = "main-content position-relative max-height-vh-100 h-100 border-radius-lg ",
    header,
    dependency_tag,
    body
  )


  out_tag <- add_softui_dependencies(
      shiny::tags$body(class = "g-sidenav-show  bg-gray-100",
                       shintoshiny::loadingscreen(time = loadingscreen_time),
                       sidebar_and_title_tag,
                       main_tag)
  )
  

  tagList(
    head_tag,
    out_tag
  )

}


