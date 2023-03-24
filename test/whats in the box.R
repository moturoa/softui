

devtools::load_all()

ui <- softui::simple_page(

  softui::box(

    tag = "data",
    title = "Box in a box",
    
    # softui::box(
    #   title = "Another box", class = "card-plain border-dashed border-3",
    #   margin_bottom = 8,
    #   collapsed = TRUE,
    #   shinipsum::random_text(1000)
    # ),
    
    softui::sub_box(
      title = "A sub box", 
      margin_bottom = 8,
      dashed_border = TRUE, 
      grey_level = 0,
      border_width = 1,
      collapsed = TRUE,
      shinipsum::random_text(1000)
    ),
    
    # softui::sub_box(
    #   title = "Another sub box", 
    #   margin_bottom = 8,
    #   dashed_border = FALSE, 
    #   grey_level = 0.1,
    #   collapsed = TRUE,
    #   shinipsum::random_text(1000)
    # )
    
  )

)

server <- function(input, output, session) {

}

shinyApp(ui, server)
