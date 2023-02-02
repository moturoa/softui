#' Value box
#' @details Makes a softui 'value box' with icon, value, title, and badge (e.g. +12, -80) with a status color. 
#' Use in a `uiOutput`.
#' @param value A value to display
#' @param sub_value A subtitle under the value
#' @param sub_status Status color of the badge (best: "success" for positive, "danger" for negative, or see `?valid_statuses`)
#' @param icon An icon to place
#' @param format_value If TRUE, values like "1000" are formatted as "1,000". For this to work, value has to be numeric!
#' @param height Height of the value box (NULL to autosize) (400 or "400px")
#' @export
value_box <- function(value,
                      title,
                      sub_value = "",
                      sub_status = "success",
                      icon = icon("chart-bar"),
                      width = 4,
                      status = "primary",
                      format_value = FALSE,
                      height = NULL){


  validate_status(status)
  validate_status(sub_status)
  
  if(is.numeric(value) && format_value){
    fun <- scales::label_comma(accuracy = 1)
    value <- fun(value)
  }
  
  dvst <- ifelse(is.null(height), "", glue::glue("height: {shiny::validateCssUnit(height)}"))
  
  shiny::tags$div(class = glue::glue("col-lg-{width} col-sm-{width}"), 

    shiny::tags$div(class = "card mb-4",
      shiny::tags$div(class = "card-body p-3", style = dvst,
        shiny::tags$div(class = "row",
          shiny::tags$div(class = "col-8",
            shiny::tags$div(class = "numbers",
              shiny::tags$p(class = "text-sm mb-0 text-capitalize font-weight-bold",
                title
              ),
            shiny::tags$h5(class="font-weight-bolder mb-0",
                    value, 
                    
              shiny::tags$span(class = glue::glue("text-{sub_status} text-sm font-weight-bolder"),
                 sub_value
              )
            )
          )
        ),
        shiny::tags$div(class = "col-4 text-end",
          shiny::tags$div(class = glue::glue("icon icon-shape bg-gradient-{status} shadow text-center border-radius-md"),
            style = "float: right;",
              icon
            )
          )
        )
      )
    )

  )


}

