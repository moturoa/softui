#' Update tabItem (menu)
#' @export
update_tab_item <- function(selected, session = shiny::getDefaultReactiveDomain()){
  session$sendCustomMessage("selectMenuItem", list(selected = selected))
}
