
value_box <- function(value,
                      title,
                      sub_value = "",
                      icon = bsicon("file-earmark-bar-graph"),
                      width = 4){

  tags$div(class = glue::glue("col-lg-{width} col-sm-{width}"),

           tags$div(class = "card mb-4",
                    tags$div(class = "card-body p-3",
                             tags$div(class = "row",
                                      tags$div(class = "col-8",
                                               tags$div(class = "numbers",
                                                        tags$p(class = "text-sm mb-0 text-capitalize font-weight-bold",
                                                               title
                                                        ),
                                                        tags$h5(class="font-weight-bolder mb-0",
                                                                value,
                                                                tags$span(class = "text-success text-sm font-weight-bolder",
                                                                          sub_value
                                                                )
                                                        )
                                               )
                                      ),
                                      tags$div(class = "col-4 text-end",

                                               tags$div(class = "icon icon-shape bg-gradient-primary shadow text-center border-radius-md",
                                                        style = "float: right;",
                                                        icon
                                               )

                                      )
                             )
                    )
           )

  )


}

