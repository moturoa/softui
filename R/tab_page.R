

#'@export
tab_page <- function(..., 
                    id = NULL,
                    selected = NULL, 
                    width = 12,
                    fill = FALSE,
                    ui_above_nav = NULL,
                    ui_below_nav = NULL,
                    style = ""){
  
  
  type <- "pills"  # want tabs is lelijk hier
  
  items <- dropNulls(list(...))
  n_items <- length(items)
  idnr <- as.character(sample(1000:9999,1))  # andere random ID's werken niet altijd (iets met BS5).
  
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
  
  
  nav_cl <- glue::glue("nav nav-{type} card-header-tabs")
  if(fill)nav_cl <- paste(nav_cl, "nav-fill")
  
  shiny::tags$div(class = glue::glue("col-lg-{width}"),
                  
                  shiny::tags$div(class = "card", id = id, style = paste(style,"margin: 1rem; padding: 0.5rem;"),
                  
                        shiny::tags$div(class = "card-header",
                                        ui_above_nav,
                                        shiny::tags$ul(class = nav_cl,
                                                       `data-tabsetid` = glue::glue("{idnr}"),
                                                       tab_links
                                        )
                        )
                  ),
                  shiny::tags$div(class = "card-body",
                    ui_below_nav,
                    shiny::tags$div(class = "tab-content", `data-tabsetid` = idnr,
                                    cont
                    )
                  )
  )
  
}
