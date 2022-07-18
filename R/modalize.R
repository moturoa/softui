#' Modalize a shiny module
#' @description Place the UI of a module in a [softui::modal()], and call the 
#' server module in one command. The idea is that a module does not normally 
#' open a modal for you, but if you need the module in a modal, use `modalize`.
#' See `shintocatman` package for usage.
#' @param trigger_open A reactive used to trigger the modal (often: `reactive(input$btn_open_modal)`)
#' @param ui_module The module UI function
#' @param ui_pars A list of parameters to pass to the UI function
#' @param server_module The module server function
#' @param server_pars A list of arguments to send to the server module function
#' @param header_ui Extra UI to place above the module UI (in the modal)
#' @param footer_ui Extra UI to place below the module UI (in the modal)
#' @param \dots Further arguments passed to [softui::modal()] (such as `title = "Title!"` or `size = "fullscreen"`)
#'
#' @export
#' @importFrom uuid UUIDgenerate
modalize <- function(trigger_open = reactive(NULL), 
                     ui_module,
                     ui_pars = list(),
                     
                     server_module,
                     server_pars = list(),  
                     header_ui = NULL,
                     footer_ui = NULL,
                     
                     ...){
  
  shiny::moduleServer(uuid::UUIDgenerate(), 
               function(input,output,session){
                 
                 id <- uuid::UUIDgenerate()
                 
                 shiny::observeEvent(trigger_open(), ignoreInit = TRUE, ignoreNULL = TRUE, {
                   
                   shiny::showModal(
                     softui::modal(
                       id_confirm = "btn_modal_ok", ...,
                       header_ui,
                       do.call(ui_module, c(list(id = session$ns(id)), ui_pars)),
                       footer_ui
                     )
                   )
                   
                 })
                 
                 module_out <- do.call(callModule, c(list(module = server_module, id = id), 
                                                     server_pars))
                 
                 out <- shiny::eventReactive(input$btn_modal_ok, {
                   module_out()
                 })
                 
                 return(out)
                 
               })
  
}

