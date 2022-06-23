#' Convenient wrapper around modalDialog
#' @param title Title for the modal
#' @param easyClose Can the modal close by clicking outside the modal?
#' @param id_confirm Id of the 'OK' button, will be namespaced!
#' @param confirm_txt Text on 'OK' button
#' @param confirm_icon Icon on 'OK' button
#' @param close_txt Text on 'Close' button
#' @param close_icon Icon on 'Close' icon
#' @param remove_modal_on_confirm If TRUE, always removes the modal on OK click. 
#' Otherwise, call `removeModal` yourself. This may be needed when some input 
#' validation is done before the modal can be removed.
#' @param size As in `?modalDialog` but also has a 'fullscreen' option.
#' @param session Shiny session object (no need to set)
#' @export
modal <- function(..., 
                  title = "", 
                  easyClose = TRUE,
                  confirm_button = TRUE,
                  id_confirm = "btn_confirm_modal",
                  confirm_txt = "OK", 
                  confirm_icon = softui::bsicon("check-lg"),
                  close_button = TRUE,
                  close_txt = "Sluiten", 
                  close_icon = softui::bsicon("x-lg"),
                  remove_modal_on_confirm = TRUE,
                  size = c("m", "s", "l", "xl", "fullscreen"), 
                  #fullscreen_up_to = c("always","sm","md","lg","xl","xxl"),
                  session = shiny::getDefaultReactiveDomain()){
  
  # see zzz.R; inst/logo is available under logo/
  img <- "shintologo/logoshintolabs.png"
  
  modal_dialog(
    easyClose = easyClose,
    size = size, # fullscreen_up_to = fullscreen_up_to,  # lijkt geen effect te hebben
    title = shiny::tags$div(title, 
                    shiny::tags$span(
                      shiny::tags$img(src=img, width = 70), 
                      style = "display:inline-block; float:right;")
            ),
    
    ...,
    footer = list(
      if(close_button){
        action_button(random_id(), 
                      close_txt, 
                      icon = close_icon,
                      status = "danger",
                      `data-bs-dismiss` = "modal")
      },
      
      if(confirm_button){
        btn <- action_button(session$ns(id_confirm), 
                     confirm_txt, 
                     icon = confirm_icon, 
                     status = "success")
        if(remove_modal_on_confirm){
          btn <- htmltools::tagAppendAttributes(
            btn, `data-bs-dismiss` = "modal"
          )
        }
        btn 
      }
    )
  )  
  
}

# copied from shiny::modalDialog
modal_dialog <- function (..., title = NULL, footer = modalButton("Dismiss"), 
                         size = c("m", "s", "l", "xl", "fullscreen"), 
                         fullscreen_up_to = c("always","sm","md","lg","xl","xxl"),
                         easyClose = FALSE, fade = TRUE){
  
  size <- match.arg(size)
  fullscreen_up_to <- match.arg(fullscreen_up_to)
  
  backdrop <- if (!easyClose)"static"
  keyboard <- if (!easyClose)"false"
  
  class <- switch(size, s = "modal-sm", m = NULL, l = "modal-lg", xl = "modal-xl", fullscreen = "modal-fullscreen")
  if(size  == "fullscreen" & fullscreen_up_to != "always"){
    class <- paste0(class,"-",fullscreen_up_to,"-down")
  }
  
  div(id = "shiny-modal", class = "modal", class = if (fade) 
    "fade", tabindex = "-1", `data-backdrop` = backdrop, 
    `data-bs-backdrop` = backdrop, `data-keyboard` = keyboard, 
    `data-bs-keyboard` = keyboard, 
    div(class = "modal-dialog", 
        class = class, 
        div(class = "modal-content", 
            if (!is.null(title)) div(class = "modal-header", tags$h4(class = "modal-title", title)), 
            div(class = "modal-body", ...), 
            if (!is.null(footer)) div(class = "modal-footer", footer))), 
    tags$script(HTML("if (window.bootstrap && !window.bootstrap.Modal.VERSION.match(/^4\\./)) {\n         var modal = new bootstrap.Modal(document.getElementById('shiny-modal'));\n         modal.show();\n      } else {\n         $('#shiny-modal').modal().focus();\n      }")))
}






