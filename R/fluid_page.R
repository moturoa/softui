fluid_page <- function(...){


  tags$div(class = "container-fluid py-4", ...)

}

fluid_row <- function(..., margin = 4){

  tags$div(class = glue::glue("row mt-{margin}"), ...)

}

