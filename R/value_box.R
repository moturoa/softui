#' Value box
#' @details Makes a softui 'value box' with icon, value, title, and badge (e.g. +12, -80) with a status color. 
#' Use in a `uiOutput`.
#' @param value A value to display
#' @param sub_value A subtitle under the value
#' @param sub_status Status color of the badge (best: "success" for positive, "danger" for negative, or see `?valid_statuses`)
#' @param icon An icon to place
#' @param height Height of the value box (NULL to autosize) (400 or "400px")
#' @export
value_box <- function(value,
                      title,
                      sub_value = "",
                      sub_status = "success",
                      icon = icon("chart-bar"),
                      width = 4,
                      height = NULL){


  validate_status(sub_status)
  
  dvst <- ifelse(is.null(height), "", glue::glue("height: {shiny::validateCssUnit(height)}"))
  
  tags$div(class = glue::glue("col-lg-{width} col-sm-{width}"), 

    tags$div(class = "card mb-4",
      tags$div(class = "card-body p-3", style = dvst,
        tags$div(class = "row",
          tags$div(class = "col-8",
            tags$div(class = "numbers",
              tags$p(class = "text-sm mb-0 text-capitalize font-weight-bold",
                title
              ),
            tags$h5(class="font-weight-bolder mb-0",
                    value, 
                    
              tags$span(class = glue::glue("text-{sub_status} text-sm font-weight-bolder"),
                 sub_value
              )
            )
          )
        ),
        tags$div(class = "col-4 text-end",
          tags$div(class = "icon icon-shape bg-gradient-primary shadow text-center border-radius-md",
            style = "float: right;",
              icon
            )
          )
        )
      )
    )

  )


}

