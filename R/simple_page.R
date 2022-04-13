#' Simple page without sidebar or header
#' @description Make a simple page with the correct background color, and all of `softui`'s dependencies.
#' Useful for testing or simple applications
#' @export
#' @importFrom shinyjs inlineCSS
simple_page <- function(...){

  
  fluid_page(
    style = "padding-top: 36px !important;",
    shinyjs::inlineCSS("body{background-color: #F8F9FA;}"),
    softui_dependencies(),
    ...
  )  
  
}

