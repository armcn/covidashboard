#' app UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_app_ui <- function(id) {
  
  ns <- NS(id)
  
  dashboard_header <- bs4Dash::dashboardHeader(
    title = "COVID-19 in Canada",
    fixed = TRUE,
    border = FALSE
  )
  
  dashboard_sidebar <- bs4Dash::dashboardSidebar(
    
    mod_select_province_ui(
      id = ns("select_province")
    ),
    
    bs4Dash::sidebarMenu(
      tab_item_overview(),
      tab_item_comparisons(),
      tab_item_maps(),
      tab_item_vaccines(),
      tab_item_cases(),
      tab_item_mortality(),
      tab_item_recovered(),
      tab_item_testing(),
      tab_item_about()
    )
    
  )
  
  dashboard_body <- bs4Dash::dashboardBody(
    
    fresh::use_googlefont("Lato"),
    
    bs4Dash::tabItems(
      mod_tab_overview_ui(id = ns("overview")),
      mod_tab_comparisons_ui(id = ns("comparisons")),
      mod_tab_maps_ui(id = ns("maps")),
      mod_tab_vaccines_ui(id = ns("vaccines")),
      mod_tab_cases_ui(id = ns("cases")),
      mod_tab_mortality_ui(id = ns("mortality")),
      mod_tab_recovered_ui(id = ns("recovered")),
      mod_tab_testing_ui(id = ns("testing")),
      mod_tab_about_ui(id = ns("about"))
    )
    
  )
  
  bs4Dash::dashboardPage(
    freshTheme = fresh_theme(),
    header = dashboard_header,
    sidebar = dashboard_sidebar,
    body = dashboard_body,
    title = "COVID-19 in Canada",
    preloader = preloader_spinner(),
    fullscreen = TRUE,
    scrollToTop = TRUE,
    dark = TRUE
  )
  
}
    
#' app Server Functions
#'
#' @noRd 
mod_app_server <- function(
  id,
  .daily_canada_data,
  .daily_province_data,
  .update_time,
  .dark_mode
) {
  
  moduleServer(id, function(input, output, session) {
    
    api_data <- get_api_data()
  
    daily_province_data <- pluck(
      api_data, 
      "daily_province_data"
    )
    
    daily_canada_data <- pluck(
      api_data, 
      "daily_canada_data"
    )
    
    update_time <- pluck(
      api_data,
      "update_time"
    )
    
    province <- mod_select_province_server(
      id = "select_province",
      .daily_province_data = daily_province_data
    )
    
    daily_data_filtered <- mod_filter_province_server(
      id = "filter_province",
      .daily_canada_data = daily_canada_data,
      .daily_province_data = daily_province_data,
      .province = province
    )
    
    mod_tab_overview_server(
      id = "overview",
      .daily_data_filtered = daily_data_filtered,
      .daily_province_data = daily_province_data,
      .daily_canada_data = daily_canada_data,
      .province = province,
      .update_time = update_time,
      .dark_mode = .dark_mode
    )
      
    mod_tab_comparisons_server(id = "comparisons")
    mod_tab_maps_server(id = "maps")
    mod_tab_vaccines_server(id = "vaccines")
    mod_tab_cases_server(id = "cases")
    mod_tab_mortality_server(id = "mortality")
    mod_tab_recovered_server(id = "recovered")
    mod_tab_testing_server(id = "testing")
    mod_tab_about_server(id = "about")
 
  })
  
}
    
