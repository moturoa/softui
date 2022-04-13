#' Utilities for links to pages
#' @param id Value of the ID that will be sent as link information (e.g. person ID, location ID)
#' @param id_out Name of the input ID to set when clicked on a link (namespacing in modules is done automatically)
#' @param label Label to appear in the link
#' @param input Shiny input object
#' @param session Shiny session object (no need to set)
#' @param class CSS class of the text in the link
#' @param tabName Which page to jump to on clicking the link
#' @export
#' @rdname page_link
page_link <- function(id, label, 
                      id_out = "click_id",
                      session = shiny::getDefaultReactiveDomain(), 
                      class = "page_link"){
  
  
  id_out <- session$ns(id_out)  
  
  
  glue::glue("<a onclick=\"setClickId('{id}',",
             " '{id_out}');\"><span class='{class}' ",
             "style = 'cursor: pointer !important; text-decoration: underline !important;'>",
             " {label}</span></a>")  

}


#' @export
#' @rdname page_link
route_page_link <- function(id, 
                            tabName,
                            input,
                            session = shiny::getDefaultReactiveDomain()){
  
  validate_tab_name(tabName)
  
  observeEvent(input[[id]],  {
    
    if(is.null(session$userData[[id]])){
      session$userData[[id]] <- shiny::reactiveVal()
    }
    
    session$userData[[id]](input[[id]])
    
    softui::go_to_page(tabName)
    
  })
  
}

#' @export
clicked_link_id <- function(id, input, session = shiny::getDefaultReactiveDomain()){
  
  shiny::reactive({
    
    if(!is.null(session$userData[[id]])){
      session$userData[[id]]()
    } else {
      NULL
    }
    
  })
  
  
}


