#' Simple wrapper around actionButton with softui CSS classes
#' @export
action_button <- function(..., 
                          class = "",
                          status = c("primary", "secondary", "info", "success", "danger", "warning", "light", "dark")){
  
  status <- match.arg(status)
  
  actionButton(..., class = paste(class, paste0("bg-gradient-",status)))
  
}
