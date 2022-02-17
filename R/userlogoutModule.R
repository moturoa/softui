#' Shiny module for logout menu
#' @param id Input id
#' @param username Use \code{\link{get_user}} to get the current user.
#' @rdname userLogoutModule
#' @export
userLogoutUI <- function(id){
  
  ns <- NS(id)
  uiOutput(ns("user_content"))
                        
  
}

#' @rdname userLogoutModule
#' @export
userLogoutModule <- function(input, output, session, username = "unknown"){
  
  # --> expand
  output$user_content <- renderUI({
    
    tags$p(glue::glue("Ingelogd als {username}"))
    
  })
  

}
