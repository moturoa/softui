
#' Content box
#' @param width Bootstrap width
#' @param title Title for the box
#' @param header_ui More UI to place just under the title
#' @export
box <- function(..., width = 12, title = "", header_ui = NULL){

  tags$div(class = glue::glue("col-lg-{width}"),
    tags$div(class = "card",
             tags$div(class = "card-header",
              tags$h6(title),
              header_ui
             ),
             tags$div(class = "card-body", ...)

    )
  )

}

