
#' Simple wrapper around virtualSelectInput
#' @description Wrapper around [shinywidgets::virtualSelectInput()] with Dutch 
#' language settings and a better default for the z-index. 
#' @param inputId Shiny input ID
#' @param label Label above the select input
#' @param choices Vector or list, see [shinywidgets::prepare_choices()] for 
#' more advanced setting of choices in this select input (descriptions, grouping).
#' @param search If TRUE, adds a search menu above the choices (default TRUE)
#' @param \dots More arguments to [shinywidgets::virtualSelectInput()]
#' @export
#' @importFrom shinyWidgets virtualSelectInput
virtual_select_input <- function(inputId, label, choices, 
                                 search = TRUE, 
                                 hideClearButton = FALSE,
                                 placeholder = "Maak selectie ...",
                                 noOptionsText = "Geen keuze mogelijk",
                                 noSearchResultsText = "Geen resultaten",
                                 selectAllText = "Selecteer alles",
                                 searchPlaceholderText = "Zoeken ...",
                                 optionsSelectedText = "Geselecteerd",
                                 allOptionsSelectedText = "Alles geselecteerd",
                                 ...){
  
  shinyWidgets::virtualSelectInput(inputId, label, choices, search = search, ..., 
    hideClearButton = hideClearButton,
    placeholder = placeholder,
    noOptionsText = noOptionsText,
    noSearchResultsText = noSearchResultsText,
    selectAllText = selectAllText,
    searchPlaceholderText =searchPlaceholderText,
    optionsSelectedText = optionsSelectedText,
    allOptionsSelectedText = allOptionsSelectedText)
  
}
