
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
    ),

    # tags$link(href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css",
    #           rel="stylesheet",
    #           integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3",
    #           crossorigin="anonymous"),

    tags$script(src="https://code.jquery.com/jquery-3.5.1.slim.min.js",
                integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj",
                crossorigin="anonymous"),

    tags$link(href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css",
              rel="stylesheet",
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3",
              crossorigin="anonymous"),
    tags$script(src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js",
                integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p",
                crossorigin="anonymous"),





    # tags$script(src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.14.0-beta2/dist/js/bootstrap-select.min.js"),
    # tags$link(rel ="stylesheet",
    #           href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.14.0-beta2/dist/css/bootstrap-select.min.css")


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

      shiny::tags$div(class="collapse navbar-collapse w-auto h-auto max-height-vh-100 h-100",
                      id="sidenav-collapse-main",
                      sidebar
      )
    )




  main_tag <- tags$main(
    class = "main-content position-relative max-height-vh-100 h-100 border-radius-lg ",
    header,
    body
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


