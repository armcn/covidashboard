#' calc_summary_data 
#'
#' @description A fct function
#'
#' @return The return value, if any, from executing the function.
#'
#' @noRd
calc_summary_data <- function(
  .daily_province_data,
  .daily_canada_data
) {
  
  .daily_province_data |> 
    dplyr::slice_max(date) |> 
    dplyr::select(
      `Region` = province,
      `Total Cases` = cumulative_cases,
      `New Cases` = cases,
      `Active Cases` = active_cases,
      `Active Cases Change` = active_cases_change,
      `Total Vaccine Doses` = cumulative_dvaccine,
      `New Vaccine Doses` = dvaccine,
      `Total Fully Vaccinated` = cumulative_cvaccine,
      `New Fully Vaccinated` = cvaccine
    )
  
}
