#' tab_recovered UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_tab_recovered_ui <- function(id) {
  
  ns <- NS(id)
  
  bs4Dash::tabItem(
    tabName = "tab_recovered"
  )
  
}
    
#' tab_recovered Server Functions
#'
#' @noRd 
mod_tab_recovered_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_tab_recovered_ui("tab_recovered_ui_1")
    
## To be copied in the server
# mod_tab_recovered_server("tab_recovered_ui_1")

tab_item_recovered <- function() {
  
  bs4Dash::menuItem(
    text = "Recovered",
    tabName = "tab_recovered",
    icon = icon("file-medical")
  )
  
}