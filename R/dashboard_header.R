

dashboard_header <- function(){

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

  )
}


