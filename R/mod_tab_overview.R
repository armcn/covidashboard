#' tab_overview UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_tab_overview_ui <- function(id) {
  
  ns <- NS(id)
  
  bs4Dash::tabItem(
    tabName = "tab_overview",
    
    fluidRow(
        
      mod_value_box_ui(
        id = ns("cases"),
        .width = 3
      ),
        
      mod_value_box_ui(
        id = ns("active_cases"),
        .width = 3
      ),
      
      mod_value_box_ui(
        id = ns("recovered"),
        .width = 3
      ),
      
      mod_value_box_ui(
        id = ns("deaths"),
        .width = 3
      )
      
    ),
    
    fluidRow(
      
      mod_value_box_ui(
        id = ns("vaccine_doses"),
        .width = 3
      ),
      
      mod_value_box_ui(
        id = ns("fully_vaccinated"),
        .width = 3
      ),
      
      mod_value_box_ui(
        id = ns("hospitalizations"),
        .width = 3
      ),
      
      mod_value_box_ui(
        id = ns("testing"),
        .width = 3
      )
      
    ),
    
    fluidRow(
      
      column(
        width = 12,
        
        mod_update_time_ui(
          id = ns("update_time")
        )
        
      )
      
    ),
    
    fluidRow(
        
      bs4Dash::box(
        width = 12,
        title = "Daily reported cases by province (7-day average)",
        collapsible = FALSE,

        plotly::plotlyOutput(
          outputId = ns("plot"),
          height = "430px"
        )

      )
      
    ),
    
    fluidRow(
      
      bs4Dash::box(
        width = 12,
        title = "Summary by region",
        collapsible = FALSE,
        
        reactable::reactableOutput(
          outputId = ns("summary_table")
        )
        
      )
      
    )
    
  )
  
}
    
#' tab_overview Server Functions
#'
#' @noRd 
mod_tab_overview_server <- function(
  id,
  .daily_data_filtered,
  .daily_province_data,
  .daily_canada_data,
  .province,
  .update_time,
  .dark_mode
) {
  
  moduleServer(id, function(input, output, session) {
    
    mod_value_box_server(
      id = "cases",
      .daily_data_filtered = .daily_data_filtered,
      .title = "Reported cases",
      .column_value = "cumulative_cases",
      .column_secondary = "cases",
      .secondary_type = "new",
      .icon = icon("calendar-plus"),
      .color = "info"
    )
    
    mod_value_box_server(
      id = "active_cases",
      .daily_data_filtered = .daily_data_filtered,
      .title = "Active cases",
      .column_value = "active_cases",
      .column_secondary = "active_cases_change",
      .secondary_type = "change",
      .icon = icon("virus"),
      .color = "danger"
    )
    
    mod_value_box_server(
      id = "recovered",
      .daily_data_filtered = .daily_data_filtered,
      .title = "Total recovered",
      .column_value = "cumulative_recovered",
      .column_secondary = "recovered",
      .secondary_type = "new",
      .icon = icon("file-medical"),
      .color = "success"
    )
    
    mod_value_box_server(
      id = "deaths",
      .daily_data_filtered = .daily_data_filtered,
      .title = "Total deaths",
      .column_value = "cumulative_deaths",
      .column_secondary = "deaths",
      .secondary_type = "new",
      .icon = icon("heartbeat"),
      .color = "gray-dark"
    )
    
    mod_value_box_server(
      id = "vaccine_doses",
      .daily_data_filtered = .daily_data_filtered,
      .title = "Vaccine doses administered",
      .column_value = "cumulative_avaccine",
      .column_secondary = "avaccine",
      .secondary_type = "new",
      .icon = icon("syringe"),
      .color = "teal"
    )
    
    mod_value_box_server(
      id = "fully_vaccinated",
      .daily_data_filtered = .daily_data_filtered,
      .title = "People fully vaccinated",
      .column_value = "cumulative_cvaccine",
      .column_secondary = "cvaccine",
      .secondary_type = "new",
      .icon = icon("check"),
      .color = "gray"
    )
    
    mod_value_box_server(
      id = "hospitalizations",
      .daily_data_filtered = .daily_data_filtered,
      .title = "Hospitalizations",
      .column_value = "hospitalizations",
      .column_secondary = "hospitalizations_change",
      .secondary_type = "change",
      .icon = icon("hospital"),
      .color = "white"
    )
    
    mod_value_box_server(
      id = "testing",
      .daily_data_filtered = .daily_data_filtered,
      .title = "Total testing",
      .column_value = "cumulative_testing",
      .column_secondary = "testing",
      .secondary_type = "new",
      .icon = icon("eye-dropper"),
      .color = "gray"
    )
    
    mod_update_time_server(
      id = "update_time",
      .update_time = .update_time
    )
    
    output$plot <- plotly::renderPlotly({
      
      req(
        .province(),
        !is.null(.dark_mode())
      )
      
      if (.province() == "All of Canada") {
    
        province_data <- .daily_province_data
        
      } else {
        
        province_data <- .daily_province_data |> 
          filter(
            province_full == .province()
          )
        
      }
      
      province_data |> 
        group_by(province) |> 
        arrange(date) |> 
        mutate(
          roll_avg = zoo::rollmean(
            cases,
            k = 7,
            fill = 0,
            align = "right"
          )
        ) |> 
        plot_daily_province_data(
          .col_y = "roll_avg",
          .title_y = "New Reported Cases",
          .dark_mode = .dark_mode()
        )
      
    })
    
    summary_data <- reactive({
      
      # sort based on selected province
      
      calc_summary_data(
        .daily_province_data = .daily_province_data,
        .daily_canada_data = .daily_canada_data
      )
      
    })
    
    reactable_theme <- function(.dark_mode) {
      
      background_color <- 
        if (.dark_mode) "#343a40" else "#ffffff"
      
      reactable::reactableTheme(
        backgroundColor = background_color,
        borderColor = "#808080",
        borderWidth = "1px",
        highlightColor = "#007bff"
      )
      
    }
    
    output$summary_table <- reactable::renderReactable({
      
      req(
        summary_data(),
        !is.null(.dark_mode())
      )
      
      theme <- reactable_theme(
        .dark_mode = .dark_mode()
      )
    
      summary_data() |> 
        reactable::reactable(
          theme = theme,
          defaultColDef = reactable::colDef(
            format = reactable::colFormat(
              separators = TRUE
            )
          ),
          highlight = TRUE
        )
      
    })
 
  })
  
}

tab_item_overview <- function() {
  
  bs4Dash::menuItem(
    text = "Overview",
    tabName = "tab_overview",
    icon = icon("table")
  )
  
}