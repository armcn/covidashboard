#' update_time UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_update_time_ui <- function(id) {
  
  ns <- NS(id)
  
  div(
    style = "margin-bottom: 20px;",
  
    uiOutput(
      outputId = ns("datetime")
    )
    
  )
  
}
    
#' update_time Server Functions
#'
#' @noRd 
mod_update_time_server <- function(
  id,
  .update_time
) {
  
  moduleServer( id, function(input, output, session) {
    
    output$datetime <- renderUI({
      
      .update_time |> 
        format_datetime(
          .tz = "EST5EDT",
          .tz_name = "ET"
        ) |> 
        {\(x) paste0("Data updated at ", x)}() |> 
        h5()
      
    })
 
  })
  
}
    
