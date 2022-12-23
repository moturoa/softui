#' Simple page without sidebar or header
#' @description Make a simple page with the correct background color, and all of `softui`'s dependencies.
#' Useful for testing or simple applications without a sidebar menu.
#' @export
#' @importFrom shinyjs inlineCSS
simple_page <- function(..., padding = "40px"){

  add_softui_dependencies(
    shiny::tags$body(class = "bg-gray-100",
                     style = htmltools::css(padding  = padding),
                     softui_dependencies(),
                     package_ui_dependencies(busybar_color = "#346E6E", 
                                             disconnect_message = "De sessie is verlopen of er ging iets fout!"),
                     ...)
  )
  
  
}

