% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/show_news_modal.R
\name{show_version_news_modal}
\alias{show_version_news_modal}
\title{Show modal with NEWS}
\usage{
show_version_news_modal(
  previous_version = NULL,
  category = NULL,
  changes_since = c("last", "all"),
  session = shiny::getDefaultReactiveDomain(),
  header_label = list(all = "Alle wijzigingen in deze applicatie.", previous =
    tagList(tags$p("Er zijn wijzigingen sinds je laatste login!"),
    tags$p(HTML("Alle nieuwsberichten lezen? Klik op <i class='bi-stars'></i> in de balk rechtsboven."))))
)
}
\arguments{
\item{previous_version}{Show news since this software version (leave blank if changes_since = 'all')}

\item{category}{Name of category to filter by (e.g. gemeente in WBM)}

\item{changes_since}{Either 'last' (show news since previous_version) or 'all' to show all news}

\item{header_label}{List with components 'all' and 'previous' with UI to place above the news table}
}
\description{
Show modal with NEWS
}
