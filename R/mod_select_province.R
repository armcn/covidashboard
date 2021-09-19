#' select_province UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_select_province_ui <- function(id) {
  
  ns <- NS(id)
  
  selectInput(
    inputId = ns("select_province"),
    label = "Select Province",
    choices = NULL
  )
  
}
    
#' select_province Server Functions
#'
#' @noRd 
mod_select_province_server <- function(
  id,
  .daily_province_data
) {
  
  moduleServer(id, function(input, output, session) {
    
    provinces <- .daily_province_data |> 
      distinct(province_full) |> 
      arrange() |> 
      pull(province_full)
    
    updateSelectInput(
      session = session,
      inputId = "select_province",
      choices = c("All of Canada", provinces)
    )
    
    return(
      reactive({
        input$select_province
      })
    )
 
  })
  
}
