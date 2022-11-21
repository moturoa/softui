
#' Set a root: CSS variable for softui
#' @export
set_css_variable <- function(variable, value, session = shiny::getDefaultReactiveDomain()){
  
  session$sendCustomMessage("setCSSVariable", 
                            list(variable = as.character(variable),
                                 value = as.character(value)
                                 ))
  
}



