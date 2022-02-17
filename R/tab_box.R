



#'Tab panels
#'@export
#'@rdname tabbox
tab_panel <- function(title = "", ..., value = title, icon = NULL, style = ""){

  if(!is.null(icon)){
    tab_title <- paste(icon, title)
  } else {
    tab_title <- title
  }

  tags$div(class = "tab-pane", `data-value` = value, tab_title = HTML(tab_title), style = style, ...)

}

#'@export
#'@param id Optional id for the tab_box
#'
#'@rdname tabbox
tab_box <- function(..., 
                    id = NULL,
                    selected = NULL, 
                    width = 12,
                    fill = FALSE){

  
  type <- "pills"
  
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

  lis <- lapply(atr, function(el){

    cl <- if(el$`data-value` == selected){
      "nav-link active"
    } else {
      "nav-link"
    }

    tags$li(class = "nav-item",
            tags$a(class = cl, href = glue::glue("#tab-{idnr}-{el$index}"),
                   `data-toggle`="tab", 
                   `data-bs-toggle`="tab", 
                   `data-value`=el$`data-value`,
                   el$tab_title
                   )
    )
  })

  cont <- lapply(items, function(el){

    a <- el$attribs
    tags$div(class = "tab-pane", `data-value`=a$`data-value`, id = glue::glue("tab-{idnr}-{a$index}"),
             el$children
             )

  })

  vals <- sapply(cont, function(x)x$attrib$`data-value`)
  i_act <- which(vals == selected)
  cont[[i_act]] <- cont[[i_act]] %>% tagAppendAttributes(class = "active")


  nav_cl <- glue::glue("nav nav-{type} card-header-tabs")
  if(fill)nav_cl <- paste(nav_cl, "nav-fill")


  tags$div(class = glue::glue("col-lg-{width}"),
              
    tags$div(class = "card", id = id,
      tags$div(class = "card-header",
        tags$ul(class = nav_cl,
                `data-tabsetid`= glue::glue("{idnr}"),
                lis
        )
      ),
      tags$div(class = "card-body",
            tags$div(class = "tab-content", `data-tabsetid` = idnr,
                     cont
            )

      )

    )
  )

}


