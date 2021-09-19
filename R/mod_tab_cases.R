#' tab_cases UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_tab_cases_ui <- function(id) {
  
  ns <- NS(id)
  
  bs4Dash::tabItem(
    tabName = "tab_cases"
  )
  
}
    
#' tab_cases Server Functions
#'
#' @noRd 
mod_tab_cases_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_tab_cases_ui("tab_cases_ui_1")
    
## To be copied in the server
# mod_tab_cases_server("tab_cases_ui_1")

tab_item_cases <- function() {
  
  bs4Dash::menuItem(
    text = "Cases",
    tabName = "tab_cases",
    icon = icon("calendar-plus")
  )
  
}