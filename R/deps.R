

add_softui_dependencies <- function(tag){


  deps <- list(
    htmltools::htmlDependency(
      name = "soft-ui-dashboard-css",
      version = "0.1",
      src = c(file = "assets/css"),
      # script = ,
      stylesheet = "soft-ui-dashboard.min.css",
      package = "softui"
    ),
    htmltools::htmlDependency(
      name = "soft-ui-dashboard-js",
      version = "0.1",
      src = c(file = "assets/js"),
      script = "soft-ui-dashboard.min.js",
      #stylesheet = ,
      package = "softui"
    ),
    htmltools::htmlDependency(
      name = "bootstrap5-js",
      version = "5.1.0",
      src = c(file = "assets/js/core"),
      script = "bootstrap.bundle.min.js",
      #stylesheet = ,
      package = "softui"
    ),
    htmltools::htmlDependency(
      name = "shinydashboard",
      version = "0.1",
      src = c(file = "shinydashboard"),
      script = "shinydashboard.js",
      #stylesheet = ,
      package = "softui"
    ),
    htmltools::htmlDependency(
      name = "softuiextra",
      version = "0.1",
      src = c(file = "softuiextra"),
      #script = "shinydashboard.js",
      stylesheet = "softuiextra.css",
      package = "softui"
    )
    # htmltools::htmlDependency(
    #   name = "popper-js",
    #   version = "0.1",
    #   src = c(file = "assets/plugins"),
    #   script = "perfect-scrollbar.min.js",
    #   #stylesheet = ,
    #   package = "softui"
    # )


  )

  tagList(tag, deps)


}


