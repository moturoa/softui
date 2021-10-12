
#' Soft UI dashboard page
#' @export
dashboard_page <- function(header, sidebar, body, title = "", icon = bsicon("speedometer")){


  head_tag <- shiny::tags$head(
    shiny::tags$meta(charset = "utf-8"),
    shiny::tags$meta(
      name = "viewport",
      content = "width=device-width, initial-scale=1, shrink-to-fit=no"
    ),
    shiny::tags$meta(`http-equiv` = "x-ua-compatible", content = "ie=edge"),
    shiny::tags$title(title),

    tags$link(href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700",
              rel="stylesheet"),

    tags$link(rel="stylesheet",
              href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
    )

  )


  sidebar_and_title_tag <-
    shiny::tags$aside(
      class = "sidenav navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-3",
      id="sidenav-main",

      tags$div(class = "sidenav-header",

               tags$a(class = "navbar-brand m-0",

                      tags$span(class = "ms-1 font-weight-bold",
                                style = "font-size: 1.1em;",
                                icon,
                                title)
               )

      ),

      tags$hr(class="horizontal dark mt-0"),

      sidebar_menu(
        menu_item("Analyse", tabName = "analyse", icon = bsicon("bar-chart-fill")),
        menu_item("Administratie", tabName = "administratie", icon = bsicon("tools"))
      )
    )


  header <- dashboard_header(
    tags$div(
      class="ms-md-auto pe-md-3 d-flex align-items-center",
      textInput("search", "", placeholder = "Zoek")
    ),

    # icoontjes rechts
    tags$ul(
      class = "navbar-nav justify-content-end",

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
  )

  main_tag <- tags$main(
    class = "main-content position-relative max-height-vh-100 h-100 border-radius-lg ",
    header,
    tab_items()
  )


  out_tag <- shiny::tags$body(class = "g-sidenav-show  bg-gray-100",
                              sidebar_and_title_tag,
                              main_tag) %>%
    add_softui_dependencies()


  tagList(
    head_tag,
    out_tag
  )

}


