
add_softui_dependencies <- function(tag){


  deps <- list(
    
    
    htmltools::htmlDependency(
      name = "bootstrap51",
      version = "0.1",
      src = c(file = "bs51"),
      stylesheet = "bootstrap.min.css",
      package = "softui"
    ),
    htmltools::htmlDependency(
      name = "soft-ui-dashboard-css",
      version = "0.1",
      src = c(file = "assets/css"),
      # script = ,
      stylesheet = "soft-ui-dashboard.css",
      package = "softui"
    ),
    htmltools::htmlDependency(
      name = "soft-ui-dashboard-js",
      version = "0.1",
      src = c(file = "assets/js"),
      script = "soft-ui-dashboard.js",
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
    # htmltools::htmlDependency(
    #   name = "popper",
    #   version = "1.0",
    #   src = c(file = "assets/js/core"),
    #   script = "popper.min.js",
    #   #stylesheet = ,
    #   package = "softui"
    # ),
    htmltools::htmlDependency(
      name = "perfectscrollbar",
      version = "0.1",
      src = c(file = "assets/js/plugins"),
      script = "perfect-scrollbar.min.js",
      #stylesheet = ,
      package = "softui"
    ),

    htmltools::htmlDependency(
      name = "softuiextra",
      version = "0.1",
      src = c(file = "softuiextra"),
      script = "softuiextra.js",
      stylesheet = "softuiextra.css",
      package = "softui"
    ),
    
    
    # 
    # htmltools::htmlDependency(
    #   name = "softuibindings",
    #   version = "0.1",
    #   src = c(file = "softuibindings"),
    #   script = "bindings.js",
    #   package = "softui"
    # ),
    
    htmltools::htmlDependency(name = "clock", version = "0.1",
                              package = "softui",
                              src = "assets",
                              script = "clock/clock.js"
    )


  )

  shiny::tagList(tag, deps)


}


