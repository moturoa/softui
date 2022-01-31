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
                             checkboxGroupInput(ns("chk1"), NULL, choices = NULL),
                             uiOutput(ns("ui_end_choices"))
                    )
           )
           
           
           
  )
  
}


#' @rdname picker_select
#' @export
picker_select_module <- function(input, output, session, choices = NULL, update = reactive(NULL), 
                                 max_choices = 50, debounce = 500){
  
  
  
  
  # reactive for the search
  txt_searched_instant <- reactive({
    input$txt_search
  })
  
  # debounced search
  txt_searched <- debounce(txt_searched_instant, millis = debounce, domain = session)
  
  
  # choices that remain after doing a search (an empty search or 1 char means the provided choices)
  choices_searched <- reactive({
    
    val <- txt_searched()
    
    if(nchar(val) < 2){
      vals <- choices
    } else {
      nms_sel <- grep(val, names(choices), ignore.case = TRUE, value = TRUE)
      vals <- choices[nms_sel]
    }
    
    vals
  })
  
  
  # must have names (here we search)
  if(is.null(names(choices))){
    names(choices) <- choices
  }
  
  # nr times clicked on 'show more rows'
  n_extra_clicked <- reactiveVal(0)
  
  n_choices_show <- reactive({
    max_choices + n_extra_clicked() * max_choices
  })
  
  output$ui_end_choices <- renderUI({
    req(length(choices_searched()) > n_choices_show())
    
    actionLink(session$ns("lnk_show_more_choices"), 
               glue::glue("{n_choices_show()} van {length(choices)} - toon meer..."))
  })
  
  observeEvent(input$lnk_show_more_choices, {
    n_extra_clicked(n_extra_clicked()+1)
  })
  
  # selected choices
  selection <- reactive({
    input$chk1
  })
  
  # select all
  observeEvent(input$btn_all_on, {
    updateCheckboxGroupInput(session, "chk1", selected = choices)
  })
  
  # unselect all
  observeEvent(input$btn_all_off, {
    updateCheckboxGroupInput(session, "chk1", selected = character(0))
  })
  
  # update selected or choices
  observeEvent(update(), {
    
    u <- update()
    
    updateCheckboxGroupInput(session, "chk1", selected = u$selected, choices = u$choices)
    
  })
  
  # reset search
  observeEvent(input$btn_reset_search, {
    updateTextInput(session, "txt_search", value = "")  
    n_extra_clicked(0)
  })
  

  
  observe({
    
    vals <- choices_searched()
    
    # --> ui warning oid, label boven choices
    if(length(vals) > n_choices_show()){
      vals <- vals[1:n_choices_show()]
    }
    
    updateCheckboxGroupInput(session, "chk1", choices = vals)  
    
  })
  
  
  return(selection)
}

