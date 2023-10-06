#' Shiny module for logout menu
#' @param id Input id
#' @param username Use e.g. `get_user()` to get the current user.
#' @param input Shiny input object
#' @param output Shiny output object
#' @param session Shiny session object
#' @rdname userLogoutModule
#' @export
userLogoutUI <- function(id){
  
  ns <- shiny::NS(id)
  shiny::uiOutput(ns("user_content"))
                        
  
}

#' @rdname userLogoutModule
#' @export
userLogoutModule <- function(input, output, session, username = "unknown"){
  
  # --> expand
  output$user_content <- shiny::renderUI({
    
    shiny::tags$div(
      shiny::tags$p(glue::glue("Ingelogd als '{username}'")),
      shiny::tags$hr(),
      
      action_button(session$ns("btn_logout"), 
                            "Uitloggen", 
                            icon = bsicon("box-arrow-right"),
                            status = "warning",
                            onclick = "document.location.href = document.location.href + '__logout__';")
    )
    
    
  })
  

}
