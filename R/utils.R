random_id <- function(){
  paste(sample(letters,8),collapse="")
}


dropNulls <- function (x){
  x[!vapply(x, is.null, FUN.VALUE = logical(1))]
}


#' Valid statuses
#'
#' These status strings correspond to colors as defined in Bootstrap's CSS.
#' Although the colors can vary depending on the particular CSS selector, they
#' generally appear as follows:
#'
#' \itemize{
#'   \item `primary` Dark blue
#'   \item `secondary` Grey / blue
#'   \item `success` Green
#'   \item `info` Lighter blue
#'   \item `warning` Orange
#'   \item `danger` Red
#'   \item `light` Light grey
#'   \item `dark` Dark grey / black
#' }
#'
#' @usage NULL
#' @format NULL
#'
#' @keywords internal
valid_statuses <- c("primary", "secondary", "success", "info", "warning", "danger", "light", "dark")


validate_status <- function(status) {
  
  if (all(status %in% valid_statuses)) {
    return(TRUE)
  }
  
  stop("Invalid status: ", status, ". Valid statuses are: ",
       paste(valid_statuses, collapse = ", "), ".")
}




#--- validators
validate_tab_name <- function(name){
  if (!is.null(name) && grepl(".", name, fixed = TRUE)) {
    stop("tabName must not have a '.' in it.")
  }
}





