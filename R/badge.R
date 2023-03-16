#' SoftUI badges
#' @description Short label (badge) to be placed before or above text, for example `badge("Informatie", status = "info")`
#' Font is always uppercase. 
#' @param text Text for the badge (only short text field is recommended!)
#' @param status Status color (see `?valid_statuses`)
#' @export
badge <- function(text, status = "info"){
  
  validate_status(status)
  
  shiny::tags$span(
    style = "text-decoration: none !important;",
    class = glue::glue("badge badge-{status}"),
    text
  )
  
}
