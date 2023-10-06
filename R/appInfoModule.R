#' Content for dropdown with app information
#' @details A shiny module to generate the dropdown with application information such as
#' publication date, git version, name, etc. 
#' @param id Shiny input id
#' @param info Optional - if NULL an object returned by \code{\link{read_application_info}}.
#' @rdname appInfoModule
#' @export
appInfoUI <- function(id,
                      info = NULL
                      ){

  if(is.null(info)){
    info <- read_application_info()
  }
  
  ns <- NS(id)

  info_row <- function(label, content){
    if(is.null(content)){
      NULL
    } else {
      tags$tr(
        tags$td(label, style="font-weight: bold; padding-right: 10px;"),
        tags$td(content)
      )
    }

  }

  release_date <- info$rsconnect$timestamp
  
  if(is.null(release_date)){
    release_date <- info$this_version$appversiondate
  } else {
    release_date <- format(as.Date(as.POSIXct(info$rsconnect$timestamp)))
  }
    
  git_ver <- info$rsconnect$git$sha
  if(is.null(git_ver)){
    git_ver <- info$git$sha
  }

  tags$div(
    tags$img(src = "assets/logo/logoshintolabs.png", 
             width = "100px"),
    tags$div(info$this_version$appname, 
             style = glue::glue("font-size: 1.3em;",
                                "font-weight: 500;",
                                "padding-bottom: 30px;",
                                "padding-top: 20px;")),

    tags$table(style = "width: 100%;",
               info_row("Versie", info$version),
               info_row("Gepubliceerd", release_date),
               info_row("Git", git_ver)
    ),

    htmlOutput(ns("ui_browser_info"), style = "padding-top: 20px;")
  )


}

#' @rdname appInfoModule
#' @export
appInfoModule <- function(input, output, session){

  get_navigator_info(session)
  nav <- reactive(input$navigatorInfo)
  
  output$ui_browser_info <- renderUI({
    bi <- nav()
    req(bi)

    # kopie uit functions_ui voor portability
    bold_table_row <- function(label, content){
      tags$tr(
        tags$td(label, style="font-weight: bold; padding-right: 10px;"),
        tags$td(content)
      )
    }

    tags$table(style = "width: 100%;",
               bold_table_row("Browser", glue::glue("{bi$name} ({bi$version})")),
               bold_table_row("OS", glue::glue("{bi$osname} ({bi$osversion})"))
    )

  })


return(nav)
}




#' Read navigator information and make available as a Shiny input
#' @description When run, input$navigatorInfo is created, a list with lots of info on your system, including
#' Shiny session clientdata (user, url, port, etc.), navigator info (window size, screen size, resolution), and browser
#' info (using bowser.js), version, and platform (win/mac/mobile etc.).
#' @param session The session object.
#' @export
get_navigator_info <- function(session = getDefaultReactiveDomain()){
  session$sendCustomMessage("navigatorInfo", list(id = session$ns("navigatorInfo")))
}




