#' Simple wrapper around actionButton with softui CSS classes
#' @param \dots Arguments sent to `shiny::actionButton`
#' @param class Extra CSS classes
#' @param status Status color (see `?valid_statuses`)
#' @importFrom shinyjs disabled
#' @export
action_button <- function(..., 
                          class = "",
                          status = NULL,
                          disabled = FALSE){
  
  if(!is.null(status)){
    validate_status(status)
    class <- paste(class, paste0("bg-gradient-",status))
  }
  
  
  btn <- shiny::actionButton(..., class = class)
  
  if(disabled){
    btn <- shinyjs::disabled(btn)
  }
  
  btn
}
