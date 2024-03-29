% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/menu_item.R
\name{menu_item}
\alias{menu_item}
\alias{menu_subitem}
\alias{menu_link}
\title{Sidebar menu items}
\usage{
menu_item(
  text,
  ...,
  icon = bsicon("bar-chart-fill"),
  tabName = NULL,
  separator_above = FALSE,
  separator_below = FALSE,
  id = NULL
)

menu_subitem(text, tabName, id = NULL)

menu_link(tabName, icon, text)
}
\arguments{
\item{text}{Title of the menu item}

\item{\dots}{Any number of \code{menu_subitem}'s to appear under this menu item.}

\item{icon}{Icon (made with \code{bsicon}) for the menu item. No icon can be provided for \code{menu_subitem}.}

\item{tabName}{Name of the tab. Must be provided, except when the \code{menu_item} has \code{menu_subitem}'s.}

\item{separator_above}{Add a separator above this menu item}

\item{separator_below}{Add a separator below this menu item}

\item{id}{Id of the \code{li} tag (optional, can be used to remove the item with \code{shinyjs::hide('id')}}
}
\description{
Functions to make menu items in the sidebar menu. See \code{?sidebar_menu}
}
