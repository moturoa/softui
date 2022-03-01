
#' Sidebar menu item
#' @export
#' @rdname menu_item
menu_item <- function(text, ..., icon = bsicon("bar-chart-fill"),
                      tabName = NULL){
  
  stopifnot(!is.null(tabName))
  
  subitems <- list(...)
  
  if(length(subitems) == 0){
    
    return(
      tags$li(
        class = "nav-item",
        
        menu_link(tabName, icon, text)
      )
    )  
    
  }
  
  
  
  
}


#' @export
#' @rdname menu_item
menu_link <- function(tabName, icon, text){
  
  tabref <- glue::glue("#shiny-tab-{tabName}")
  
  tags$a(class = "nav-link",
         href = tabref,
         `data-bs-toggle` = "tab",
         `data-bs-target` = tabref,
         `data-target` = tabName,
         role = "tab",
         
         tags$div(
           class = "icon icon-sm shadow border-radius-md bg-white text-center me-2 d-flex align-items-center justify-content-center",
           tags$span(icon, class = "sidebar-icon")
         ),
         tags$span(class = "nav-link-text ms-1",  text)
  )
  
}

