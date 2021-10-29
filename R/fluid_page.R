
#' Content container
#' @export
#' @rdname fluid_page
fluid_page <- function(...){


  tags$div(class = "container-fluid py-4", ...)
  # shiny::fluidPage(
  #   theme = bslib::bs_theme(version = 5),
  #   ...
  # )

}

#' @rdname fluid_page
#' @param margin Margin units, space between boxes (4 is default)
#' @export
fluid_row <- function(..., margin = 4){

  tags$div(class = glue::glue("row mt-{margin}"), ...)

}

