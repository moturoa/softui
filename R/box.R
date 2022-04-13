
#' Content box
#' @param width Bootstrap width
#' @param title Title for the box
#' @param subtitle Subtitle for the box
#' @param icon Optional icon (will be placed left of title)
#' @param tag Short label text above the title (in CAPS)
#' @param header_ui More UI to place just under the title
#' @param height Height of the box (NULL to autosize) (400 or "400px")
#' @export
box <- function(..., width = 12,
                title = NULL,
                subtitle = NULL,
                icon = NULL,
                tag = "",
                tag_status = "primary",
                collapsible = TRUE,
                collapsed = FALSE,
                header_ui = NULL,
                height = NULL,
                margin_bottom = 32, 
                class = ""){

  id_bx <- random_id()
  
  
  if(!is.null(icon)){
    title <- tagList(icon, title)
  }
  
  if(length(class) > 1)class <- paste(class, collapse = " ")
  
  if(collapsed & is.null(title)){
    stop("Must provide title for collapsed box")
  }
  
  icon_ <- tags$div(softui::bsicon("chevron-up")) %>%
    htmltools::tagAppendAttributes(class = "rotate")
  if(collapsed)icon_ <- htmltools::tagAppendAttributes(icon_, class = "rotated180")
  
  tool_ui <- if(collapsible){
    tags$a(style = "float:right;display:inline-block;", 
           `data-bs-toggle` = "collapse",
           href = paste0("#",id_bx),
           icon_
           )
  } else NULL
  
  
  tag_ui <- if(!is.null(tag) && tag != ""){
    tags$span(class=glue::glue("text-gradient text-{tag_status} text-uppercase text-xs font-weight-bold my-2"),tag)
  } else NULL
  
  if(is.null(title) & is.null(subtitle)){
    head_section <- NULL
  } else {
    head_section <- tags$div(class = "card-header",
                             style = "border-radius: 1rem;",
                             tag_ui,

                             tags$div(style = "width: 100% !important; height: 40px !important;",
                               tags$h5(class = "card-title", title, style = "display: inline-block !important; float: left;"),
                               tool_ui,  
                             ),
                             tags$h6(class = "card-subtitle text-muted", subtitle), 
                             header_ui
    )
  }
  
  dvst <- ifelse(is.null(height), "", glue::glue("height: {shiny::validateCssUnit(height)};"))
  mst <- glue::glue("margin-bottom: {shiny::validateCssUnit(margin_bottom)} !important;")
  
  tags$div(class = glue::glue("col-lg-{width}"), 
    tags$div(class = paste("card",class),
             style = paste(mst,dvst),
             head_section,        
             tags$div(
               id = id_bx, class = ifelse(collapsed, "collapse", "collapse show"),
               tags$div(class = "card-body", 
                        style = "padding-top: 4px;",
                        ...)
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

