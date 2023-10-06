

#' Read the NEWS.md file and maybe filter by category (tenant)
#' @importFrom dplyr filter
#' @export
read_application_news <- function(category = NULL, min_version = NULL, news_file = "NEWS.md"){
  
  if(!file.exists(news_file)){
    stop("Make a NEWS.md file first (see WBM, Apollo)")
  }
  
  data <- tools:::.build_news_db_from_package_NEWS_md(news_file)
  
  if(!is.null(category)){
    data <- dplyr::filter(data, Category =="" | grepl(category, Category))
  }
  
  if(!is.null(min_version)){
    data <- dplyr::filter(data, Version > !!min_version)
  }
  
  data
}

#' @importFrom reactable reactable
render_news_table <- function(data){
  
  # Do not show the same version twice
  data$Version[duplicated(data$Version)] <- ""
  
  data |> 
    dplyr::select(Versie = Version, Nieuws = HTML) |> 
    reactable::reactable(columns = list(
      Nieuws = colDef(html = TRUE),
      Versie = colDef(maxWidth = 100)
    ), searchable = TRUE, defaultPageSize = 5)
  
}

#' Read software version from VERSION
#' @export
get_application_version <- function(){
  
  fn <- "VERSION"
  if(!file.exists(fn)){
    ""
  } else {
    trimws(readLines(fn)[1])
  }
  
}

#' Shiny module to show all software news for a tenant
#' @export
#' @rdname tenantNewsModule
tenantNewsModuleUI <- function(id){
  
  ns <- shiny::NS(id)
  
  shiny::tags$div(
    class = "dropdown",
    shiny::actionLink(ns("lnk_show_all_news"), 
               class = "nav-link", bsicon("stars"))
  )
  
}

#' @export
#' @rdname tenantNewsModule
tenantNewsModule <- function(input, output, session, category = NULL){
  
  observeEvent(input$lnk_show_all_news, {
    show_version_news_modal(changes_since = "all", category = category)
  })
  
}

#' Show modal with NEWS
#' @param previous_version Show news since this software version (leave blank if changes_since = 'all')
#' @param category Name of category to filter by (e.g. gemeente in WBM)
#' @param changes_since Either 'last' (show news since previous_version) or 'all' to show all news
#' @param header_label List with components 'all' and 'previous' with UI to place above the news table
#' @export
show_version_news_modal <- function(previous_version = NULL, 
                                    category = NULL,
                                    changes_since = c("last","all"),
                                    session = shiny::getDefaultReactiveDomain(),
                                    
                                    header_label = list(
                                      all = "Alle wijzigingen in deze applicatie.",
                                      previous = tagList(
                                        tags$p("Er zijn wijzigingen sinds je laatste login!"),
                                        tags$p(HTML("Alle nieuwsberichten lezen? Klik op <i class='bi-stars'></i> in de balk rechtsboven."))
                                      )
                                    )
                                    
                                    ){
  
  
  changes_since <- match.arg(changes_since)
  
  data <- if(changes_since == "all"){
    read_application_news(category = category)  
  } else {
    read_application_news(category = category, 
                          min_version = previous_version)
  }
  
  if(nrow(data) == 0){
    message("No news to show in softui::show_version_news_modal")
    return(NULL)
  }
  
  header <- if(changes_since == "all"){
    header_label$all
  } else {
    header_label$previous
  }
  
  showModal(
    softui::modal(
      title = tagList(bsicon("stars"), "Nieuws"), 
      size = "l", close_button = FALSE, easyClose = FALSE,
      
      header,
      
      render_news_table(data)
    )
  )
  
}
