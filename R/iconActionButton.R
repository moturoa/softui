#' Icon only button
#' @export
iconActionButton <- function(id, icon, status = "success"){
  
  cl <- glue::glue("btn-icon-only btn-rounded btn-outline-{status} mb-0 me-2 btn-sm d-flex align-items-center justify-content-center")
  
  shiny::actionButton(id, icon, class =cl)
  
}
