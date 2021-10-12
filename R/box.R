

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

