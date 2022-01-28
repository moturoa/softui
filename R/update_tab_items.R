#' Update tabItem (menu)
#' @export
update_sidebar <- function(selected, session = shiny::getDefaultReactiveDomain()){
  session$sendCustomMessage("selectMenuItem", list(selected = selected))
}
