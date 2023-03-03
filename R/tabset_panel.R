
#' Tab panel 
#' @description Just like tab_box, but without a box-shadow. You can use a tabset_panel in a box,
#' but you cannot use a tab_box in a box (double box shadows!).
#' Identical to `tab_box(..., class = 'card-plain')`
#'@param id Optional id for the tab_box
#'@param selected Which tab is selected initially? Defaults to the first tab
#'@param width Width of tab_box in bootstrap units (default = 12)
#'@param fill If TRUE, makes the tab panel titles fill the entire available width
#'@param style Extra CSS for the `card` class.
#'@param ... Furher arguments to [tab_box()], and `tab_panel`'s
#'@export
tabset_panel <- function(..., 
                    id = NULL,
                    selected = NULL, 
                    width = 12,
                    fill = FALSE,
                    type = NULL,
                    style = ""){
  
  
  if(!is.null(type)){
    message("type argument to tabset_panel is now ignored (always pills)")
  }
  
  tab_box(
    id = id, selected = selected, width = width, fill = fill, style = style,
    class = "card-plain", ...
  )
  
  
}
