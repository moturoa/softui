#' Softui Timeline
#' @details The `timeline` function makes a timeline consisting of `timeline_block`'s
#' @export
#' @rdname timeline
#' @examples
#' 
#' timeline(
#'   timeline_block("Geboorte", "1956-6-1", icon_name = "bell-fill", icon_status = "success",
#'                text = shinipsum::random_text(nwords=20)),
#'   timeline_block("Gebeurtenis 1", "1970-1-6", icon_name = "bag-fill", icon_status = "info",
#'                text = shinipsum::random_text(nwords=20)),
#'   timeline_block("Gebeurtenis 2", "2002-6-1", icon_name = "bandaid-fill", icon_status = "warning",
#'                text = shinipsum::random_text(nwords=20)),
#'   timeline_block("Gebeurtenis 3", "2014-7-15", icon_name = "chat-fill", icon_status = "primary",
#'                text = shinipsum::random_text(nwords=20)),
#'   timeline_block("Overlijden", "2021-4-1", icon_name = "hourglass-bottom", icon_status = "danger",
#'                text = shinipsum::random_text(nwords=20))
#' )
timeline <- function(...){
  
  tags$div(class="timeline timeline-one-side", `data-timeline-axis-style` = "dotted", 
           
      ...
           
  )
  
}

#' Softui Timeline
#' @param title Title for the timeline block
#' @param timestamp Date or time for the block (format yourself!)
#' @param text More text to describe the block
#' @param icon_name Name of the `bsicon` for this block (character)
#' @param icon_status color of the icon (see `?valid_statuses`)
#' @param badge_text Text for a badge to appear at the bottom of the timeline block
#' @param badge_status Status color for the badge (see `?valid_statuses`)
#' @export
#' @rdname timeline
timeline_block <- function(title, timestamp, text = "", 
                           icon_name = "bell-fill",
                           icon_status = "primary",
                           badge_text = NULL, 
                           badge_status = "success"){
  
  
  validate_status(icon_status)
  validate_status(badge_status)
  
  tags$div(class="timeline-block mb-3",
        tags$span(class="timeline-step",
          #tags$i(class="ni ni-bell-55 text-success text-gradient"),
          bsicon(icon_name, class = glue("text-{icon_status} text-gradient"))
        ),
        tags$div(class="timeline-content",
            tags$h6(class="text-dark text-sm font-weight-bold mb-0", title),
            tags$p(class="text-secondary font-weight-bold text-xs mt-1 mb-0", timestamp),
            tags$p(class="text-sm mt-3 mb-2", text),
            
            if(!is.null(badge_text)){
              tags$span(class="badge badge-sm bg-gradient-{badge_status}", badge_text)
            }
        )
  )
}


