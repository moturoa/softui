#' Simple alternative to renderMenuOutput
#' @rdname menu_output
#' @export
menu_output <- function(id){

  uiOutput(id, container = shiny::tags$li, class = "nav-item")  
  
}

