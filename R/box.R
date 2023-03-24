
#' Content box
#' @description All content in a softui application should be placed inside a `softui::box`. 
#' Unlike `shinydashboard::box`, the box has a default width of 12, so it fills up the space provided.
#' Do not usually set the height of the box (but see argument `height`), instead let the components inside decide.
#' See Example. The margin works a little different too. A `softui::box` has zero margin at the top, and a standard margin
#' of 32px at the bottom (see argument `margin_bottom`).
#' @details This is actually a `div` with class `card` (and sub components), 
#' a standard Bootstrap 5.1 component further styled by softui CSS.
#' @param width Bootstrap width
#' @param title Title for the box
#' @param subtitle Subtitle for the box
#' @param icon Optional icon (will be placed left of title)
#' @param tag Short label text above the title (appears in uppercase letters)
#' @param tag_status Status color for the tag (see `?valid_statuses`)
#' @param collapsible If collapsible, allow the box to be minimized (button top-right)
#' @param collapsed If TRUE (default: FALSE) the box starts in collapsed state.
#' @param closable If TRUE, box can be closed (removed permanently)
#' @param header_ui More UI to place just under the title
#' @param height Height of the box (NULL to autosize) (400 or "400px")
#' @param margin_bottom The margin at the bottom of the box (margin to the next box). A box has always zero margin at the top!
#' @param class Extra CSS class for the `card` (the `div` will get class `card` + provided CSS classes). 
#' Can be a vector of classes or e.g. "class1 class2". Softui (and Bootstrap 5.1) have a number of interesting classes such as
#' 'card-plain', 'card-blog', or various margin-modifying classes ('mt-5', 'mt-md-0'). More research needed.
#' @param id An id for the box, you must set this if you want to collapse the box with [collapse_box()].
#' @export
#' @examples
#' ui <- softui::simple_page(
#' softui::fluid_row(
#'   softui::box(width = 6,
#'               title = "Box 1", icon = bsicon("archive-fill", status = "warning"),
#'               tag = "data",
#'               plotOutput("plot1", height = 400)
#'   ),
#'   softui::box(width = 6,
#'               title = "Box 2", icon = bsicon("boombox-fill", status = "success"),
#'               tag = "plot",
#'               plotOutput("plot2", height = 400)
#'   )
#' ),
#' softui::fluid_row(
#'   softui::box(
#'     title = "Box 2", 
#'     tag = "info",
#'     tag_status = "info",
#'     plotOutput("plot2", height = 200)
#'   )
#' )
#' )
#'
#' shinyApp(ui,function(){})
box <- function(..., width = 12,
                title = NULL,
                subtitle = NULL,
                icon = NULL,
                tag = "",
                tag_status = "primary",
                collapsible = TRUE,
                collapsed = FALSE,
                closable = FALSE,
                header_ui = NULL,
                height = NULL,
                margin_bottom = 32, 
                class = "",
                title_container = shiny::tags$h5,
                id = NULL){

  if(is.null(id)){
    id_bx <- random_id()  
  } else {
    id_bx <- id
  }
  
  
  validate_status(tag_status)
  
  if(!is.null(icon)){
    title <- htmltools::tagList(icon, title)
  }
  
  # CSS class can be a vector
  if(length(class) > 1)class <- paste(class, collapse = " ")
  
  if(collapsed & is.null(title)){
    stop("Must provide title for collapsed box")
  }
  
  collapse_tool <- htmltools::tagAppendAttributes(
    shiny::tags$div(softui::bsicon("chevron-up"), 
                    style = "display: inline-block;"),
    class = "rotate"
  )
  
  if(collapsed)collapse_tool <- htmltools::tagAppendAttributes(collapse_tool, class = "rotated180")
  
  tool_ui <- tags$div(style = "float:right;display:inline-block;", class = "softui-box-tools",
                      
              if(collapsible){
                  collapse_tool
              },
              
              if(closable){
                tags$button(type = "button", class = "btn-close", 
                            onclick = "$(this).closest('.card').fadeOut();",
                            style = glue::glue("display: inline-block;",
                                               "color: black !important;",
                                               "margin-left: 8px;",
                                               "opacity: 0.9;",
                                               "background: none;"),
                  bsicon("x-lg")
                )
              }

  )
  
  
  tag_ui <- if(!is.null(tag) && tag != ""){
    shiny::tags$span(class = glue::glue("text-gradient text-{tag_status} text-uppercase text-xs font-weight-bold my-2"),
                     tag)
  } else NULL
  
  if(is.null(title) & is.null(subtitle)){
    head_section <- NULL
  } else {
    

    head_section <- shiny::tags$div(class = paste("card-header",class),
                             style = "border-radius: 1rem; border: none;",
                             tag_ui,

                             shiny::tags$div(style = "width: 100% !important; height: 40px !important;",
                               title_container(class = "card-title", title, style = "display: inline-block !important; float: left;"),
                               tool_ui,  
                             ),
                             
                             shiny::tags$h6(class = "card-subtitle text-muted", subtitle), 
                             header_ui
    )
    
    
    if(collapsible){
      
      
      head_section <- shiny::tags$a(style = "display: inline-block;",
                                    `data-bs-toggle` = "collapse",
                                    href = paste0("#",id_bx),
                                    id = paste0("collapse-",id_bx),
                                    style = "text-decoration: none !important;",
                                    onclick = "$(this).find('.rotate').toggleClass('rotated180');",
                                    
                                    head_section)
      
    }
    
  }
  
  dvst <- ifelse(is.null(height), "", glue::glue("height: {shiny::validateCssUnit(height)};"))
  mst <- glue::glue("margin-bottom: {shiny::validateCssUnit(margin_bottom)} !important;")
  
  shiny::tags$div(class = glue::glue("col-lg-{width}"), 
    shiny::tags$div(class = paste("card",class),
             style = paste(mst,dvst),
             head_section,        
             shiny::tags$div(
               id = id_bx, class = ifelse(collapsed, "collapse", "collapse show"),
               shiny::tags$div(class = "card-body", 
                        style = "padding-top: 4px;",
                        ...)
             )
    )
  )

}



