#' Update tabPanel (menu)
#' @export
update_tabpanel <- function(id, selected, session = shiny::getDefaultReactiveDomain()){
  session$sendCustomMessage("selectTabItem", list(id = id, selected = selected))
}

