#' The dashboard header
#' @param tag_line A short statement to appear in the header (italic text)
#' @param left_content UI to place on the left (just right of the tagline). Untested.
#' @param \dots Any header items, usually made with `softui::dropdown_item`
#' @export
#' @rdname dashboard_header
dashboard_header <- function(..., tag_line = NULL, left_content = NULL){

  tag_line <- tags$h6(class = "header_tagline fw-light", tag_line)
  
  tags$nav(  # mt-4  mx-4 position-sticky 
    class = "navbar navbar-main navbar-expand-lg top-1 px-0 shadow-none border-radius-xl z-index-sticky",
    id="navbarBlur", `data-scroll`="true",
    style = "height: 96px !important;",

    tags$div(class = "container-fluid",   # py-1 px-3
             style = "height: 96px !important;",


             # tags$div(
             #   class = "sidenav-toggler sidenav-toggler-inner d-xl-block d-none ",
             # 
             #   tags$a(href="javascript:;", class="nav-link text-body p-0",
             #          tags$div(
             #            class="sidenav-toggler-inner",
             #            tags$i(class="sidenav-toggler-line"),
             #            tags$i(class="sidenav-toggler-line"),
             #            tags$i(class="sidenav-toggler-line")
             #          )
             #   )
             # ),
             
             tags$nav(
               c(list(tag_line), left_content)
             ),
             
             tags$div(
               class = "collapse navbar-collapse mt-sm-0 mt-2 me-md-0 me-sm-4",
               id="navbar-right",

               tags$div(
                 class="ms-md-auto pe-md-3 d-flex align-items-center",
                 
                 # 
                 # content on the right (usually dropdowns)
                 tags$ul(
                   class = "navbar-nav justify-content-end",
                   ...,
                   
                   
                   
                   # Two standard dropdowns for Shinto apps
                   softui::dropdown_item(bsicon("gear-fill"), 
                                         header = "App Info",
                                         shintoshiny::appInfoUI("appinfo"),
                                         align_right = TRUE
                   ),
                   softui::dropdown_item(bsicon("person-circle"), 
                                         header = "Gebruiker",
                                         softui::userLogoutUI("user"),
                                         align_right = TRUE
                   )
                   
                 )
               )



             )


    )

  )
}


#' UI to place in the header bar (to the right)
#' @export
#' @rdname dashboard_header
header_item <- function(...){

  tags$li(
    class = "nav-item d-flex align-items-center",
    #bsicon("person-circle"),

    tags$a(
      class = "nav-link",
      ...
    )

  )

}


#' Dropdown item in the header bar
#' @export
#' @rdname dashboard_header
dropdown_item <- function(icon, ..., 
                          header = NULL,
                          align_right = FALSE){

  dclass <- ifelse(align_right, "dropdown-menu dropdown-menu-end", "dropdown-menu")
  
  # tags$li(
  #   class = "nav-item d-flex dropdown",

  tags$div(class = "dropdown",
    tags$a(
      class = "nav-link",
      icon,
      `data-bs-toggle` = "dropdown", href = "#",
      `aria-expanded` = "false"
    ),
    tags$div(class = dclass,
      if(!is.null(header)){
        tags$h6(header, class = "dropdown-header")
      } else NULL,
      tags$div(
        class = "dropdown-item", ...
      )
    )
  )

}




