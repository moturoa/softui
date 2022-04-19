
#' Sidebar menu items
#' @description Functions to make menu items in the sidebar menu. See `?sidebar_menu`
#' @export
#' @rdname menu_item
menu_item <- function(text, ..., icon = bsicon("bar-chart-fill"),
                      tabName = NULL){
  
  validate_tab_name(tabName)
  subitems <- list(...)
  
  if(length(subitems) == 0){
    
    stopifnot(!is.null(tabName))
    return(
      shiny::tags$li(
        class = "nav-item",
        
        menu_link(tabName, icon, text)
      )
    )  
    
  }
  
  shiny::tags$li(
    class = "nav-item",
    menu_link_with_subitems(..., icon = icon, text = text, tabName = NULL)
  )
  
}

#' @export
#' @rdname menu_item
menu_subitem <- function(text, tabName){
  
  validate_tab_name(tabName)
  tabref <- glue::glue("#shiny-tab-{tabName}")
  
  shiny::tags$li(class="nav-item ", 
          shiny::tags$a(class="nav-link ", 
                 href = tabref,
                 `data-bs-toggle` = "tab",
                 `data-bs-target` = tabref,
                 `data-target` = tabName,
                 role = "tab",
                 shiny::tags$span(class="sidenav-mini-icon", substr(text,1,1)),
                 shiny::tags$span(class="sidenav-normal", text)
          )
  )
  
}

#--- Internal functions
menu_link_with_subitems <- function(..., icon, text, tabName = NULL){
  
  validate_tab_name(tabName)
  
  if(!is.null(tabName))message("tabName not used in menu_link_with_subitems, only menu_subitem's have tabName's")
  
  collapse_id <- random_id()
  self_id <- random_id()
  
  htmltools::tagList(
    shiny::tags$a(class = "nav-link", id = self_id,
         
         href = paste0("#", collapse_id),
         `data-bs-toggle` = "collapse",
         role = "button",
         
         shiny::tags$div(
           class = "icon icon-sm shadow border-radius-md bg-white text-center me-2 d-flex align-items-center justify-content-center",
           shiny::tags$span(icon, class = "sidebar-icon")
         ),
         shiny::tags$span(class = "nav-link-text ms-1",  text)
    ),
    
    shiny::tags$div(
      class = "collapse", 
      id = collapse_id,
      
      shiny::tags$ul(
        class="nav ms-4 ps-3",
        
          ...
    
      )
    )
    
  )
  
}










#' @export
#' @rdname menu_item
menu_link <- function(tabName, icon, text){
  
  tabref <- glue::glue("#shiny-tab-{tabName}")
  self_id <- random_id()
  
  shiny::tags$a(class = "nav-link",
         id = self_id,
         href = tabref,
         `data-bs-toggle` = "tab",
         `data-bs-target` = tabref,
         `data-target` = tabName,
         role = "tab",
         
         shiny::tags$div(
           class = "icon icon-sm shadow border-radius-md bg-white text-center me-2 d-flex align-items-center justify-content-center",
           shiny::tags$span(icon, class = "sidebar-icon")
         ),
         shiny::tags$span(class = "nav-link-text ms-1",  text)
  )
  
}

