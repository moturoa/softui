#' Add a tooltip next to a label
#' @description Adds an icon right of a label, on hover shows help text. 
#' @param label Label, the text to appear left of the icon. If you want only the icon, do not set.
#' @param tooltip Text to show when hovering over the icon.
#' @param icon The icon to show next to the label
#' @param \dots Further arguments passed to [tippy::tippy()]
#' @importFrom tippy tippy
#' @export
with_tooltip <- function(label = NULL, tooltip, icon = bsicon("info-circle-fill"), ...){
  
  tags$span(label, tippy::tippy(tags$span(icon), tooltip, ...))
  
}
