
#' Box within a box
#' @description You are not allowed to place a `softui::box` inside another `softui::box`, but you can
#' use this `sub_box`, or `?alert_box` for a message-type box.
#' @param title A title for the box
#' @param grey_level Value between 0.1 (standard) and 0.9 (very dark), in steps of 0.1.
#' @param icon An icon (optional), placed left of the title
#' @param collapsible If TRUE (default), can be minimized
#' @param collapsed If TRUE, starts minimized
#' @param margin_bottom Margin below the `sub_box`, in pixels
#' @param \dots Any HTML (or text) items to appear in the box.
#' @export
sub_box <- function(..., 
                    title = NULL, 
                    icon = NULL,
                    grey_level = 0.1,
                    collapsible = TRUE,
                    collapsed = FALSE,
                    dashed_border = FALSE,
                    border_width = 3,
                    margin_bottom = 0,
                    title_container = shiny::tags$h6){
  
  grey_level <- as.numeric(grey_level)
  if((10 *grey_level) %% 1 > 0){
    stop("provide grey_level in steps of 0.1")
  }
  stopifnot(grey_level >= 0 & grey_level <= 0.9)
  
  bg_css <- ifelse(grey_level == 0, "", glue::glue("bg-gray-{1000*grey_level}"))
  border_css <- ifelse(!dashed_border, "", glue::glue("border-dashed border-{border_width}"))
  box_class <- paste("card-plain", bg_css, border_css)  # card-plain switches off box-shadow
  
  box(
    title = title, class = box_class,
    collapsed = collapsed, collapsible = collapsible,
    title_container = title_container,
    ...
  )

}
