
#' Box within a box
#' @description You are not allowed to place a `softui::box` inside another `softui::box`, but you can
#' use this `sub_box`, or `?alert_box` for a message-type box.
#' @param title A title for the box
#' @param grey_level Value between 0.1 (standard) and 0.9 (very dark), in steps of 0.1.
#' @param \dots Any HTML (or text) items to appear in the box.
#' @export
sub_box <- function(..., title = NULL, grey_level = 0.1){
  
  grey_level <- as.numeric(grey_level)
  if((10 *grey_level) %% 1 > 0){
    stop("provide grey_level in steps of 0.1")
  }
  stopifnot(grey_level >= 0.1 & grey_level <= 0.9)
  
  tags$ul(class = "list-group",
    tags$li(class = glue::glue("list-group-item border-0 d-flex p-4 mb-2 bg-gray-{1000*grey_level} border-radius-lg"),
      tags$div(class="d-flex flex-column",
          if(!is.null(title)){
            tags$h6(class="mb-3 text-sm", title)
          }, ...
      )
    )
  )
  
}

