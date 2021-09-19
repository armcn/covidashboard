#' tab_comparisons UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_tab_comparisons_ui <- function(id) {
  
  ns <- NS(id)
  
  bs4Dash::tabItem(
    tabName = "tab_comparisons"
  )
  
}
    
#' tab_comparisons Server Functions
#'
#' @noRd 
mod_tab_comparisons_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_tab_comparisons_ui("tab_comparisons_ui_1")
    
## To be copied in the server
# mod_tab_comparisons_server("tab_comparisons_ui_1")

tab_item_comparisons <- function() {
  
  bs4Dash::menuItem(
    text = "Comparisons",
    tabName = "tab_comparisons",
    icon = icon("chart-bar")
  )
  
}