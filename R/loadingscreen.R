#' A loading screen for Shinto applications
#' @param time Loading time (seconds)
#' @export
loadingscreen <- function(time = 8){
  
  path <- "loadingscreen/loadingscreen_bounce.gif"
  
  tagList(
    
    tags$script(
      as.character(
        glue::glue(
          "$(document).ready(function (){
            setTimeout(function () {
              $('#loadingscreen').css(\"display\", \"none\");
            }, {{{time*1000}}});
          });",
          .open = "{{{", .close = "}}}"
        )
      )
    ), 
    tags$style(
      HTML(
        ".loadingscreen-content{
          position: absolute;
          z-index: 1100;
          left: 0;
          right: 0;
          bottom: 0;
          top: 0;
          width: 100%;
          height: 100%;
          background-color: #c2c2d6;
        }
        
        .loadingscreen-content > img{
          width: 100%;
          height: 100%;
          object-fit: cover;
        }"
      )
    ),
    tags$div(class = "loadingscreen-content", 
             id = "loadingscreen",
             tags$img(src = path)
    )
    
  )
  
  
}




