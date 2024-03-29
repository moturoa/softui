% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dashboard_sidebar.R
\name{dashboard_sidebar}
\alias{dashboard_sidebar}
\alias{sidebar_menu}
\title{Sidebar menu}
\usage{
dashboard_sidebar(menu, ui_above = NULL, ui_below = NULL)

sidebar_menu(..., id = NULL, .list = NULL)
}
\arguments{
\item{\dots}{\code{menu_item}'s}

\item{id}{Id for the sidebar, currently unused}

\item{.list}{Further \code{menu_item}'s can be passed as a list instead of in \dots.}
}
\description{
Sidebar menu
}
\details{
Use in a \code{dashboard_page} (see Example there). Accepts only \code{menu_item} and \code{menu_subitem}
}
