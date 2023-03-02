#' Datatable, with NL and softui / Bootstrap 5.1 specific settings.
#' @param \dots Further arguments to `datatable`, especially a dataframe as first argument (unnamed).
#' @param dom DOM elements for the datatable ("t" for just the table)
#' @param pageLength Number of rows to show
#' @param escape Default TRUE, allow HTML content in the table
#' @param rownames Default FALSE, suppresses row names.
#' @param ordering Default TRUE, whether to allow column ordering
#' @param extensions Default 'Responsive' to show long rows in a collapsible.
#' @param selection Rows to select (single or multiple)
#' @param scrollX If TRUE, allows scrolling for very wide tables (then set extensions = NULL!)
#' @param options Passed to datatable `options` argument
#' @param class Datatable CSS classes.
#' @export
#' @importFrom DT datatable
datatafel <- function (..., dom = "frtip", pageLength = 10, escape = FALSE, 
          rownames = FALSE, ordering = TRUE, extensions = "Responsive", 
          selection = "single", scrollX = FALSE, options = list(),
          lengthChange = FALSE, default_style="bootstrap4",
          class = "row-border hover") 
{
  DT::datatable(..., 
                escape = escape, 
                rownames = rownames, 
                selection = selection, 
                extensions = extensions, 
                class = class,
                style = default_style, 
                options = c(options, list(dom = dom, ordering = ordering, 
                             lengthChange = lengthChange, 
                             pageLength = pageLength, 
                             language = list(search = "Zoek", 
                                             emptyTable = "Geen resultaten.", 
                                             zeroRecords = "Geen resultaten.", 
                                             info = "Tonen _START_ tot _END_ van _TOTAL_ rijen.", 
                                             infoFiltered = "(gefilterd uit _MAX_ rijen)", 
                                             infoEmpty = "Geen resultaten.", 
                                             paginate = list(first = "Eerste", 
                                                             last = "Laatste", 
                                                             `next` = as.character(softui::bsicon("arrow-right")), 
                                                             previous = as.character(softui::bsicon("arrow-left"))))), 
                            list(scrollX = scrollX)))
}
