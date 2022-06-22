#' Menu item with restricted access
#' @param id Shiny input id
#' @param input Shiny input object
#' @param output Shiny output object
#' @param session Shiny session object
#' @param text Text for the `menu_item`
#' @param tabName Name for the tab to refer to from the `menuitem`
#' @param icon A `softui::bsicon`
#' @param user_group Current groups the user belongs to (read with `shintousers`)
#' @param allowed_groups Groups that have access to this menu item. Usually read from config.
#' @rdname restricted_menu_item
#' @export
restricted_menu_item <- function(id){
  
  # this would not actually ever be called from a module, but still.
  ns <- shiny::NS(id)
  shiny::uiOutput(ns("menu"), container = shiny::tags$li, class = "nav-item")
  
}

#' @rdname restricted_menu_item
#' @export
restricted_menu_item_module <- function(input, output, session, 
                                        text, 
                                        tabName,
                                        icon,
                                        user_group,
                                        allowed_groups){
  
  validate_tab_name(tabName)
  
  output$menu <- shiny::renderUI({
    if(user_group %in% allowed_groups){
      softui::menu_item(text, tabName = tabName, icon = icon)  
    }  
  })
  
}


