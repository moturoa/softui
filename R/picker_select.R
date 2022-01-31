#' Picker-select
#' @description Replacement for `shinyWidgets::pickerInput`, which is somehow not compatible with this (bootstrap 5.1 / softui) framework.
#' @export
#' @rdname picker_select
picker_select_ui <- function(id, label = "", btn_class = "btn-info", height = 300, width = 300, button_style = "", dropdown_style = ""){
  
  ns <- NS(id)
  w_css <- shiny::validateCssUnit(width)
  h_css <- shiny::validateCssUnit(width)
  
  drop_style <- paste(glue::glue("padding: 18px; overflow-y: auto; height: {h_css}; width: {w_css};"), dropdown_style)
  
  tags$div(class = "dropdown",
           
           actionButton(ns("btn_drop"), label, 
                        class = paste(btn_class, "dropdown-toggle"),
                        `data-bs-toggle`="dropdown", 
                        `data-bs-auto-close` = "outside", 
                        style = button_style),
           
           tags$div(class = "dropdown-menu", 
                    tags$div(style = drop_style,
                             
                             tags$div(style = "display:inline-block;",
                                      textInput(ns("txt_search"), NULL, width = "90%")
                             ),
                             actionButton(ns("btn_reset_search"), label = icon("remove"), 
                                          class = "btn-light", style = "background: none; border: none; box-shadow: none;"),
                             tags$br(),
                             
                             actionButton(ns("btn_all_on"), "Alles aan",icon = bsicon("check"), class = "btn-light btn-sm"),
                             actionButton(ns("btn_all_off"), "Alles uit", icon = bsicon("x"), class = "btn-light btn-sm"),
                             tags$hr(),
                             checkboxGroupInput(ns("chk1"), NULL, choices = NULL)
                    )
           )
           
           
           
  )
  
}


#' @rdname picker_select
#' @export
picker_select_module <- function(input, output, session, choices = NULL, update = reactive(NULL), 
                                 max_choices = 50, debounce = 500){
  
  # must have names (here we search)
  if(is.null(names(choices))){
    names(choices) <- choices
  }
  
  selection <- reactive({
    input$chk1
  })
  
  observeEvent(input$btn_all_on, {
    updateCheckboxGroupInput(session, "chk1", selected = choices)
  })
  
  observeEvent(update(), {
    
    u <- update()
    
    updateCheckboxGroupInput(session, "chk1", selected = u$selected, choices = u$choices)
    
  })
  
  
  observeEvent(input$btn_reset_search, {
    updateTextInput(session, "txt_search", value = "")  
  })
  
  
  observeEvent(input$btn_all_off, {
    updateCheckboxGroupInput(session, "chk1", selected = character(0))
  })
  
  txt_searched_instant <- reactive({
    input$txt_search
  })
  
  txt_searched <- debounce(txt_searched_instant, millis = debounce, domain = session)
  
  observeEvent(txt_searched(), {
    
    val <- txt_searched()
    
    if(nchar(val) < 2){
      vals <- choices
    } else {
      nms_sel <- grep(val, names(choices), ignore.case = TRUE, value = TRUE)
      vals <- choices[nms_sel]
    }
    
    # --> ui warning oid, label boven choices
    if(length(vals) > max_choices){
      vals <- vals[1:max_choices]
    }
    
    updateCheckboxGroupInput(session, "chk1", choices = vals)  
    
  })
  
  
  return(selection)
}

