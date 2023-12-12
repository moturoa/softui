
#' Formatted table of properties
#' @param data A dataframe with one row. 
#' @param full_width If TRUE, fills the container 100%
#' @param show_na if TRUE, NA values are shown. If FALSE, rows with a value NA are not shown
#' @param bold_property Whether the property column is in bold font (default)
#' @param css_property CSS for the 'property' column in the table
#' @param css_value CSS for the 'value' column in the table
#' @description Each column in `data` will be a row in this table, with the column name
#' **bold** in the left column, and the value in the right column.
#' @details Replaces old function `bold_table_row` in use in many applications.
#' @export
#' @importFrom kableExtra kbl kable_styling column_spec
#' @importFrom htmltools HTML
#' @examples
#' 
#' # Use tibble() instead of data.frame() so the names do not get changed:
#' property_table(tibble::tibble(Kenmerk = "groot huis", Postcode = "123AB", `Aantal inwoners` = 2),
#' full_width = FALSE)
property_table <- function(data, full_width = TRUE, show_na = TRUE,
                           bold_property = TRUE,
                           css_property = "font-size: 1.1em;",
                           css_value = "font-size: 1.0em;"
){
  
  stopifnot(nrow(data) == 1)
  if(show_na){
    res <- t(data) %>% as.data.frame()
  } else {
    res <- t(data) %>% as.data.frame() %>% setNames("value") %>% dplyr::filter(!is.na(value), !is.null(value), value != "null")
  }
  
  res %>%
    kableExtra::kbl(col.names = NULL) %>% 
    kableExtra::kable_styling("hover", full_width = full_width) %>%
    kableExtra::column_spec(1, bold = bold_property, extra_css = css_property) %>%
    kableExtra::column_spec(2, bold = FALSE, extra_css = css_value) %>%
    htmltools::HTML(.)
  
}






