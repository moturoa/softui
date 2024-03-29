#' The dashboard header
#' @param tag_line A short statement to appear in the header (italic text)
#' @param left_content UI to place on the left (just right of the tagline). Untested.
#' @param \dots Any header items, usually made with `softui::dropdown_item`. 
#' @param info Passed to appInfoUI()
#' @export
#' @rdname dashboard_header
dashboard_header <- function(..., tag_line = NULL, left_content = NULL, info = NULL){

  tag_line <- shiny::tags$h6(class = "header_tagline fw-light", tag_line)
  
  shiny::tags$nav(  # mt-4  mx-4 position-sticky 
    class = "navbar navbar-main navbar-expand-lg top-1 px-0 shadow-none border-radius-xl z-index-sticky",
    id="navbarBlur", `data-scroll`="true",
    style = "height: 96px !important;",

    shiny::tags$div(class = "container-fluid",   # py-1 px-3
             style = "height: 96px !important;",


            # toggler (minimize sidebar menu).
             shiny::tags$div(
               class = "sidenav-toggler sidenav-toggler-inner d-xl-block d-none ",

               shiny::tags$a(href="javascript:;", class="nav-link text-body p-0",
                      shiny::tags$div(
                        class="sidenav-toggler-inner",
                        shiny::tags$i(class="sidenav-toggler-line"),
                        shiny::tags$i(class="sidenav-toggler-line"),
                        shiny::tags$i(class="sidenav-toggler-line")
                      )
               )
             ),
             
             shiny::tags$nav(
               c(list(tag_line), left_content)
             ),
             
             shiny::tags$div(
               class = "collapse navbar-collapse mt-sm-0 mt-2 me-md-0 me-sm-4",
               id="navbar-right",

               shiny::tags$div(
                 class="ms-md-auto pe-md-3 d-flex align-items-center",
                 
                 # 
                 # content on the right (usually dropdowns)
                 shiny::tags$ul(
                   class = "navbar-nav justify-content-end",
                   ...,
                   
                   
                   
                   # Two standard dropdowns for Shinto apps
                   softui::dropdown_item(bsicon("gear-fill"), 
                                         header = "App Info",
                                         appInfoUI("appinfo", info = info),
                                         align_right = TRUE
                   ),
                   
                   
                   htmltools::tagAppendAttributes(
                     softui::dropdown_item(bsicon("person-circle"), 
                                           header = "Gebruiker",
                                           softui::userLogoutUI("user"),
                                           align_right = TRUE
                    ),
                    id = "softui_dropdown_current_user")
                    
                   
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

  shiny::tags$li(
    class = "nav-item d-flex align-items-center",
    #bsicon("person-circle"),

    shiny::tags$a(
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
  
  # shiny::tags$li(
  #   class = "nav-item d-flex dropdown",

  shiny::tags$div(class = "dropdown",
    shiny::tags$a(
      class = "nav-link",
      icon,
      `data-bs-toggle` = "dropdown", href = "#",
      `aria-expanded` = "false"
    ),
    shiny::tags$div(class = dclass,
      if(!is.null(header)){
        shiny::tags$h6(header, class = "dropdown-header")
      } else NULL,
      shiny::tags$div(
        class = "dropdown-item", ...
      )
    )
  )

}




