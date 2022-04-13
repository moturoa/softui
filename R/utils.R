random_id <- function(){
  paste(sample(letters,8),collapse="")
}


#' Valid statuses
#'
#' These status strings correspond to colors as defined in Bootstrap's CSS.
#' Although the colors can vary depending on the particular CSS selector, they
#' generally appear as follows:
#'
#' \itemize{
#'   \item \code{primary} Dark blue
#'   \item \code{secondary} Grey / blue
#'   \item \code{success} Green
#'   \item \code{info} Lighter blue
#'   \item \code{warning} Orange
#'   \item \code{danger} Red
#'   \item \code{light} Light grey
#'   \item \code{dark} Dark grey / black
#' }
#'
#' @usage NULL
#' @format NULL
#'
#' @keywords internal
valid_statuses <- c("primary", "secondary", "success", "info", "warning", "danger", "light", "dark")


validate_status <- function(status) {
  
  if (status %in% valid_statuses) {
    return(TRUE)
  }
  
  stop("Invalid status: ", status, ". Valid statuses are: ",
       paste(valid_statuses, collapse = ", "), ".")
}


