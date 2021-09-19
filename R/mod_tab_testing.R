#' tab_testing UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_tab_testing_ui <- function(id) {
  
  ns <- NS(id)
  
  bs4Dash::tabItem(
    tabName = "tab_testing"
  )
  
}
    
#' tab_testing Server Functions
#'
#' @noRd 
mod_tab_testing_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_tab_testing_ui("tab_testing_ui_1")
    
## To be copied in the server
# mod_tab_testing_server("tab_testing_ui_1")

tab_item_testing <- function() {
  
  bs4Dash::menuItem(
    text = "Testing",
    tabName = "tab_testing",
    icon = icon("vial")
  )
  
}