#' Icofont icons
#' @export
#' 
icoicon <- function(iconname, 
                    class = NULL, 
                    status = NULL, ...){
  
  
  if(!is.null(status)){
    validate_status(status)
    class <- paste(class, glue::glue("text-{status} text-gradient"))
  }
  
  iconClass <- paste0("icofont-",iconname)
  
  if(!is.null(class)){
    iconClass <- paste(iconClass, class)
  }
  
  shiny::tags$i(class = iconClass, role = "presentation",
                `aria-label` = paste(iconname, "icon"), ...)
  
  
}
