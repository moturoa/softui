#' Write header information
#' @description Writes logout menu, app info menu, etc. Call once at the top of the main server function.
#' @param username Current username (for logout menu)
#' @export
#' @importFrom shintoshiny appInfoModule
populate_header <- function(username){
  
  callModule(softui::userLogoutModule, "user", username = username)
  
  callModule(shintoshiny::appInfoModule, "appinfo")
  
}

