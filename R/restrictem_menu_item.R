#' Menu item with restricted access
#' @rdname restricted_menu_item
#' @export
restricted_menu_item <- function(id){
  
  # this would not actually ever be called from a module, but still.
  ns <- NS(id)
  uiOutput(ns("menu"), container = shiny::tags$li, class = "nav-item")
  
}

#' @rdname restricted_menu_item
#' @export
restricted_menu_item_module <- function(input, output, session, 
                                        text, 
                                        tabName,
                                        icon,
                                        user_group,
                                        allowed_groups){
  
  output$menu <- renderUI({
    if(user_group %in% allowed_groups){
      softui::menu_item(text, tabName = tabName, icon = icon)  
    }  
  })
  
}


