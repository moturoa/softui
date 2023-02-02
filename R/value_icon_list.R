
#' Value icon table for use in a box
#' @export
#' @rdname value_icon_table
value_icon_table <- function(...){
  
  tags$ul(
    class = "list-group",
    ...
  )
  
}


#' @export
#' @rdname value_icon_table  
value_icon_item <- function(title = NULL, 
                            icon = NULL,
                            status = "dark",
                            value = 0,
                            value_suffix = "items",
                            sub_value = NULL,
                            sub_value_suffix = NULL
                            ){
  
  validate_status(status)
  if(!is.null(sub_value))sub_value <- paste(",", sub_value)
  
  tags$li(
    class = "list-group-item border-0 d-flex justify-content-between ps-0 mb-2 border-radius-lg",
    tags$div(
      class = "d-flex align-items-center",
      tags$div(
      class = glue::glue("icon icon-shape icon-sm me-3 bg-gradient-{status} shadow text-center"),
        icon
      ),
      tags$div(
        class = "d-flex flex-column",
        tags$h6(
          class = "mb-1 text-dark text-sm",
          title
        ),
        tags$span(
          class = "text-xs",
          paste(value, value_suffix),
          
          tags$span(
            class = "font-weight-bold",
            paste(sub_value, sub_value_suffix),
          )
        )
      )
    )

  )
  
}
    




