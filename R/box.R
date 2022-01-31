
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
                collapsible = TRUE,
                collapsed = FALSE,
                header_ui = NULL){

  id_bx <- paste(sample(letters,8),collapse="")
  
  tool_ui <- if(collapsible){
    tags$a(style = "float:right;display:inline-block;", 
           `data-bs-toggle` = "collapse",
           href = paste0("#",id_bx),
           softui::bsicon("chevron-contract"))
  } else NULL
  
  
  if(title == "" & subtitle == ""){
    head_section <- NULL
  } else {
    head_section <- tags$div(class = "card-header",
                             tags$span(class="text-gradient text-primary text-uppercase text-xs font-weight-bold my-2",tag),
                             tags$h5(class = "card-title", title, style = "display: inline-block !important; float: left;"),
                             tags$h6(class = "card-subtitle text-muted", subtitle, style = "display: inline-block !important; float: left;"),
                             tool_ui,
                             header_ui
    )
  }
  
  
  tags$div(class = glue::glue("col-lg-{width}"), 
    tags$div(class = "card",
             head_section,        
             tags$div(
               id = id_bx, class = ifelse(collapsed, "collapse", "collapse show"),
               tags$div(class = "card-body", ...)
             )
             
    )
  )

}




# 
# tags$a(class = "btn btn-primary", 
#        `data-bs-toggle`="collapse", 
#        href="#collapseExample"),
# tags$div(
#   class = "collapse", id = "collapseExample",
#   tags$div(class = "card card-body",
#            "Some placeholder content for the collapse component. This panel is hidden by default but revealed when the user activates the relevant trigger."
#            
#   )
# ),

