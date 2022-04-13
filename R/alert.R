#' Alert boxes
#' @details Does not replace `shiny_toastr`'s, just for making closable boxes with an important message
#' or warning. Can be used as a box with `softui::box`. This box has no title, only text.
#' @param text Text for the box (bold, white)
#' @param status Status color (see `?valid_statuses`)
#' @export
alert_box <- function(text, status = NULL){
  
  validate_status(status)
  
  shiny::tags$div(class= glue::glue("alert alert-{status} alert-dismissible fade show text-white font-weight-bold"), 
                  role = "alert",
           text

  )
           
  
} 
