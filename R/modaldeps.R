#' Convenient wrapper around modalDialog
#' @param title Title for the modal
#' @param easyClose Can the modal close by clicking outside the modal?
#' @param id_confirm Id of the 'OK' button, will be namespaced!
#' @param confirm_txt Text on 'OK' button
#' @param confirm_icon Icon on 'OK' button
#' @param close_txt Text on 'Close' button
#' @param close_icon Icon on 'Close' icon
#' @param session Shiny session object (no need to set)
#' @export
modal <- function(..., title = "", easyClose = TRUE,
                  id_confirm = "btn_confirm_modal",
                  confirm_txt = "OK", 
                  confirm_icon = softui::bsicon("check-lg"),
                  close_txt = "Sluiten", 
                  close_icon = softui::bsicon("x-lg"),
                  session = shiny::getDefaultReactiveDomain()){
  
  # see zzz.R; inst/logo is available under logo/
  img <- "shintologo/logoshintolabs.png"
  
  modalDialog(
    easyClose = TRUE,
    title = tags$div(title, 
                    tags$span(
                      tags$img(src=img, width = 70), 
                      style = "display:inline-block; float:right;")
            ),
    
    ...,
    footer = list(
      actionButton(random_id(), 
                   close_txt, 
                   icon = close_icon,
                   class= "btn-danger",
                   `data-bs-dismiss` = "modal"),
      actionButton(session$ns(id_confirm), 
                   confirm_txt, 
                   icon = confirm_icon, 
                   class= "btn-success")
    )
  )  
  
}
