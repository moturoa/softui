#' Collapse and uncollapse a box
#' @param id The id of the [box()]
#' @export
collapse_box <- function(id, session = shiny::getDefaultReactiveDomain()){

  session$sendCustomMessage("collapseBox", list(id = id))
    
}
