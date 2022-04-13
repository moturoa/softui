#' Alert boxes
#' @details Does not replace `shiny_toastr`'s, this function just makes colored boxes with an important message
#' or warning. Can be used as a box with `softui::box`. This box has no title, only text. 
#' Do not use for large amount of text, typically a one-liner with an statement that has to be read by the user.
#' Text color is bold and white by default (and cannot be changed).
#' @param text Text for the box (bold, white)
#' @param status Status color (see `?valid_statuses`)
#' @export
alert_box <- function(text, status = "warning"){
  
  validate_status(status)
  
  shiny::tags$div(class= glue::glue("alert alert-{status} alert-dismissible fade show text-white font-weight-bold"), 
                  role = "alert",
           text

  )
           
  
} 
