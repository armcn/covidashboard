#' value_box UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_value_box_ui <- function(id, .width) {
  
  ns <- NS(id)
  
  bs4Dash::valueBoxOutput(
    outputId = ns("value_box"),
    width = .width
  )
  
}
    
#' value_box Server Functions
#'
#' @noRd 
mod_value_box_server <- function(
  id,
  .daily_data_filtered,
  .title,
  .column_value,
  .column_secondary,
  .secondary_type,
  .icon,
  .color
) {
  
  moduleServer(id, function(input, output, session) {
    
    value_formatted <- reactive({
      
      req(.daily_data_filtered())
      
      .daily_data_filtered() |> 
        filter(!is.na(.data[[.column_value]])) |> 
        slice_max(date) |> 
        pull(.column_value) |> 
        format_value_html()
      
    })
    
    secondary_formatted <- reactive({
      
      req(.daily_data_filtered())
      
      .daily_data_filtered() |> 
        filter(!is.na(.data[[.column_value]])) |> 
        slice_max(date) |> 
        pull(.column_secondary) |> 
        format_secondary(.secondary_type)
      
    })
    
    footer <- reactive({
      
      req(secondary_formatted())
      
      if (.color == "white") {
        div(
          secondary_formatted(), 
          style = "color: black;"
        )
      } else {
        div(secondary_formatted())
      }
      
    })
    
    output$value_box <- bs4Dash::renderValueBox({
      
      req(
        value_formatted(),
        footer()
      )
      
      bs4Dash::valueBox(
        value = value_formatted(),
        subtitle = h5(.title),
        icon = .icon,
        footer = footer(),
        color = .color,
        gradient = TRUE,
        elevation = 1,
        width = NULL
      )
      
    })
 
  })
}
    
