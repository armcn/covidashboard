#' tab_vaccines UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_tab_vaccines_ui <- function(id) {
  
  ns <- NS(id)
  
  bs4Dash::tabItem(
    tabName = "tab_vaccines"
  )
  
}
    
#' tab_vaccines Server Functions
#'
#' @noRd 
mod_tab_vaccines_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_tab_vaccines_ui("tab_vaccines_ui_1")
    
## To be copied in the server
# mod_tab_vaccines_server("tab_vaccines_ui_1")

tab_item_vaccines <- function() {
  
  bs4Dash::menuItem(
    text = "Vaccines",
    tabName = "tab_vaccines",
    icon = icon("syringe")
  )
  
}