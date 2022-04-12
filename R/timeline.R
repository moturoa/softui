#' Softui Timeline
#' @export
#' @rdname timeline
timeline <- function(...){
  
  tags$div(class="timeline timeline-one-side", `data-timeline-axis-style` = "dotted", 
           
      ...
           
  )
  
}

#' Softui Timeline
#' @export
#' @rdname timeline
timeline_block <- function(title, timestamp, text = "", 
                           icon_name = "bell-fill",
                           icon_status = c("primary","secondary","info","success","danger","warning","light","dark"),
                           badge_text = NULL, 
                           badge_status = c("primary","secondary","info","success","danger","warning","light","dark")){
  
  badge_status <- match.arg(badge_status)
  icon_status <- match.arg(icon_status)
  
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


