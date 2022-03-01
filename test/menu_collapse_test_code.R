
tags$li(
  class = "nav-item",
  
  tags$a(class = "nav-link",
         href = "#shiny-tab-testtab",
         `data-bs-toggle` = "tab",
         `data-bs-target` = "#shiny-tab-testtab",
         `data-target` = "testtab",
         role = "tab",
         
         tags$div(
           class = "icon icon-sm shadow border-radius-md bg-white text-center me-2 d-flex align-items-center justify-content-center",
           tags$span(bsicon("tools"), class = "sidebar-icon")
         ),
         tags$span(class = "nav-link-text ms-1",  "Dit is nog een tab")
  )
),

tags$li(
  class = "nav-item",
  
  tags$a(class = "nav-link",
         href = "#collapseExamples",
         `data-bs-toggle` = "collapse",
         # `data-bs-target` = "#shiny-tab-testtab",
         # `data-target` = "testtab",
         role = "button",
         
         tags$div(
           class = "icon icon-sm shadow border-radius-md bg-white text-center me-2 d-flex align-items-center justify-content-center",
           tags$span(bsicon("tools"), class = "sidebar-icon")
         ),
         
         tags$span(class = "nav-link-text ms-1",  "Collapse tab")
  ),
  
  tags$div(class = "collapse", id = "collapseExamples",
           
           tags$ul(
             class="nav ms-4 ps-3",
             
             tags$li(class="nav-item ", 
                     tags$a(class="nav-link ", 
                            href = "#shiny-tab-minipage1",
                            `data-bs-toggle` = "tab",
                            `data-bs-target` = "#shiny-tab-minipage1",
                            `data-target` = "minipage1",
                            role = "tab",
                            tags$span(class="sidenav-mini-icon", bsicon("box2-heart-fill")),
                            tags$span(class="sidenav-normal", "Kleine pagina")
                     )
             ),
             
             tags$li(class="nav-item ", 
                     tags$a(class="nav-link ", 
                            href = "#shiny-tab-minipage2",
                            `data-bs-toggle` = "tab",
                            `data-bs-target` = "#shiny-tab-minipage2",
                            `data-target` = "minipage2",
                            role = "tab",
                            tags$span(class="sidenav-mini-icon", bsicon("badge-4k-fill")),
                            tags$span(class="sidenav-normal", "Een subpagina")
                     )
             )
             
           )
  )
),