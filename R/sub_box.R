
#' Box within a box
#' @description You are not allowed to place a `softui::box` inside another `softui::box`, but you can
#' use this `sub_box`, or `?alert_box` for a message-type box.
#' @param title A title for the box
#' @param grey_level Value between 0.1 (standard) and 0.9 (very dark), in steps of 0.1.
#' @param \dots Any HTML (or text) items to appear in the box.
#' @export
sub_box <- function(..., 
                    title = NULL, 
                    icon = NULL,
                    grey_level = 0.1,
                    collapsible = TRUE,
                    collapsed = FALSE){
  
  grey_level <- as.numeric(grey_level)
  if((10 *grey_level) %% 1 > 0){
    stop("provide grey_level in steps of 0.1")
  }
  stopifnot(grey_level >= 0.1 & grey_level <= 0.9)
  
  if(!is.null(icon)){
    title <- htmltools::tagList(icon, title)
  }
  
  id_bx <- random_id()
  
  icon_ <- htmltools::tagAppendAttributes(
    shiny::tags$div(softui::bsicon("chevron-up")),
    class = "rotate"
  )
  
  if(collapsed)icon_ <- htmltools::tagAppendAttributes(icon_, class = "rotated180")
  
  tool_ui <- if(collapsible){
    shiny::tags$a(style = "float:right;display:inline-block;", 
                  `data-bs-toggle` = "collapse",
                  href = paste0("#",id_bx),
                  icon_
    )
  } else NULL
  
  # shiny::tags$ul(class = "list-group",
  #   shiny::tags$li(class = glue::glue("list-group-item border-0  p-4 mb-2 bg-gray-{1000*grey_level} border-radius-lg"), #d-flex
    tags$div(class = glue::glue("border-0 p-4 bg-gray-{1000*grey_level} border-radius-lg"),   #  mb-2     
                   
      #shiny::tags$div(style = "width: 100%;",  #class="d-flex flex-column",
          if(!is.null(title)){
            shiny::tagList(
              shiny::tags$div(style = "width: 100% !important; height: 32px !important;",
                              shiny::tags$h6(class="text-sm", 
                                             title, 
                                             style = paste("display: inline-block !important;",
                                                           "float: left;")),
                              tags$div(tool_ui, style = "float: right;")
              ) #,
              #tags$br()
            )
          }, 
          
          shiny::tags$div(
            id = id_bx, class = ifelse(collapsed, "collapse", "collapse show"),
            ...
          )
      )
    #)
  
  
}

