% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fluid_page.R
\name{fluid_page}
\alias{fluid_page}
\alias{fluid_row}
\title{Content container}
\usage{
fluid_page(...)

fluid_row(..., margin = 4)
}
\arguments{
\item{margin}{Margin unitsm for elements placed in the row. Optimized for \code{softui::box}es next to each other.}
}
\description{
Make layout for the content on a page or in a \code{softui::box} with \code{fluid_page} and \code{fluid_row}.
A fluid page can have multiple \code{fluid_row}'s, and each \code{fluid_row} contains \code{column()}'s.
}
\examples{
# content in e.g. a box
fluid_page(
  fluid_row(
    column(6, "Left column"),
    column(6, "Right column")
  )
)

# page layout with boxes.
ui <- softui::simple_page(  # simple_page also uses fluid_page!
softui::fluid_row(
  # option 1: use column width; the box will fill the column
  column(6,  
         softui::box(
           title = "Box 1", icon = bsicon("archive-fill", status = "warning"),
           tag = "data",
           plotOutput("plot1", height = 400)
         )
  ),
  # option 2: use the box width directly
  softui::box(width = 6,  
              title = "Box 2", icon = bsicon("boombox-fill", status = "success"),
              tag = "plot",
              plotOutput("plot2", height = 400)
  )
),
softui::fluid_row(
  column(8,
         softui::box(
           title = "Box 3",
           tag = "info",
           tag_status = "info",
           plotOutput("plot2", height = 200)
         )  
         # place more boxes here to make sure they are in the same column.
  ),
  column(4,
         softui::box(
           title = "Box 4",
           tag = "info",
           tag_status = "info",
           plotOutput("plot2", height = 200)
         )
  )
)
)

shinyApp(ui,function(){})
}
