
#' Content box
#' @param width Bootstrap width
#' @param title Title for the box
#' @param subtitle Subtitle for the box
#' @param tag Short label text above the title (in CAPS)
#' @param header_ui More UI to place just under the title
#' @export
box <- function(..., width = 12,
                title = "",
                subtitle = "",
                tag = "",
                header_ui = NULL){

  tags$div(class = glue::glue("col-lg-{width}"),
    tags$div(class = "card",
             tags$div(class = "card-header",
                tags$span(class="text-gradient text-primary text-uppercase text-xs font-weight-bold my-2",tag),
                tags$h5(class = "card-title", title),
                tags$h6(class = "card-subtitle text-muted", subtitle),

                header_ui
             ),
             tags$div(class = "card-body", ...)

    )
  )

}

