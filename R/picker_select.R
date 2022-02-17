#' Picker-select
#' @description Replacement for `shinyWidgets::pickerInput`, which is somehow not compatible with this (bootstrap 5.1 / softui) framework.
#' @export
#' @rdname picker_select
picker_select_ui <- function(id, 
                             label = "", 
                             btn_class = "btn-info", 
                             height = 300, 
                             width = 300, 
                             button_style = "", 
                             dropdown_style = "",
                             search = TRUE,
                             buttons_select = FALSE
                             ){
  
  ns <- NS(id)
  w_css <- shiny::validateCssUnit(width)
  h_css <- shiny::validateCssUnit(width)
  
  drop_style <- paste(glue::glue("padding: 18px; overflow-y: auto; height: {h_css}; width: {w_css};"), dropdown_style)
  
  tags$div(class = "dropdown",
           
           tags$label(label, class = "control-label"),
           tags$div(
             actionButton(ns("btn_drop"), 
                          uiOutput(ns("dropdown_label"), container = span, inline = TRUE), 
                          class = paste(btn_class, "dropdown-toggle"),
                          `data-bs-toggle`="dropdown", 
                          `data-bs-auto-close` = "outside", 
                          style = button_style),
           
            tags$div(class = "dropdown-menu", 
                    tags$div(style = drop_style,
                             
                             if(search){
                              tagList(
                                softui::fluid_row(
                                  column(10, 
                                    textInput(ns("txt_search"), NULL, width = "100%", placeholder = "Zoek")
                                  ),
                                  column(2, 
                                      tags$div(style = "padding-top: 8px;",
                                          actionButton(ns("btn_reset_search"), 
                                                        label = tags$span(style = "font-size: 1.3em;", bsicon("x")), 
                                                        class = "btn-light", 
                                                        style = "background: none; border: none; box-shadow: none; width: 30px; padding:0; margin: 0;")
                                      )
                                  )
                                 
                                )
                              )  
                             } else NULL,
                             
                             if(buttons_select){
                              tagList(
                                actionButton(ns("btn_all_on"), "Alles aan", class = "btn-light btn-sm"),
                                actionButton(ns("btn_all_off"), "Alles uit", class = "btn-light btn-sm")   
                              ) 
                             } else NULL,
                             
                             if(buttons_select | search){
                               tags$hr()  
                             } else NULL,
                             
                             checkboxGroupInput(ns("chk1"), NULL, choices = NULL),
                             uiOutput(ns("ui_end_choices"))
                    )
           )
           
           )
           
  )
  
}


#' @rdname picker_select
#' @export
picker_select_module <- function(input, output, session, 
                                 choices = reactive(NULL), 
                                 update = reactive(NULL), 
                                 max_choices = 50, 
                                 debounce = 500){
  
  
  
  # reactive for the search
  txt_searched_instant <- reactive({
    input$txt_search
  })
  
  # debounced search (avoid searches while typing)
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
  selection <- reactiveVal()
  
  observeEvent(input$chk1, {
    selection(input$chk1)
  })
  
  output$dropdown_label <- renderUI({
    n_sel <- length(selection())
    if(n_sel == 0){
      "Maak een selectie"
    } else {
      glue("{n_sel} geselecteerd")
    }
    
  })
  
  
  # select all
  observeEvent(input$btn_all_on, {
    updateCheckboxGroupInput(session, "chk1", selected = choices)
    selection(choices())
  })
  
  # unselect all
  observeEvent(input$btn_all_off, {
    updateCheckboxGroupInput(session, "chk1", selected = character(0))
    selection(NULL)
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
    selection(NULL)
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

