#' The dashboard header
#' @param height Height of the image
#' @param image The reference to an image in the www folder that will be the header image
#' @param icon_color can be any bootstrap color (primary, secondary, success, danger, warning, info, light, dark, muted and white). Defaults to white.
#' @param \dots Any header items, usually made with `softui::dropdown_item`
#' @export
#' @rdname dashboard_header_image
dashboard_header_image <- function(..., height = 150, image = NULL, icon_color = "white"){
  shiny::tags$div(
    shiny::tags$nav(  # mt-4  mx-4 position-sticky 
      class = "navbar navbar-main navbar-expand-lg bg-transparent shadow-none postition-absolute px-4 w-100 z-index-2",
      
      id="navbarBlur", `data-scroll`="true",
      style = "height: 96px !important; position: absolute !important",
      
      shiny::tags$div(class = "container-fluid py-1",   #  px-3
               #style = "height: 96px !important;",
               
               
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
                     softui::dropdown_item_color(bsicon("gear-fill"), 
                                           header = "App Info",
                                           appInfoUI("appinfo"),
                                           align_right = TRUE,
                                           icon_color = icon_color
                     ),
                     softui::dropdown_item_color(bsicon("person-circle"), 
                                           header = "Gebruiker",
                                           softui::userLogoutUI("user"),
                                           align_right = TRUE,
                                           icon_color = icon_color
                     )
                     
                   )
                 )
                 
                 
                 
               )
               
               
      )
      
    ),
    
    shiny::tags$div(class = "container-fluid",
      shiny::tags$div(  # mt-4  mx-4 position-sticky 
        class = glue::glue("page-header min-height-{height} border-radius-xl mt-4"),
        style = glue::glue("background-image: url('{image}'); background-position-x: left;")
        
        
      )
    )
  )
  
}


#' UI to place in the header bar (to the right)
#' @export
#' @rdname dashboard_header_image
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
#' @rdname dashboard_header_image
#' @param icon_color can be any bootstrap color (primary, secondary, success, danger, warning, info, light, dark, muted and white). Defaults to white.
dropdown_item_color <- function(icon, ..., 
                          header = NULL,
                          align_right = FALSE,
                          icon_color = "white"){
  
  dclass <- ifelse(align_right, "dropdown-menu dropdown-menu-end", "dropdown-menu")
  
  # shiny::tags$li(
  #   class = "nav-item d-flex dropdown",
  
  shiny::tags$div(class = "dropdown",
           shiny::tags$a(
             class = glue::glue("nav-link text-{icon_color}"),
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




