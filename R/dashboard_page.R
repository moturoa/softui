
#' Soft UI dashboard page
#' @export
dashboard_page <- function(title = ""){


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

   #includeScript("inst/assets/js/soft-ui-dashboard.js")

  )


  sidebar_tag <- #--> sidebar
    shiny::tags$aside(
      class = "sidenav navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-3",
      id="sidenav-main",

      tags$div(class = "sidenav-header",

               tags$a(class = "navbar-brand m-0",

                      tags$span(class = "ms-1 font-weight-bold",
                                style = "font-size: 1.1em;",
                                bsicon("house"),
                                title)

               )

      ),

      tags$hr(class="horizontal dark mt-0"),

      tags$div(class="collapse navbar-collapse  w-auto h-auto max-height-vh-100 h-100",
               id="sidenav-collapse-main",

               tags$ul(
                 class = "navbar-nav sidebar-menu nav navtabs",
                 role = "tablist",

                 tags$li(
                   class = "nav-item",

                   tags$a(class = "nav-link active",
                          href = "#shiny-tab-analyse",   #  #shiny-tab-<<tabName>>
                          `data-bs-toggle` = "tab",
                          `data-bs-target` = "#shiny-tab-analyse",
                          `data-target` = "analyse",
                          role = "tab",

                          tags$div(
                            class = "icon icon-sm shadow border-radius-md bg-white text-center me-2 d-flex align-items-center justify-content-center",
                            tags$span(bsicon("bar-chart-fill"), class = "sidebar-icon")
                          ),
                          tags$span(class = "nav-link-text ms-1",  "Analyse")
                   )
                 ),
                 tags$li(
                   class = "nav-item",

                   tags$a(class = "nav-link",
                          href = "#shiny-tab-administratie",   #  #shiny-tab-<<tabName>>
                          `data-bs-toggle` = "tab",
                          `data-bs-target` = "#shiny-tab-administratie",
                          role = "tab",

                     tags$div(
                       class = "icon icon-sm shadow border-radius-md bg-white text-center me-2 d-flex align-items-center justify-content-center",
                       tags$span(bsicon("tools"), class = "sidebar-icon")
                     ),
                     tags$span(class = "nav-link-text ms-1",  "Administratie")
                   )
                 )



               )

      )

    )

    dashboard_header_tag <- tags$main(
      class = "main-content position-relative max-height-vh-100 h-100 border-radius-lg ",


      tags$nav(
        class = "navbar navbar-main navbar-expand-lg position-sticky mt-4 top-1 px-0 mx-4 shadow-none border-radius-xl z-index-sticky",
        id="navbarBlur", `data-scroll`="true",

        tags$div(class = "container-fluid",   # py-1 px-3

              tags$div(
                class = "sidenav-toggler sidenav-toggler-inner d-xl-block d-none ",

                  tags$a(href="javascript:;", class="nav-link text-body p-0",
                    tags$div(
                      class="sidenav-toggler-inner",
                      tags$i(class="sidenav-toggler-line"),
                      tags$i(class="sidenav-toggler-line"),
                      tags$i(class="sidenav-toggler-line")
                    )
                  )
              ),

              tags$div(
                class = "collapse navbar-collapse mt-sm-0 mt-2 me-md-0 me-sm-4",
                id="navbar",

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


        )

      ),

      fluid_page(

              tags$div(class = "tab-content",

                tags$div(class = "tab-pane fade show active",
                         id = "shiny-tab-analyse",

                         tags$div(class = "row",
                            tags$div(class="col-lg-7 position-relative z-index-2",

                                  value_box("1251","Documenten","+18",
                                            icon = bsicon("file-earmark-bar-graph")),
                                  value_box("820","Personen","+4",
                                            icon = bsicon("person-plus-fill")),

                                  tags$h2("Analyse"),
                                  tags$p("Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sit amet tortor ut libero finibus dictum bibendum ut lorem. Ut nisi arcu, feugiat vitae tortor at, iaculis venenatis metus. Morbi dui elit, aliquam at sem molestie, dignissim malesuada dui. Vivamus cursus a dolor et laoreet. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pharetra lectus ac ex hendrerit, in cursus nulla eleifend. Pellentesque ut velit fringilla, pulvinar nisl non, mollis purus. Etiam blandit augue quis augue congue fringilla. Pellentesque rutrum, tellus a venenatis porta, nisl augue tincidunt nisl, at tempor elit nisl ac massa. Praesent finibus, nibh vehicula euismod malesuada, diam nunc pellentesque ipsum, ac tempus tellus mauris sit amet ligula. Nullam euismod eget velit ac consequat. Integer finibus blandit diam, nec sollicitudin neque viverra eu.")
                           )
                         )


                ),
                tags$div(class = "tab-pane",
                         id = "shiny-tab-administratie",
                         tags$h2("Administratie"),
                         tags$p("Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sit amet tortor ut libero finibus dictum bibendum ut lorem. Ut nisi arcu, feugiat vitae tortor at, iaculis venenatis metus. Morbi dui elit, aliquam at sem molestie, dignissim malesuada dui. Vivamus cursus a dolor et laoreet. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pharetra lectus ac ex hendrerit, in cursus nulla eleifend. Pellentesque ut velit fringilla, pulvinar nisl non, mollis purus. Etiam blandit augue quis augue congue fringilla. Pellentesque rutrum, tellus a venenatis porta, nisl augue tincidunt nisl, at tempor elit nisl ac massa. Praesent finibus, nibh vehicula euismod malesuada, diam nunc pellentesque ipsum, ac tempus tellus mauris sit amet ligula. Nullam euismod eget velit ac consequat. Integer finibus blandit diam, nec sollicitudin neque viverra eu.")
                )


              )





      )
    )



    body_tag <- shiny::tags$body(
      class = "g-sidenav-show  bg-gray-100",

      sidebar_tag,
      dashboard_header_tag
    )

    body_tag <- add_softui_dependencies(body_tag)


    tagList(
      head_tag,
      body_tag
    )





}


