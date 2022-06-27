#' Add a tooltip next to a label
#' @desciption Adds an icon right of a label, on hover shows help text. 
#' Uses the `prompter` package. For this to work, add `use_prompter()` in the UI function of
#' your app, this is already loaded by `dashboard_page` and `simple_page`. 
#' @param label Label, the text to appear left of the icon. If you want only the icon, do not set.
#' @param tooltip Text to show when hovering over the icon.
#' @param icon The icon to show next to the label
#' @param position Position of the tooltip, default 'top' (see `?prompter::add_prompt` for options)
#' @param \dots Further arguments passed to [prompter::add_prompt()]
#' @importFrom prompter add_prompt
#' @export
with_tooltip <- function(label = NULL, tooltip, icon = bsicon("info-circle-fill"), 
                         position = "top", ...){
  
  tags$span(label, prompter::add_prompt(tags$span(icon), 
                                      position = position,
                                      message = tooltip, ...))
  
}
