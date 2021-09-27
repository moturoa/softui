#' Bootstrap Icons
#' @description These icons look better with Boostrap4 than fontawesome!
#' @export
bsicon <- function(iconname, class = NULL, ...){

  if(iconname == "refresh")iconname <- "arrow-clockwise"
  if(iconname == "home")iconname <- "house"

  iconClass <- paste0("bi-",iconname)

  if(!is.null(class)){
    iconClass <- paste(iconClass, class)
  }

  tags$i(class = iconClass, role = "presentation",
         `aria-label` = paste(iconname, "icon"), ...)
}





