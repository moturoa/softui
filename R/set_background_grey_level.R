#' Set body background grey level for higher contrast
#' @param level 100, 200, 300, etc.
#' @export
set_background_grey_level <- function(level, session = shiny::getDefaultReactiveDomain()){
  
  if(!level %in% seq(100,900,by=100)){
    stop("Level must be between 100, 900, in steps of 100")
  }
  
  session$sendCustomMessage("setBodyGreyLevel", list(level = as.character(level)))
  
}


