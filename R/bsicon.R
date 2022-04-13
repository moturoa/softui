#' Bootstrap Icons
#' @description Use `bsicon` instead of `shiny::icon` in a softui application. 
#' If status color is set, the icon is colored (with a gradient color). 
#' @param iconname Name of the Bootstrap icon [](https://icons.getbootstrap.com/)
#' @param class Extra CSS class for the button (for color, use `status` instead)
#' @param status Status color (see `?valid_statuses`)
#' @param \dots Extra arguments to the `i` tag (will become attributes of the tag)
#' @export
bsicon <- function(iconname, 
                   class = NULL, 
                   status = NULL,
                   ...){

  
  if(!is.null(status)){
    validate_status(status)
    class <- paste(class, glue("text-{status} text-gradient"))
  }
  
  # These are for laziness and backwards comp.
  if(iconname == "refresh")iconname <- "arrow-clockwise"
  if(iconname == "home")iconname <- "house"

  iconClass <- paste0("bi-",iconname)

  if(!is.null(class)){
    iconClass <- paste(iconClass, class)
  }

  tags$i(class = iconClass, role = "presentation",
         `aria-label` = paste(iconname, "icon"), ...)
}





