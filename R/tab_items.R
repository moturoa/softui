
#'Dashboard body
#'@export
#'@rdname dashboard_body
dashboard_body <- function(...){
  tags$div(...)
}

#'@export
#'@rdname dashboard_body
tab_items <- function(..., .list = NULL){


  items <- c(list(...), .list)
  items[[1]] <- items[[1]] %>% tagAppendAttributes(class = "active")

  fluid_page(

    tags$div(
    class = "tab-content",

    items

  ))

}


#'@export
#'@rdname dashboard_body
tab_item <- function(tabName, ...){

  tags$div(class = "tab-pane fade show",
           id = glue::glue("shiny-tab-{tabName}"),
           ...
  )

}






