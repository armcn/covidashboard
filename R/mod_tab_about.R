#' tab_about UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_tab_about_ui <- function(id) {
  
  ns <- NS(id)
  
  bs4Dash::tabItem(
    tabName = "tab_about"
  )
  
}
    
#' tab_about Server Functions
#'
#' @noRd 
mod_tab_about_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
 
  })
}
    
## To be copied in the UI
# mod_tab_about_ui("tab_about_ui_1")
    
## To be copied in the server
# mod_tab_about_server("tab_about_ui_1")

tab_item_about <- function() {
  
  bs4Dash::menuItem(
    text = "About the Data",
    tabName = "tab_about",
    icon = icon("question-circle")
  )
  
}