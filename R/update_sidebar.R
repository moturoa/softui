#' Go to other 'page' (main menu item)
#' @details Replaces 'shinydashboard::updateTabItems', and works from within modules also.
#' @param selected The page to go to, corresponds to `tabName` in `menu_item` in the main UI
#' @export
go_to_page <- function(selected, session = shiny::getDefaultReactiveDomain()){
  session$sendCustomMessage("selectMenuItem", list(selected = selected))
}
