#' filter_province UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_filter_province_ui <- function(id) {
  
  NULL
  
}
    
#' filter_province Server Functions
#'
#' @noRd 
mod_filter_province_server <- function(
  id,
  .daily_province_data,
  .daily_canada_data,
  .province
) {
  
  moduleServer(id, function(input, output, session) {
    
    reactive({
      
      req(.province())
    
      if (.province() == "All of Canada") {
        
        .daily_canada_data
        
      } else {
        
        .daily_province_data |> 
          filter(province_full == .province())
        
      }
      
    })
 
  })
  
}
    
