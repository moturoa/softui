#' Softui Timeline
#' @details The `timeline` function makes a timeline consisting of `timeline_block`'s.
#' Use the `timeline_from_data` function to make a timeline from a dataframe. Can be used in a `uiOutput`.
#' @export
#' @rdname timeline
#' @importFrom shinipsum random_text
#' @importFrom tibble tribble
#' @examples
#' 
#' # Manual timeline
#' # (only works in a softui page!)
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
#' 
#' # Timeline from dataframe
#' time_data <- tibble::tribble(
#'    ~timestamp, ~title, ~text, ~icon_name, ~icon_status, 
#'    "1956-6-1","Geboorte", shinipsum::random_text(nwords=20),"bell-fill","success",
#'    "1970-1-6","Gebeurtenis 1",shinipsum::random_text(nwords=20),"bag-fill", "info",
#'    "2002-6-1","Gebeurtenis 2",shinipsum::random_text(nwords=20),"bandaid-fill", "warning",
#'    "2014-7-15","Gebeurtenis 3",shinipsum::random_text(nwords=20),"chat-fill", "primary",
#'    "2021-4-1", "Overlijden",shinipsum::random_text(nwords=20), "hourglass-bottom", "danger"
#'  )
#'  timeline_from_data(time_data)
timeline <- function(..., .list = NULL){
  
  items <- c(list(...), .list)
  
  shiny::tags$div(class="timeline timeline-one-side", `data-timeline-axis-style` = "dotted", 
           
      items
           
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
  
  shiny::tags$div(class="timeline-block mb-3",
        shiny::tags$span(class="timeline-step",
          #shiny::tags$i(class="ni ni-bell-55 text-success text-gradient"),
          bsicon(icon_name, class = glue::glue("text-{icon_status} text-gradient"))
        ),
        shiny::tags$div(class="timeline-content",
            shiny::tags$h6(class="text-dark text-sm font-weight-bold mb-0", title),
            shiny::tags$p(class="text-secondary font-weight-bold text-xs mt-1 mb-0", timestamp),
            shiny::tags$p(class="text-sm mt-3 mb-2", text),
            
            if(!is.null(badge_text)){
              shiny::tags$span(class="badge badge-sm bg-gradient-{badge_status}", badge_text)
            }
        )
  )
}


#' @rdname timeline
#' @param data A dataframe with columns: "timestamp","title","text","icon_name","icon_status"
#' @export
timeline_from_data <- function(data){

  validate_timeline_data(data)
  
  data <- data %>% 
    dplyr::rowwise() %>%
    dplyr::mutate(block = list(timeline_block(.data$title, 
                                       .data$timestamp, 
                                       .data$text, 
                                       .data$icon_name, 
                                       .data$icon_status)))
  
  timeline(.list = data$block)
}


validate_timeline_data <- function(data){
  
  nms <- c("timestamp","title","text","icon_name","icon_status")
  if(!all(nms %in% names(data))){
    
    stop(paste("Must provide dataframe with columns:", paste(nms, collapse=", ")))
    
  }
  
  # validate status kolom hier...
  
}



