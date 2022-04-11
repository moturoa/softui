#' SoftUI badges
#' @export
badge <- function(text, status = c("primary","secondary","info","success","danger","warning","light","dark")){
  
  status <- match.arg(status)
  
  tags$span(
    class = glue::glue("badge badge-{status}"),
    text
  )
  
}
