#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  
  dark_mode <- reactive({ input$dark_mode })
  
  mod_app_server(
    id = "app",
    .dark_mode = dark_mode
  )
  
}
