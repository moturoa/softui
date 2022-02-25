
#' Dashboard sidebar
#' @export
#' @rdname sidebar
dashboard_sidebar <- function(arg){
  arg
}


#' Sidebar menu
#' @param \dots `menu_item`'s
#' @param id Id for the sidebar, currently unused
#' @param .list Further `menu_item`'s can be passed as a list instead of in \dots.
#' @export
#' @rdname sidebar
sidebar_menu <- function(..., id = NULL, .list = NULL){

  items <- c(list(...), .list)
  if(is.null(id)){
    id <- paste0("tabs_", round(stats::runif(1, min = 0, max = 1e+09)))
  }

  # First menu item is always selected
  items[[1]]$children[[1]] <- htmltools::tagAppendAttributes(items[[1]]$children[[1]], 
                                                             class = "show active")

  shiny::tags$ul(
     class = "navbar-nav sidebar-menu nav navtabs",
     role = "tablist",
     items,
     
     # --> this is here for a menuOutput implementation, which we haven't implemented yet
     shiny::tags$div(id = id, class = "sidebarMenuSelectedTabItem",
                     `data-value` = "null")
  )

}

#' Sidebar menu item
#' @export
#' @rdname sidebar
menu_item <- function(text, ..., icon = bsicon("bar-chart-fill"),
                      tabName = NULL){

   stopifnot(!is.null(tabName))

   tags$li(
     class = "nav-item",
  
     menu_link(tabName, icon, text, ...)
   )

}


#' @export
#' @rdname sidebar
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



