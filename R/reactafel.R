#' Reactable, with NL and softui / Bootstrap 5.1 specific settings.
#' @param \dots Further arguments to `reactable`, especially a dataframe as first argument (unnamed). 
#' @param pageLength Number of rows to show 
#' @param rownames Default FALSE, suppresses row names.
#' @param ordering Default TRUE, whether to allow column ordering 
#' @export
#' @importFrom reactable reactable 
reactafel <- function (..., 
                        wrap = FALSE,
                        striped = TRUE,
                        resizable = TRUE, 
                        pageLength = 10, 
                        rownames = FALSE, 
                        ordering = TRUE ) 
{
  
  reactable::reactable(...,
                       defaultPageSize = pageLength,
                       sortable = ordering,
                       rownames = rownames,
                       wrap = wrap,
                       resizable = resizable,  
                       language = reactableLang(
                         sortLabel = "Sorteer {name}",
                         filterPlaceholder = "",
                         filterLabel = "Filter {name}",
                         searchPlaceholder = "Zoek",
                         searchLabel = "Zoek",
                         noData = "Geen resultaten",
                         pageNext = "Volgende",
                         pagePrevious = "Vorige",
                         pageNumbers = "{page} van {pages}",
                         pageInfo = "{rowStart} tot {rowEnd} van {rows} rijen",
                         pageSizeOptions = "Show {rows}",
                         pageNextLabel = "Volgende pagina",
                         pagePreviousLabel = "Vorige pagina",
                         pageNumberLabel = "Pagina {page}",
                         pageJumpLabel = "Ga naar pagina",
                         pageSizeOptionsLabel = "Rijen per pagina",
                         groupExpandLabel = "Toggle groep",
                         detailsExpandLabel = "Toggle details",
                         selectAllRowsLabel = "Selecteer alle rijen", 
                         selectRowLabel = "Selecteer rij" 
                       )
  )
}