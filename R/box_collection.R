#'  Indexed boxes
#'  @description Works like a tab_box, except a menu appears on the left (in a box), 
#'  and content appears in boxes on the right.
#'  @rdname box_collection
#'  @export
#'  @examples
#'  ui <- softui::simple_page(
#' box_collection(
#'
#'  box_panel(title = "Box 1", tags$p("Dit is de eerste box met content")),
#'  box_panel(title = "Box 2", tags$p("Dit is de tweede box met content")),
#'  box_panel(title = "Box 3", tags$p("Dit is de derde box met content")),
#'  box_panel(title = "Box 4", tags$p("Dit is de vierde box met content"))
#'  
#')
#'
#')
#'
#'shinyApp(ui, function(input,output){})
box_panel <- function(title = "", ..., value = title, icon = NULL, style = "", width = NULL){
  
  if(!is.null(width)){
    warning("width ignored; sized by box_collection")
  }
  
  tab_title <- as.character(title)
  
  if(!is.null(icon)){
    tab_title <- paste(as.character(icon), tab_title)
  }
  
  value <- as.character(value)
  
  if(nchar(value) == 0){
    value <- random_id()
  }
  
  shiny::tags$div(class = "tab-pane", 
                  `data-value` = value, tab_title = HTML(tab_title), style = style, 
                  
                  softui::box(title = title, icon = icon, width = 12, ...)
  )
                  
  
}



#'  @rdname box_collection
#'  @param width_nav Width of the menu on the left (bootstrap units)
#'  @param width_boxes Width of the boxes on the right
#'  @export
box_collection <- function(..., 
                          id = NULL,
                          selected = NULL, 
                          title = NULL,
                          width_nav = 3,
                          width_boxes = 9,
                          fill = FALSE,
                          style = ""){
  
  
  items <- list(...)
  n_items <- length(items)
  idnr <- as.character(sample(1000:9999,1))
  
  for(i in seq_along(items)){
    items[[i]] <- items[[i]] %>% tagAppendAttributes(index = i)
  }
  
  atr <- lapply(items, "[[", "attribs")
  
  
  if(is.null(selected)){
    selected <- atr[[1]]$`data-value`
  }
  
  tab_links <- lapply(atr, function(el){
    
    if(is.null(el$class) || el$class != "tab-pane"){
      return(NULL)
    }
    
    cl <- if(el$`data-value` == selected){
      "nav-link active"
    } else {
      "nav-link"
    }
    
    shiny::tags$li(class = "nav-item",
                   shiny::tags$a(class = cl, href = glue::glue("#tab-{idnr}-{el$index}"),
                                 `data-toggle`="tab", 
                                 `data-bs-toggle`="tab", 
                                 `data-value`=el$`data-value`,
                                 el$tab_title
                   )
    )
  })
  
  cont <- lapply(items, function(el){
    
    a <- el$attribs
    shiny::tags$div(class = "tab-pane", 
                    `data-value`=a$`data-value`, 
                    id = glue::glue("tab-{idnr}-{a$index}"),
                    el$children
    )
    
  })
  
  # Add 'active' class to selected tab panel
  vals <- sapply(cont, function(x)x$attrib$`data-value`)
  i_act <- which(vals == selected)
  cont[[i_act]] <- cont[[i_act]] %>% tagAppendAttributes(class = "active")
  
  
  nav_cl <- glue::glue("nav flex-column nav-pills")  #nav-{type} card-header-tabs
  #if(fill)nav_cl <- paste(nav_cl, "nav-fill")
  
  tags$div(class = "row",
    
        shiny::tags$div(class = glue::glue("col-lg-{width_nav}"),
                  
                  shiny::tags$div(class = "card", id = id, style = style,
                                  
                    if(!is.null(title)){
                      tags$div(
                        class = "card-header",
                        tags$h5(class = "card-title", title)
                      )
                    },
                    
                    shiny::tags$div(class = "card-body",
                                    shiny::tags$ul(class = nav_cl,
                                                   `data-tabsetid`= glue::glue("{idnr}"),
                                                   tab_links
                                    )
                    )
                  )
        ),
        shiny::tags$div(class = glue::glue("col-lg-{width_boxes}"),
                    #shiny::tags$div(class = "card-body",
          shiny::tags$div(class = "tab-content", `data-tabsetid` = idnr,
                          cont
          )
                                  
        )
    )
  
}
