

#' Softui Dependency for the UI
#' @description When not using softui::dashboard_page, still load the dependencies.
#' Place this in your main UI : softui::softui_dependencies()
#' @examples
#' ui <- softui::fluid_page(
#'   softui::softui_dependencies(),
#'   softui::box(title = "Hallo")
#' )
#' @export
softui_dependencies <- function(){
  
  add_softui_dependencies(shiny::tags$div())
  
}



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
    htmltools::htmlDependency(
      name = "popper",
      version = "1.0",
      src = c(file = "assets/js/core"),
      script = "popper.min.js",
      #stylesheet = ,
      package = "softui"
    ),
    htmltools::htmlDependency(
      name = "perfectscrollbar",
      version = "0.1",
      src = c(file = "assets/js/plugins"),
      script = "perfect-scrollbar.min.js",
      package = "softui"
    ),
    htmltools::htmlDependency(
      name = "fontawesomesvg",
      version = "0.1",
      src = c(file = "fontawesome"),
      script = "42d5adcbca.js",
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
    htmltools::htmlDependency(
      name = "clicksystem", version = "0.1",
      package = "softui",
      src = c(file = "clicksystem"),
      script = "click.js",
      stylesheet = "click.css"
    ),
    htmltools::htmlDependency(
      name = "clock", version = "0.1",
      package = "softui",
      src = "assets",
      script = "clock/clock.js"
    ),
    htmltools::htmlDependency(
      name = "bootstrapicons",
      version = "1.10.3",   # downloaded 2023/1/31
      src = c(file = "bootstrap_icons"),
      stylesheet = "bootstrap-icons.css",
      package = "softui"
    ),
    htmltools::htmlDependency(
      name = "icofont",
      version = "0.1",   # downloaded 2022/2/1
      src = c(file = "icofont"),
      stylesheet = "icofont.min.css",
      package = "softui"
    ),
    htmltools::htmlDependency(
      name = "opensans",
      version = "1.0",   # downloaded 2022/2/25
      src = c(file = "opensans"),
      stylesheet = "opensans.css",
      package = "softui"
    )
  )

  shiny::tagList(tag, deps)


}


# runtime package UI dependencies (curated list of always-used packages)
# adds JS,CSS deps.
package_ui_dependencies <- function(busybar_color, disconnect_message){
  
  htmltools::tagList(
    shinyjs::useShinyjs(),
    
    # info popups
    shinytoastr::useToastr(),
    
    # tooltips
    prompter::use_prompt(),
    
    # Loading bar, loading screen
    shinybusy::add_busy_bar(color = busybar_color, height = "6px"),
    
    # custom disconnect message
    disconnect_message(disconnect_message)
  )
  
}

