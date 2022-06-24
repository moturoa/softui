
#' Disable/enable menu item links
#' @export
#' @rdname disable_link
disable_link <- function(name){
  shinyjs::addCssClass(selector = glue("a[data-target='{name}']"), 
              class = "inactivelink")
}

#' @export
#' @rdname disable_link
enable_link <- function(name){
  shinyjs::removeCssClass(selector = glue("a[data-target='{name}']"), 
                 class = "inactivelink")
}

#' @export
#' @rdname disable_link
toggle_link <- function(name, condition = NULL){
  shinyjs::toggleCssClass(selector = glue("a[data-target='{name}']"), 
                 class = "inactivelink",
                 condition = condition)
}

