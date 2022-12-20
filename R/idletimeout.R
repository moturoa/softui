#' Stop application after idle timeout 
#' @details jQuery implementation
#' @param time Time after which 'stopApp' is called
#' @param units Either 'minutes' or 'seconds' of time.
#' @export
#' @rdname idle_timeout
idle_timeout <- function(timeout_warning = 1800){
  
  out <- callModule(idle_timeout_mod, "idle_timeout", timeout_warning, timeout_stop)
  
return(out)
}

idle_timeout_mod <- function(input, output, session, timeout_warning, timeout_stop){
  
  idle_cur <- reactive(input$app_idle_time)
  
  idle_warning_modal_show <- reactiveVal(FALSE)
  idle_error_modal_show <- reactiveVal(FALSE)
  
  observeEvent(idle_cur(), {
    
    if(idle_cur() > timeout_warning){
      idle_warning_modal_show(TRUE)
    }
    # 
    # if(idle_cur() > timeout_stop){
    #   idle_error_modal_show(FALSE)
    # }
    
  })
  
  observeEvent(idle_warning_modal_show(),{
    
    mod <- idle_warning_modal_show()
    if(isTRUE(mod)){
      
      showModal(
        softui::modal(
          title = "Sessie verlengen?",
          close_button = FALSE, confirm_txt = "OK",
          icon = bsicon("alarm-fill", status = "info"),
          
          tags$p("Uw sessie is al lang ongebruikt, en zal binnenkort gesloten worden."),
          tags$p("Klik OK om verder te gaan."),
          
          softui::action_button(session$ns("btn_logout"), 
                                "Of klik hier om uit te loggen", 
                                icon = bsicon("box-arrow-right"),
                                status = "warning",
                                onclick = "document.location.href = document.location.href + '__logout__';")
          
        )  
      )
      
    }
    
  })
  
  
return(idle_cur)
}



