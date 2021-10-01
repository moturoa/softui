

sidebar_menu <- function(..., id = NULL, .list = NULL){

  items <- c(list(...), .list)

  items[[1]]$children[[1]] <- htmltools::tagAppendAttributes(items[[1]]$children[[1]], class = "show active")

  tags$div(class="collapse navbar-collapse  w-auto h-auto max-height-vh-100 h-100",
           id="sidenav-collapse-main",

           tags$ul(
             class = "navbar-nav sidebar-menu nav navtabs",
             role = "tablist",
             items
           )
  )




}


menu_item <- function(text, ..., icon = bsicon("bar-chart-fill"),
                      tabName = NULL){

  tabref <- glue::glue("#shiny-tab-{tabName}")

   tags$li(
     class = "nav-item",

     tags$a(class = "nav-link",
            href = tabref,
            `data-bs-toggle` = "tab",
            `data-bs-target` = tabref,
            `data-target` = tabName,
            role = "tab",

            tags$div(
              class = "icon icon-sm shadow border-radius-md bg-white text-center me-2 d-flex align-items-center justify-content-center",
              tags$span(icon, class = "sidebar-icon")
            ),
            tags$span(class = "nav-link-text ms-1",  text)
     )
   )


}



