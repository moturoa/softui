#' Reactable click handler
#' @param id id that is used to catch click event 
#' @export
#' @importFrom htmlwidgets
reactafel_click_handler <- function(id = NULL, what = "data", session = NULL){
  
  what <- match.arg(what)
  
  id <- session$ns(id)
  fun_ <- glue::glue("function(rowInfo, column) {
              let values = rowInfo.values;
              let ranval = Math.random();
              let vallis = Object.assign(values,ranval);
              Shiny.setInputValue('<<<id>>>', vallis, { priority: 'event' })
              }", .open = "<<<", .close = ">>>")
  htmlwidgets::JS(fun_)
}

