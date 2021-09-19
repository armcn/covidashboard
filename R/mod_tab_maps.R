#' tab_maps UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_tab_maps_ui <- function(id) {
  
  ns <- NS(id)
  
  bs4Dash::tabItem(
    tabName = "tab_maps"
  )
  
}
    
#' tab_maps Server Functions
#'
#' @noRd 
mod_tab_maps_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_tab_maps_ui("tab_maps_ui_1")
    
## To be copied in the server
# mod_tab_maps_server("tab_maps_ui_1")

tab_item_maps <- function() {
  
  bs4Dash::menuItem(
    text = "Maps",
    tabName = "tab_maps",
    icon = icon("map-marked-alt")
  )
  
}