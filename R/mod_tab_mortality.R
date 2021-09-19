#' tab_mortality UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_tab_mortality_ui <- function(id) {
  
  ns <- NS(id)
  
  bs4Dash::tabItem(
    tabName = "tab_mortality"
  )
  
}
    
#' tab_mortality Server Functions
#'
#' @noRd 
mod_tab_mortality_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_tab_mortality_ui("tab_mortality_ui_1")
    
## To be copied in the server
# mod_tab_mortality_server("tab_mortality_ui_1")

tab_item_mortality <- function() {
  
  bs4Dash::menuItem(
    text = "Mortality",
    tabName = "tab_mortality",
    icon = icon("heartbeat")
  )
  
}