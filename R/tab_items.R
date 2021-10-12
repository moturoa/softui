

dashboard_body <- function(...){
  tags$div(...)
}


tab_items <- function(...){


  fluid_page(

    tags$div(
    class = "tab-content",

    ...

  ))

}



tab_item <- function(tabName, ...){

  tags$div(class = "tab-pane fade show",
           id = glue::glue("shiny-tab-{tabName}"),
           ...
  )

}






