#' Get user in this session
#' @param default If no username stored in session object, use this name (local dev)
#' @param session The session object (don't have to set this)
#' @return Authenticated userid, character.
#' @export
get_user <- function(default = "demo", session = shiny::getDefaultReactiveDomain()){
  
  if(is.null(session$user)){
    default
  } else {
    session$user
  }

}
