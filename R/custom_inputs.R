
#' Common shiny inputs with Shinto defaults
#' 
#' @rdname shintoinputs
#' @export
select_input <- function(...){
  
  shiny::selectizeInput(...,
                        options = list(
                          'plugins' = list('remove_button'))
  )
  
}

#' @rdname shintoinputs
#' @importFrom shinyWidgets materialSwitch
#' @export
material_switch <- function(...,
                            status = "primary",
                            inline = TRUE){
  
  shinyWidgets::materialSwitch(...,
                               inline = inline,
                               status = status)
  
}

