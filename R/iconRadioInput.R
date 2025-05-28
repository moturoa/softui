#' Input modality like radio buttons-functionality with icons in the circles
#' @description Radio buttons-functionality with icons in the circles
#' @param inputId input ID for element so shiny can distinguish between them
#' @param choices Vector with choice-names
#' @param labels Vector with labels for beneath the icon-buttons
#' @param icons Vector with bootstrap icons so `softui::bsicon` can call them
#' @param default_choice Optional default choice which is selected initially
#' @export


iconRadioInput <- function(inputId, choices, labels, icons, default_choice = NULL) {
  
  htmltools::tagList(
    shiny::tags$div(
      class = "icon-radio-input",
      id = inputId,
      `data-default` = default_choice,
      lapply(seq_along(choices), function(i) {
        shiny::tags$div(
          class = "icon-radio-option",
          `data-value` = choices[i],
          # Circle with icon ONLY
          shiny::tags$div(class = "radio-icon-circle",
                   softui::bsicon(icons[i])
          ),
          # Label BELOW the circle
          shiny::tags$div(class = "radio-label", labels[i])
        )
      })
    )
  )
}
