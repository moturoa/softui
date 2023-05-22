#' Collapse and uncollapse a box
#' @param id The id of the [box()]
#' @export
#' @rdname collapse_box
collapse_box <- function(id, session = shiny::getDefaultReactiveDomain()){

  session$sendCustomMessage("collapseBox", list(id = id))
    
}


#' @export
#' @rdname collapse_box
toggle_box <- function(id, session = shiny::getDefaultReactiveDomain()){
  
  session$sendCustomMessage("toggleBox", list(id = id))
  
}


#' @export
#' @rdname collapse_box
expand_box <- function(id, session = shiny::getDefaultReactiveDomain()){
  
  session$sendCustomMessage("expandBox", list(id = id))
  
}
