#' Write header information
#' @description Writes logout menu, app info menu, etc.
#' @param username Current username (for logout menu)
#' @export
populate_header <- function(username){
  
  callModule(softui::userLogoutModule, "user", username = username)
  
  callModule(shintoshiny::appInfoModule, "appinfo")
  
}

