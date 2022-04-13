#' Icon only button
#' @description A 'softui' round button with only an icon. Simple wrapper around `shiny::actionButton`. 
#' Uses various softui CSS classes for styling.
#' @param id The shiny input id
#' @param icon A `softui::bsicon` or `shiny::icon`.
#' @param status The status color (see `?valid_statuses`).
#' @param \dots Additional arguments to `shiny::actionButton`
#' @export
#' @examples
#' 
#' ui <- softui::simple_page(
#'   
#'   softui::box(width = 4,
#'               title = "iconActionButton",
#'               
#'               iconActionButton("id2", icon = bsicon("exclamation-circle-fill"), 
#'                                status = "primary"),
#'               shiny::tags$br(),
#'               iconActionButton("id1", icon = bsicon("award-fill"), status = "success"),
#'               shiny::tags$br(),
#'               iconActionButton("id2", icon = bsicon("stop-circle-fill"), 
#'                                status = "danger", class = "btn-lg")
#'   )
#'   
#'   
#' )
#' shinyApp(ui,server = function(input,output){})
iconActionButton <- function(id, icon, status = "success", class = "", ...){
  
  
  validate_status(status)
  
  cl <- glue::glue("btn-icon-only btn-rounded btn-outline-{status} mb-0 me-2 d-flex align-items-center justify-content-center")
  cl <- paste(class, cl)
  shiny::actionButton(id, icon, class =cl)
  
}
