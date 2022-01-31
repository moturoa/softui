


library(shiny)
library(bslib)
library(shinyWidgets)



picker_select_ui <- function(id, label = "", btn_class = "btn-info", height = 300){
  
  ns <- NS(id)
  
  tags$div(class = "dropdown",
           
           actionButton(ns("btn_drop"), label, 
                        class = paste(btn_class, "dropdown-toggle"),
                        `data-bs-toggle`="dropdown", 
                        `data-bs-auto-close` = "outside"),
           
           tags$div(class = "dropdown-menu", 
                    tags$div(style = glue::glue("padding: 18px; overflow-y: scroll;height: {height}px;"),
                             
                             searchInput(ns("txt_search"), NULL, width = "100%",
                                         btnReset = icon("remove")),
                             actionButton(ns("btn_all_on"), "Alles aan", class = "btn-light btn-sm"),
                             actionButton(ns("btn_all_off"), "Alles uit", class = "btn-light btn-sm"),
                             tags$hr(style = "padding: 2px !important;"),
                             
                             checkboxGroupInput(ns("chk1"), NULL, choices = NULL)
                    )
           )
           
           
           
  )
  
}


picker_select_module <- function(input, output, session, choices = NULL, max_choices = 50){
  
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
  
  observeEvent(input$btn_all_off, {
    updateCheckboxGroupInput(session, "chk1", selected = character(0))
  })
  
  observeEvent(input$txt_search, {
    
    val <- input$txt_search
    
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


ui <- fluidPage(theme = bs_theme(version = 5),

                
                picker_select_ui("test", "Select mtcar"),
                
                tags$hr(),
                verbatimTextOutput("txt_out")
                
)

server <- function(input, output, session) {
  
  out <- callModule(picker_select_module, "test", choices = c("Aap" = "a", "Banaan" = "b", "Citroen" = "c")) #ownames(mtcars))
  
  
  output$txt_out <- renderPrint({
    out()
  })
  
}

shinyApp(ui, server)
