#' UI-side Modal
#' @description Persistent UI-side modal. Inputs do not reset every time the modal opens
#' as with a normal `shiny::modalDialog`. Make the modal in the UI, together with a modal button
#' that opens the modal. It is not possible to open this modal with [showModal()]!
#' @param id Id of the modal, corresponds to `modalId` in `modal_action_button`
#' @param ns Namespace function; pass the `ns` function of the Shiny UI module you are working in.
#' @param \dots Further arguments passed to [modal()]
#' @param inputId Id of the modal action button; not actually important unless the button also
#' has other side effects besides opening this modal.
#' @export
#' @rdname ui_modal
#' @examples
#' \dontrun{
#' ui <- softui::simple_page(
#'
#'modal_action_button("btn1", modalId = "modal_car_select", 
#'                    label = "Select cars", icon = bsicon("filter"), status = "info"),
#'ui_modal(
#'  title = "UI-side modal",
#'  id = "modal_car_select",
#'  selectInput("sel1", "Cars", choices = rownames(mtcars))
#')
#'
#')
#'server <- function(input, output, session) {}
#'shinyApp(ui, server)
#'}
ui_modal <- function(id, ..., ns = function(x)x){
  
  if(missing(id)){
    stop("ui_modal needs an ID; use it as argument 'modalId' in 'modal_action_button'")
  }
  
  modal(id = id, ns = ns, ...)
  
}


#' @export
#' @rdname ui_modal
modal_action_button <- function(inputId, modalId, ...){
  
  btn <- softui::action_button(inputId, ...)
  htmltools::tagAppendAttributes(btn, 
                                 `data-bs-toggle` = "modal", 
                                 `data-bs-target` = paste0("#",modalId)
                                 )
}
