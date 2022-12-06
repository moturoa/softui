
#' @export
#' @rdname sidebar
dashboard_sidebar <- function(menu, ui_above = NULL, ui_below = NULL){
  
  # should really do some validating here. maybe.
  tagList(
    ui_above,
    menu,
    ui_below
  )
}


#' Sidebar menu
#' @details Use in a `dashboard_page` (see Example there). Accepts only `menu_item` and `menu_subitem`
#' @param \dots `menu_item`'s
#' @param id Id for the sidebar, currently unused
#' @param .list Further `menu_item`'s can be passed as a list instead of in \dots.
#' @export
#' @rdname sidebar
sidebar_menu <- function(..., id = NULL, .list = NULL){

  items <- dropNulls(c(list(...), .list))
  if(is.null(id)){
    id <- paste0("tabs_", round(stats::runif(1, min = 0, max = 1e+09)))
  }
  
  # First menu item is always selected
  if(length(items) == 1){
    items[[1]]$children[[2]][[1]] <- htmltools::tagAppendAttributes(items[[1]]$children[[2]][[1]], 
                                                                       class = "show active")
  } else {
    items[[1]]$children[[1]] <- htmltools::tagAppendAttributes(items[[1]]$children[[1]], 
                                                               class = "show active")  
  }
  
  

  shiny::tags$ul(
     class = "navbar-nav sidebar-menu nav navtabs",
     role = "tablist",
     items
     
     # --> this is here for a menuOutput implementation, which we haven't implemented yet
     # Need to include to know which menu is active (via input$...). 
     # shiny::tags$div(id = id, class = "sidebarMenuSelectedTabItem",
     #                 `data-value` = "null")
  )

}


