
#'Dashboard body
#'@description Makes the dashboard body of a dashboard page. See `?dashboard_page` for a minimal example.
#'Accepts only a `tab_items` object, which has multiple `tab_item`'s in it, each with the UI for a 'page' 
#'(typically a shiny module UI function).
#'@export
#'@param \dots A `tab_items` object, and maybe other HTML.
#'@rdname dashboard_body
dashboard_body <- function(..., .list = NULL){
  
  items <- c(list(...),.list)
  
  shiny::tags$div(items)
}

#'@export
#'@rdname dashboard_body
tab_items <- function(..., .list = NULL){


  items <- dropNulls(c(list(...), .list))
  
  items[[1]] <- htmltools::tagAppendAttributes(items[[1]], class = "active") 

  fluid_page(

    shiny::tags$div(
    class = "tab-content",

    items

  ))

}


#'@export
#'@rdname dashboard_body
tab_item <- function(tabName, ...){

  shiny::tags$div(class = "tab-pane fade show",
           id = glue::glue("shiny-tab-{tabName}"),
           ...
  )

}






