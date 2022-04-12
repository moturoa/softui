#' Alert boxes
#' @details Does not replace `shiny_toastr`'s, just for making closable boxes withn important message
#' or warning. Use within `softui::box` for example.
#' @export
alert <- function(text, 
                  status = c("primary", "secondary", "info", "success", "danger", "warning", "light", "dark")){
  
  status <- match.arg(status)
  
  shiny::tags$div(class= glue::glue("alert alert-{status} alert-dismissible fade show text-white font-weight-bold"), 
                  role = "alert",
           text
           # if(closeable){
           #   tags$div(
           #     class= "float-right",
           #     style = glue("height: 100%; width: 40px;"),
           #    shiny::tags$button(type="button", 
           #                       `data-bs-dismiss`="alert", 
           #                       `aria-label`="Close",
           #                       tags$div(style = glue("background: none; border: none;",
           #                                             "font-size: 1.5em; height: 100%;", 
           #                                              "padding: 1.25rem 0.5rem !important;"),
           #                                 HTML("&times;")))
           #   )
           #   
           # }
  )
           
  
} 
