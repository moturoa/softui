

dashboard_body <- function(...){
  tags$div(...)
}


tab_items <- function(...){


  items <- list(...)
  items[[1]] <- items[[1]] %>% tagAppendAttributes(class = "active")

  fluid_page(

    tags$div(
    class = "tab-content",

    items

  ))

}



tab_item <- function(tabName, ...){

  tags$div(class = "tab-pane fade show",
           id = glue::glue("shiny-tab-{tabName}"),
           ...
  )

}






