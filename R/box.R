
#' Content box
#' @param width Bootstrap width
#' @param title Title for the box
#' @param subtitle Subtitle for the box
#' @param tag Short label text above the title (in CAPS)
#' @param header_ui More UI to place just under the title
#' @export
box <- function(..., width = 12,
                title = NULL,
                subtitle = NULL,
                tag = "",
                tag_status = "primary",
                collapsible = TRUE,
                collapsed = FALSE,
                header_ui = NULL){

  id_bx <- paste(sample(letters,8),collapse="")
  
  if(collapsed & is.null(title)){
    stop("Must provide title for collapsed box")
  }
  
  tool_ui <- if(collapsible){
    tags$a(style = "float:right;display:inline-block;", 
           `data-bs-toggle` = "collapse",
           href = paste0("#",id_bx),
           softui::bsicon("chevron-contract"))
  } else NULL
  
  
  if(is.null(title) & is.null(subtitle)){
    head_section <- NULL
  } else {
    head_section <- tags$div(class = "card-header",
                             style = "border-radius: 1rem;",
                             tags$span(class=glue::glue("text-gradient text-{tag_status} text-uppercase text-xs font-weight-bold my-2"),tag),
                             tags$div(style = "width: 100% !important; height: 40px !important;",
                               tags$h5(class = "card-title", title, style = "display: inline-block !important; float: left;"),
                               tool_ui,  
                             ),
                             tags$h6(class = "card-subtitle text-muted", subtitle), #, style = "display: inline-block !important; float: left;"),
                             header_ui
    )
  }
  
  
  tags$div(class = glue::glue("col-lg-{width}"), 
    tags$div(class = "card",
             style = "margin-bottom: 32px !important;",
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

