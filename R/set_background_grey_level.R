#' Set body background grey level for higher contrast
#' @param level 100, 200, 300, etc.
#' @export
#' @rdname background_grey
set_background_grey_level <- function(level, session = shiny::getDefaultReactiveDomain()){
  
  if(!level %in% seq(100,900,by=100)){
    stop("Level must be between 100, 900, in steps of 100")
  }
  
  session$sendCustomMessage("setBodyGreyLevel", list(level = as.character(level)))
  
}


#' @export
#' @rdname background_grey
setContrastMenuUI <- function(id){
  
  ns <- shiny::NS(id)
  
  dropdown_item(bsicon("circle-half"), 
                header = "Contrast",
                tags$p("Maak de achtergrond donkerder voor hoger contrast:"),
                shiny::sliderInput(ns("slide_bg_grey"), NULL, value = 100, step = 100, min = 100, max = 500),
                align_right = TRUE
  )  
}

#' @export
#' @rdname background_grey
setContrastMenu <- function(input, output, session){
  
  observeEvent(input$slide_bg_grey, {
    set_background_grey_level(input$slide_bg_grey)
  })
  
}


