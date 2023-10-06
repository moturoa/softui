#' A friendly disconnect message
#' @details A wrapper around shinydisconnect::disconnectMessage with Shinto's settings.
#' @export
disconnect_message <- function(msg = "Oeps, er ging iets fout! Herlaad de pagina en probeer het nog een keer."){
  
  requireNamespace("shinydisconnect")
  
  shinydisconnect::disconnectMessage(
    text = msg,
    refresh = "Herladen",
    background = "#FFFFFF",
    colour = "#444444",
    refreshColour = "#337AB7",
    overlayColour = "#000000",
    overlayOpacity = 0.6,
    width = 450,
    top = 50,
    size = 22,
    css = ""
  )  
  
}

