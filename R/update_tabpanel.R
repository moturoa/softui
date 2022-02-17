#' Update tab_box
#' @description Simulates a click on a tab inside a `softui::tab_box` (replaces updateTabsetpanel)
#' @param id id of the tab_box (required)
#' @param selected Which tab to select (using 'value' of the `tab_panel`)
#' @param session Not required
#' @export
update_tabpanel <- function(id, selected, session = shiny::getDefaultReactiveDomain()){
  session$sendCustomMessage("selectTabItem", list(id = id, selected = selected))
}

