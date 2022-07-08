
#' Progress bar
#' @param value Value of the bar
#' @param min Minimum value (default 0)
#' @param max Maximum value (default 100)
#' @param status Status color, see [valid_statuses()]
#' @param \dots Further arguments to the containing div, for example `style = "padding:30px;`
#' @export
#' @examples
#' library(shiny)
#' library(softui)
#' 
#' ui <- softui::simple_page(
#'   softui::box(width = 5,
#'               title = "Progress bars",
#'               progressbar(20, status = "success", style = "margin-bottom: 30px;"),
#'               progressbar(32, status = "info", style = "margin-bottom: 30px;"),
#'               progressbar(49, status = "warning", style = "margin-bottom: 30px;"),
#'               progressbar(60, status = "danger", style = "margin-bottom: 30px;")
#'   )
#' )
#' 
#' server <- function(input, output, session) {
#'   
#' }
#' if(interactive()){
#'   shinyApp(ui, server)  
#' }
progressbar <- function(value, min = 0, max = 100, 
                        status = "info", ...){
  
  validate_status(status)
  
  val <- floor(100 * (value - min)/(max - min))
  
  #height <- shiny::validateCssUnit(height)
  
  shiny::tags$div(class = "progress progress-md", style = "width: 100%;",
                  ...,
    shiny::tags$div(class = glue::glue("progress-bar bg-gradient-{status}"),
                    style = glue::glue("width: {val}%;"),
             role = "progressbar",
             `aria-valuenow` = as.character(val),
             `aria-valuemin` = as.character(min),
             `aria-valuemax` = as.character(max)
      )
    
  )
  
  
} 





