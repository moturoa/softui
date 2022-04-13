
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
      tags$li(
        class = "nav-item",
        
        menu_link(tabName, icon, text)
      )
    )  
    
  }
  
  tags$li(
    class = "nav-item",
    menu_link_with_subitems(..., icon = icon, text = text, tabName = NULL)
  )
  
}

#' @export
#' @rdname menu_item
menu_subitem <- function(text, tabName){
  
  validate_tab_name(tabName)
  tabref <- glue::glue("#shiny-tab-{tabName}")
  
  tags$li(class="nav-item ", 
          tags$a(class="nav-link ", 
                 href = tabref,
                 `data-bs-toggle` = "tab",
                 `data-bs-target` = tabref,
                 `data-target` = tabName,
                 role = "tab",
                 tags$span(class="sidenav-mini-icon", substr(text,1,1)),
                 tags$span(class="sidenav-normal", text)
          )
  )
  
}

#--- Internal functions
menu_link_with_subitems <- function(..., icon, text, tabName = NULL){
  
  validate_tab_name(tabName)
  
  if(!is.null(tabName))message("tabName not used in menu_link_with_subitems, only menu_subitem's have tabName's")
  
  collapse_id <- random_id()
  self_id <- random_id()
  
  tagList(
    tags$a(class = "nav-link", id = self_id,
         
         href = paste0("#", collapse_id),
         `data-bs-toggle` = "collapse",
         role = "button",
         
         tags$div(
           class = "icon icon-sm shadow border-radius-md bg-white text-center me-2 d-flex align-items-center justify-content-center",
           tags$span(icon, class = "sidebar-icon")
         ),
         tags$span(class = "nav-link-text ms-1",  text)
    ),
    
    tags$div(
      class = "collapse", 
      id = collapse_id,
      
      tags$ul(
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
  
  tags$a(class = "nav-link",
         id = self_id,
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

