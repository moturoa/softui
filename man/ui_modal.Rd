% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ui_modal.R
\name{ui_modal}
\alias{ui_modal}
\alias{modal_action_button}
\alias{modal_action_link}
\title{UI-side Modal}
\usage{
ui_modal(id, ..., ns = function(x) x)

modal_action_button(inputId = uuid::UUIDgenerate(), modalId, ...)

modal_action_link(inputId = uuid::UUIDgenerate(), modalId, ...)
}
\arguments{
\item{id}{Id of the modal, corresponds to \code{modalId} in \code{modal_action_button}}

\item{\dots}{Further arguments passed to \code{\link[=modal]{modal()}}}

\item{ns}{Namespace function; pass the \code{ns} function of the Shiny UI module you are working in.}

\item{inputId}{Id of the modal action button; not actually important unless the button also
has other side effects besides opening this modal.}
}
\description{
Persistent UI-side modal. Inputs do not reset every time the modal opens
as with a normal \code{shiny::modalDialog}. Make the modal in the UI, together with a modal button
that opens the modal. It is not possible to open this modal with \code{\link[=showModal]{showModal()}}!
}
\examples{
\dontrun{
ui <- softui::simple_page(

modal_action_button("btn1", modalId = "modal_car_select", 
                   label = "Select cars", icon = bsicon("filter"), status = "info"),
ui_modal(
 title = "UI-side modal",
 id = "modal_car_select",
 selectInput("sel1", "Cars", choices = rownames(mtcars))
)

)
server <- function(input, output, session) {}
shinyApp(ui, server)
}
}
