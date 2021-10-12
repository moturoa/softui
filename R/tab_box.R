

if(FALSE){
HTML('    <div class="card">
      <div class="card-header">
        <ul class="nav nav-tabs card-header-tabs" data-tabsetid="8986">
          <li class="nav-item">
            <a href="#tab-8986-1" data-toggle="tab" data-bs-toggle="tab" data-value="Een" class="nav-link active"><i class=\'bi-house\' role=\'presentation\' aria-label=\'house icon\'></i> Een</a>
          </li>
          <li class="nav-item">
            <a href="#tab-8986-2" data-toggle="tab" data-bs-toggle="tab" data-value="Twee" class="nav-link">Twee</a>
          </li>
        </ul>
      </div>
      <div class="card-body">
        <div class="tab-content" data-tabsetid="8986">
          <div class="tab-pane active" data-value="Een" id="tab-8986-1">Content</div>
          <div class="tab-pane" data-value="Twee" id="tab-8986-2">Meer content</div>
        </div>
      </div>
    </div>')

}






tab_item <- function(title = "", ..., value = title, icon = NULL){

  if(!is.null(icon)){
    tab_title <- paste(icon, title)
  } else {
    tab_title <- title
  }

  tags$div(class = "tab-pane", `data-value` = value, tab_title = HTML(tab_title), ...)

}

tab_box <- function(..., selected = NULL){

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
                   `data-toggle`="tab", `data-bs-toggle`="tab", `data-value`=el$`data-value`,
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

  tags$div(class = "card",
    tags$div(class = "card-header",
      tags$ul(class = "nav nav-tabs card-header-tabs",
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

}


if(FALSE){


tab_box(
  tab_item("Een", tags$p("content"), icon = icon("home")),
  tab_item("Twee", tags$p("meer content"))
)




items <- tagList(
  tab_item("Een", tags$p("content"), icon = icon("home")),
  tab_item("Twee", tags$p("meer content"))
)

for(i in seq_along(items)){

  items[[i]] <- items[[i]] %>%
    tagAppendAttributes(id = paste0("999-",i))
}


tg <- htmltools::tagQuery(items)

tg$find(".tab-pane")$find("[data-value]")



tab_box <- function(..., id = NULL){

  bslib2::navs_tab_card(

    ...
  )

}

}

