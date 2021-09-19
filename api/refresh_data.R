append_data_dir <- function(.path) {
  
  paste0(
    "~/data-raw/github_data/Covid19Canada-master/",
    .path
  )
  
}

read_csv_file <- function(.path, .col_types) {
  
  vroom::vroom(
    file = .path,
    delim = ",",
    col_types = .col_types
  )
  
}

write_csv_file <- function(.tbl, .path) {
  
  vroom::vroom_write(
    x = .tbl,
    file = .path,
    delim = ","
  )
  
}

read_txt_file <- function(.path) {
  
  vroom::vroom_lines(
    file = .path
  )
  
}

get_path_update_time <- function() {
  
  append_data_dir("update_time.txt")
  
}

read_update_time <- function() {
  
  read_txt_file(
    .path = get_path_update_time()
  )
  
}

get_path_prov_map <- function() {
  
  append_data_dir(
    "other/prov_map.csv"
  )
  
}

read_prov_map <- function() {
  
  read_csv_file(
    .path = get_path_prov_map(),
    .col_types = vroom::cols_only(
      province = vroom::col_character(),
      province_full = vroom::col_character(),
      province_short = vroom::col_character(),
      pop = vroom::col_double()
    )
  )
  
}

get_path_cases_timeseries_prov <- function() {
  
  append_data_dir(
    "timeseries_prov/cases_timeseries_prov.csv"
  )
  
}

read_cases_timeseries_prov <- function() {
  
  read_csv_file(
    .path = get_path_cases_timeseries_prov(),
    .col_types = vroom::cols_only(
      date_report = vroom::col_character(),
      province = vroom::col_character(),
      cases = vroom::col_double(),
      cumulative_cases = vroom::col_double()
    )
  )
  
}

get_path_mortality_timeseries_prov <- function() {
  
  append_data_dir(
    "timeseries_prov/mortality_timeseries_prov.csv"
  )
  
}

read_mortality_timeseries_prov <- function() {
  
  read_csv_file(
    .path = get_path_mortality_timeseries_prov(),
    .col_types = vroom::cols_only(
      date_death_report = vroom::col_character(),
      province = vroom::col_character(),
      deaths = vroom::col_double(),
      cumulative_deaths = vroom::col_double()
    )
  )
  
}

get_path_recovered_timeseries_prov <- function() {
  
  append_data_dir(
    "timeseries_prov/recovered_timeseries_prov.csv"
  )
  
}

read_recovered_timeseries_prov <- function() {
  
  read_csv_file(
    .path = get_path_recovered_timeseries_prov(),
    .col_types = vroom::cols_only(
      date_recovered = vroom::col_character(),
      province = vroom::col_character(),
      recovered = vroom::col_double(),
      cumulative_recovered = vroom::col_double()
    )
  )
  
}

get_path_testing_timeseries_prov <- function() {
  
  append_data_dir(
    "timeseries_prov/testing_timeseries_prov.csv"
  )
  
}

read_testing_timeseries_prov <- function() {
  
  read_csv_file(
    .path = get_path_testing_timeseries_prov(),
    .col_types = vroom::cols_only(
      date_testing = vroom::col_character(),
      province = vroom::col_character(),
      testing = vroom::col_double(),
      cumulative_testing = vroom::col_double(),
      testing_info = vroom::col_character()
    )
  )
  
}

get_path_active_timeseries_prov <- function() {
  
  append_data_dir(
    "timeseries_prov/active_timeseries_prov.csv"
  )
  
}

read_active_timeseries_prov <- function() {
  
  read_csv_file(
    .path = get_path_active_timeseries_prov(),
    .col_types = vroom::cols_only(
      date_active = vroom::col_character(),
      province = vroom::col_character(),
      cumulative_cases = vroom::col_double(),
      cumulative_recovered = vroom::col_double(),
      cumulative_deaths = vroom::col_double(),
      active_cases = vroom::col_double(),
      active_cases_change = vroom::col_double()
    )
  )
  
}

get_path_cases_timeseries_canada <- function() {
  
  append_data_dir(
    "timeseries_canada/cases_timeseries_canada.csv"
  )
  
}

read_cases_timeseries_canada <- function() {
  
  read_csv_file(
    .path = get_path_cases_timeseries_canada(),
    .col_types = vroom::cols_only(
      date_report = vroom::col_character(),
      province = vroom::col_character(),
      cases = vroom::col_double(),
      cumulative_cases = vroom::col_double()
    )
  )
  
}

get_path_mortality_timeseries_canada <- function() {
  
  append_data_dir(
    "timeseries_canada/mortality_timeseries_canada.csv"
  )
  
}

read_mortality_timeseries_canada <- function() {
  
  read_csv_file(
    .path = get_path_mortality_timeseries_canada(),
    .col_types = vroom::cols_only(
      date_death_report = vroom::col_character(),
      province = vroom::col_character(),
      deaths = vroom::col_double(),
      cumulative_deaths = vroom::col_double()
    )
  )
  
}

get_path_recovered_timeseries_canada <- function() {
  
  append_data_dir(
    "timeseries_canada/recovered_timeseries_canada.csv"
  )
  
}

read_recovered_timeseries_canada <- function() {
  
  read_csv_file(
    .path = get_path_recovered_timeseries_canada(),
    .col_types = vroom::cols_only(
      date_recovered = vroom::col_character(),
      province = vroom::col_character(),
      recovered = vroom::col_double(),
      cumulative_recovered = vroom::col_double()
    )
  )
  
}

get_path_testing_timeseries_canada <- function() {
  
  append_data_dir(
    "timeseries_canada/testing_timeseries_canada.csv"
  )
  
}

read_testing_timeseries_canada <- function() {
  
  read_csv_file(
    .path = get_path_testing_timeseries_canada(),
    .col_types = vroom::cols_only(
      date_testing = vroom::col_character(),
      province = vroom::col_character(),
      testing = vroom::col_double(),
      cumulative_testing = vroom::col_double(),
      testing_info = vroom::col_character()
    )
  )  

}

get_path_active_timeseries_canada <- function() {
  
  append_data_dir(
    "timeseries_canada/active_timeseries_canada.csv"
  )
  
}

read_active_timeseries_canada <- function() {
  
  read_csv_file(
    .path = get_path_active_timeseries_canada(),
    .col_types = vroom::cols_only(
      date_active = vroom::col_character(),
      province = vroom::col_character(),
      cumulative_cases = vroom::col_double(),
      cumulative_recovered = vroom::col_double(),
      cumulative_deaths = vroom::col_double(),
      active_cases = vroom::col_double(),
      active_cases_change = vroom::col_double()
    )
  )
  
}

get_path_vaccine_administration_timeseries_prov <- function() {
  
  append_data_dir(
    "timeseries_prov/vaccine_administration_timeseries_prov.csv"
  )
  
}

read_vaccine_administration_timeseries_prov <- function() {
  
  read_csv_file(
    .path = get_path_vaccine_administration_timeseries_prov(),
    .col_types = vroom::cols_only(
      date_vaccine_administered = vroom::col_character(),
      province = vroom::col_character(),
      avaccine = vroom::col_double(),
      cumulative_avaccine = vroom::col_double()
    )
  )
  
}

get_path_vaccine_distribution_timeseries_prov <- function() {
  
  append_data_dir(
    "timeseries_prov/vaccine_distribution_timeseries_prov.csv"
  )
  
}

read_vaccine_distribution_timeseries_prov <- function() {
  
  read_csv_file(
    .path = get_path_vaccine_distribution_timeseries_prov(),
    .col_types = vroom::cols_only(
      date_vaccine_distributed = vroom::col_character(),
      province = vroom::col_character(),
      dvaccine = vroom::col_double(),
      cumulative_dvaccine = vroom::col_double()
    )
  )
  
}

get_path_vaccine_completion_timeseries_prov <- function() {
  
  append_data_dir(
    "timeseries_prov/vaccine_completion_timeseries_prov.csv"
  )
  
}

read_vaccine_completion_timeseries_prov <- function() {
  
  read_csv_file(
    .path = get_path_vaccine_completion_timeseries_prov(),
    .col_types = vroom::cols_only(
      date_vaccine_completed = vroom::col_character(),
      province = vroom::col_character(),
      cvaccine = vroom::col_double(),
      cumulative_cvaccine = vroom::col_double()
    )
  )
  
}

get_path_vaccine_completion_timeseries_canada <- function() {
  
  append_data_dir(
    "timeseries_canada/vaccine_completion_timeseries_canada.csv"
  )
  
}

read_vaccine_completion_timeseries_canada <- function() {
  
  read_csv_file(
    .path = get_path_vaccine_completion_timeseries_canada(),
    .col_types = vroom::cols_only(
      date_vaccine_completed = vroom::col_character(),
      province = vroom::col_character(),
      cvaccine = vroom::col_double(),
      cumulative_cvaccine = vroom::col_double()
    )
  )
  
}

get_path_vaccine_administration_timeseries_canada <- function() {
  
  append_data_dir(
    "timeseries_canada/vaccine_administration_timeseries_canada.csv"
  )
  
}

read_vaccine_administration_timeseries_canada <- function() {
  
  read_csv_file(
    .path = get_path_vaccine_administration_timeseries_canada(),
    .col_types = vroom::cols_only(
      date_vaccine_administered = vroom::col_character(),
      province = vroom::col_character(),
      avaccine = vroom::col_double(),
      cumulative_avaccine = vroom::col_double()
    )
  )
  
}

get_path_vaccine_distribution_timeseries_canada <- function() {
  
  append_data_dir(
    "timeseries_canada/vaccine_distribution_timeseries_canada.csv"
  )
  
}

read_vaccine_distribution_timeseries_canada <- function() {
  
  read_csv_file(
    .path = get_path_vaccine_distribution_timeseries_canada(),
    .col_types = vroom::cols_only(
      date_vaccine_distributed = vroom::col_character(),
      province = vroom::col_character(),
      dvaccine = vroom::col_double(),
      cumulative_dvaccine = vroom::col_double()
    )
  )
  
}

read_hospitalizations_prov <- function() {
  
  provinces <- "https://api.covid19tracker.ca/provinces" |> 
    jsonlite::fromJSON() |> 
    tibble::as_tibble() |> 
    dplyr::select(code) |> 
    dplyr::filter(
      code %in% c(
        "ON",
        "QC",
        "NS",
        "NB",
        "MB",
        "BC",
        "PE",
        "SK",
        "AB",
        "NL",
        "NT",
        "YT",
        "NU"
      )
    )
  
  get_province_reports <- function(.code) {
    
    paste0(
      "https://api.covid19tracker.ca/reports/province/",
      .code,
      "?stat=hospitalizations&fill_dates=true"
    )|> 
    jsonlite::fromJSON() |> 
    purrr::pluck("data") |> 
    tibble::as_tibble()
    
  }
  
  provinces |> 
    purrr::pluck("code") |> 
    purrr::map_df(
      \(.code) {
        .code |> 
          get_province_reports() |> 
          tibble::add_column(province = .code)
      }
    )
  
}

read_hospitalizations_canada <- function() {
  
  "https://api.covid19tracker.ca/reports?stat=hospitalizations&fill_dates=true" |> 
    jsonlite::fromJSON() |> 
    purrr::pluck("data") |> 
    tibble::as_tibble()
  
}

clean_update_time <- function(.tbl, .tz = "EST5EDT") {
  
  .tbl |> 
    lubridate::ymd_hm(tz = .tz) |> 
    lubridate::with_tz(tzone = "UTC")
  
}

clean_prov_map <- function(.tbl) {
  
  .tbl |> 
    dplyr::filter(province != "Repatriated") |> 
    dplyr::select(
      province,
      province_full,
      province_short,
      population = pop
    )
  
}

clean_cases_timeseries_prov <- function(.tbl) {
  
  .tbl |> 
    dplyr::mutate(
      date = lubridate::dmy(date_report)
    ) |> 
    dplyr::select(
      date,
      province,
      cases,
      cumulative_cases
    )
  
}

clean_mortality_timeseries_prov <- function(.tbl) {
  
  .tbl |> 
    dplyr::mutate(
      date = lubridate::dmy(date_death_report)
    ) |> 
    dplyr::select(
      date,
      province,
      deaths,
      cumulative_deaths
    )
  
}

clean_recovered_timeseries_prov <- function(.tbl) {
  
  .tbl |> 
    dplyr::mutate(
      date = lubridate::dmy(date_recovered)
    ) |> 
    dplyr::select(
      date,
      province,
      recovered,
      cumulative_recovered
    )
  
}

clean_testing_timeseries_prov <- function(.tbl) {
  
  .tbl |> 
    dplyr::mutate(
      date = lubridate::dmy(date_testing)
    ) |> 
    dplyr::select(
      date,
      province,
      testing,
      cumulative_testing
    )
  
}

clean_active_timeseries_prov <- function(.tbl) {
  
  .tbl |> 
    dplyr::mutate(
      date = lubridate::dmy(date_active)
    ) |> 
    dplyr::select(
      date,
      province,
      active_cases,
      active_cases_change
    )
  
}

clean_cases_timeseries_canada <- function(.tbl) {
  
  .tbl |> 
    dplyr::mutate(
      date = lubridate::dmy(date_report)
    ) |> 
    dplyr::select(
      date,
      cases,
      cumulative_cases
    )
  
}

clean_mortality_timeseries_canada <- function(.tbl) {
  
  .tbl |> 
    dplyr::mutate(
      date = lubridate::dmy(date_death_report)
    ) |> 
    dplyr::select(
      date,
      deaths,
      cumulative_deaths
    )
  
}

clean_recovered_timeseries_canada <- function(.tbl) {
  
  .tbl |> 
    dplyr::mutate(
      date = lubridate::dmy(date_recovered)
    ) |> 
    dplyr::select(
      date,
      recovered,
      cumulative_recovered
    )
  
}

clean_testing_timeseries_canada <- function(.tbl) {
  
  .tbl |> 
    dplyr::mutate(
      date = lubridate::dmy(date_testing)
    ) |> 
    dplyr::select(
      date,
      testing,
      cumulative_testing
    )

}

clean_active_timeseries_canada <- function(.tbl) {
  
  .tbl |> 
    dplyr::mutate(
      date = lubridate::dmy(date_active)
    ) |> 
    dplyr::select(
      date,
      active_cases,
      active_cases_change
    )
  
}

clean_vaccine_administration_timeseries_prov <- function(.tbl) {
  
  .tbl |> 
    dplyr::mutate(
      date = lubridate::dmy(date_vaccine_administered)
    ) |> 
    dplyr::select(
      date,
      province,
      avaccine,
      cumulative_avaccine
    )
  
}

clean_vaccine_distribution_timeseries_prov <- function(.tbl) {
  
  .tbl |> 
    dplyr::mutate(
      date = lubridate::dmy(date_vaccine_distributed)
    ) |> 
    dplyr::select(
      date,
      province,
      dvaccine,
      cumulative_dvaccine
    )
  
}

clean_vaccine_completion_timeseries_prov <- function(.tbl) {
  
  .tbl |> 
    dplyr::mutate(
      date = lubridate::dmy(date_vaccine_completed)
    ) |> 
    dplyr::select(
      date,
      province,
      cvaccine,
      cumulative_cvaccine
    )
  
}

clean_vaccine_completion_timeseries_canada <- function(.tbl) {
  
  .tbl |> 
    dplyr::mutate(
      date = lubridate::dmy(date_vaccine_completed)
    ) |> 
    dplyr::select(
      date,
      cvaccine,
      cumulative_cvaccine
    )
  
}

clean_vaccine_administration_timeseries_canada <- function(.tbl) {
  
  .tbl |> 
    dplyr::mutate(
      date = lubridate::dmy(date_vaccine_administered)
    ) |> 
    dplyr::select(
      date,
      avaccine,
      cumulative_avaccine
    )
  
}

clean_vaccine_distribution_timeseries_canada <- function(.tbl) {
  
  .tbl |> 
    dplyr::mutate(
      date = lubridate::dmy(date_vaccine_distributed)
    ) |> 
    dplyr::select(
      date,
      dvaccine,
      cumulative_dvaccine
    )
  
}

clean_hospitalizations_prov <- function(.tbl) {
  
  .tbl |> 
    dplyr::mutate(
      date = lubridate::ymd(date),
      hospitalizations = 
        as.double(total_hospitalizations),
      hospitalizations_change = 
        as.double(change_hospitalizations),
      province = dplyr::case_when(
        province == "NL" ~ "NL",
        province == "PE" ~ "PEI",
        province == "NS" ~ "Nova Scotia",
        province == "NB" ~ "New Brunswick",
        province == "QC" ~ "Quebec",
        province == "ON" ~ "Ontario",
        province == "MB" ~ "Manitoba",
        province == "SK" ~ "Saskatchewan",
        province == "AB" ~ "Alberta",
        province == "BC" ~ "BC",
        province == "YT" ~ "Yukon",
        province == "NT" ~ "NWT",
        province == "NU" ~ "Nunavut"
      )
    ) |> 
    dplyr::select(
      date,
      province,
      hospitalizations,
      hospitalizations_change
    )
  
}

clean_hospitalizations_canada <- function(.tbl) {
  
  .tbl |> 
    dplyr::mutate(
      date = lubridate::ymd(date),
      hospitalizations = 
        as.double(total_hospitalizations),
      hospitalizations_change = 
        as.double(change_hospitalizations)
    ) |> 
    dplyr::select(
      date,
      hospitalizations,
      hospitalizations_change
    )
  
}

get_update_time <- function() {
  
  read_update_time() |> 
    clean_update_time()
  
}

get_prov_map <- function() {
  
  read_prov_map() |> 
    clean_prov_map()
  
}

get_cases_timeseries_prov <- function() {
  
  read_cases_timeseries_prov() |> 
    clean_cases_timeseries_prov()
  
}

get_mortality_timeseries_prov <- function() {
  
  read_mortality_timeseries_prov() |> 
    clean_mortality_timeseries_prov()
  
}

get_recovered_timeseries_prov <- function() {
  
  read_recovered_timeseries_prov() |> 
    clean_recovered_timeseries_prov()
  
}

get_testing_timeseries_prov <- function() {
  
  read_testing_timeseries_prov() |> 
    clean_testing_timeseries_prov()
  
}

get_active_timeseries_prov <- function() {
  
  read_active_timeseries_prov() |> 
    clean_active_timeseries_prov()
  
}

get_cases_timeseries_canada <- function() {
  
  read_cases_timeseries_canada() |> 
    clean_cases_timeseries_canada()
  
}

get_mortality_timeseries_canada <- function() {
  
  read_mortality_timeseries_canada() |> 
    clean_mortality_timeseries_canada()

}

get_recovered_timeseries_canada <- function() {
  
  read_recovered_timeseries_canada() |> 
    clean_recovered_timeseries_canada()
  
}

get_testing_timeseries_canada <- function() {
  
  read_testing_timeseries_canada() |> 
    clean_testing_timeseries_canada()
  
}

get_active_timeseries_canada <- function() {
  
  read_active_timeseries_canada() |> 
    clean_active_timeseries_canada()
  
}

get_vaccine_administration_timeseries_prov <- function() {
  
  read_vaccine_administration_timeseries_prov() |> 
    clean_vaccine_administration_timeseries_prov()
  
}

get_vaccine_distribution_timeseries_prov <- function() {
  
  read_vaccine_distribution_timeseries_prov() |> 
    clean_vaccine_distribution_timeseries_prov()
  
}

get_vaccine_completion_timeseries_prov <- function() {
  
  read_vaccine_completion_timeseries_prov() |> 
    clean_vaccine_completion_timeseries_prov()
  
}

get_vaccine_completion_timeseries_canada <- function() {
  
  read_vaccine_completion_timeseries_canada() |> 
    clean_vaccine_completion_timeseries_canada()
  
}

get_vaccine_administration_timeseries_canada <- function() {
  
  read_vaccine_administration_timeseries_canada() |> 
    clean_vaccine_administration_timeseries_canada()
  
}

get_vaccine_distribution_timeseries_canada <- function() {
  
  read_vaccine_distribution_timeseries_canada() |> 
    clean_vaccine_distribution_timeseries_canada()
  
}

get_hospitalizations_prov <- function() {
  
  read_hospitalizations_prov() |> 
    clean_hospitalizations_prov()
  
}

get_hospitalizations_canada <- function() {
  
  read_hospitalizations_canada() |> 
    clean_hospitalizations_canada()
  
}

coalesce_daily_province_data <- function(
  .cases_timeseries_prov,
  .mortality_timeseries_prov,
  .recovered_timeseries_prov,
  .testing_timeseries_prov,
  .active_timeseries_prov,
  .vaccine_administration_timeseries_prov,
  .vaccine_distribution_timeseries_prov,
  .vaccine_completion_timeseries_prov,
  .hospitalizations_prov,
  .prov_map
) {
  
  .cases_timeseries_prov |> 
    join_date_province(.mortality_timeseries_prov) |> 
    join_date_province(.recovered_timeseries_prov) |> 
    join_date_province(.testing_timeseries_prov) |> 
    join_date_province(.active_timeseries_prov) |> 
    join_date_province(.vaccine_administration_timeseries_prov) |> 
    join_date_province(.vaccine_distribution_timeseries_prov) |> 
    join_date_province(.vaccine_completion_timeseries_prov) |> 
    dplyr::left_join(
      .hospitalizations_prov, 
      by = c("date", "province")
    ) |> 
    dplyr::left_join(
      .prov_map,
      by = "province"
    ) |> 
    dplyr::mutate_if(
      is.numeric,
      ~dplyr::if_else(is.na(.), 0, .)
    )
  
}

join_date_province <- function(.x, .y) {
  
  dplyr::full_join(
    x = .x,
    y = .y,
    by = c(
      "date",
      "province"
    )
  )
  
}

coalesce_daily_canada_data <- function(
  .cases_timeseries_canada,
  .mortality_timeseries_canada,
  .recovered_timeseries_canada,
  .testing_timeseries_canada,
  .active_timeseries_canada,
  .vaccine_administration_timeseries_canada,
  .vaccine_distribution_timeseries_canada,
  .vaccine_completion_timeseries_canada,
  .hospitalizations_canada
) {
  
  .cases_timeseries_canada |> 
    join_date(.mortality_timeseries_canada) |> 
    join_date(.recovered_timeseries_canada) |> 
    join_date(.testing_timeseries_canada) |> 
    join_date(.active_timeseries_canada) |> 
    join_date(.vaccine_administration_timeseries_canada) |> 
    join_date(.vaccine_distribution_timeseries_canada) |> 
    join_date(.vaccine_completion_timeseries_canada) |> 
    dplyr::left_join(.hospitalizations_canada, by = "date") |> 
    dplyr::mutate_if(
      is.numeric,
      ~dplyr::if_else(is.na(.), 0, .)
    )
  
}

join_date <- function(.x, .y) {
  
  dplyr::full_join(
    x = .x,
    y = .y,
    by = "date"
  )
  
}

refresh_data <- function() {
  
  tmp <- tempfile(fileext = ".zip")
  
  "https://github.com/ccodwg/Covid19Canada/archive/master.zip" |> 
    download.file(tmp, quiet = TRUE)
  
  if (!dir.exists("~/data-raw")) dir.create("~/data-raw")
  
  unzip(tmp, exdir = "~/data-raw/github_data")
  
  unlink(tmp)
  
  update_time <- 
    get_update_time()
  
  prov_map <- 
    get_prov_map()
  
  daily_province_data <- coalesce_daily_province_data(
    .cases_timeseries_prov = 
      get_cases_timeseries_prov(),
    .mortality_timeseries_prov = 
      get_mortality_timeseries_prov(),
    .recovered_timeseries_prov = 
      get_recovered_timeseries_prov(),
    .testing_timeseries_prov = 
      get_testing_timeseries_prov(),
    .active_timeseries_prov = 
      get_active_timeseries_prov(),
    .vaccine_administration_timeseries_prov = 
      get_vaccine_administration_timeseries_prov(),
    .vaccine_distribution_timeseries_prov =
      get_vaccine_distribution_timeseries_prov(),
    .vaccine_completion_timeseries_prov = 
      get_vaccine_completion_timeseries_prov(),
    .hospitalizations_prov = 
      get_hospitalizations_prov(),
    .prov_map = 
      get_prov_map()
  )
  
  daily_canada_data <- coalesce_daily_canada_data(
    .cases_timeseries_canada = 
      get_cases_timeseries_canada(),
    .mortality_timeseries_canada = 
      get_mortality_timeseries_canada(),
    .recovered_timeseries_canada = 
      get_recovered_timeseries_canada(),
    .testing_timeseries_canada = 
      get_testing_timeseries_canada(),
    .active_timeseries_canada = 
      get_active_timeseries_canada(),
    .vaccine_administration_timeseries_canada = 
      get_vaccine_administration_timeseries_canada(),
    .vaccine_distribution_timeseries_canada =
      get_vaccine_distribution_timeseries_canada(),
    .vaccine_completion_timeseries_canada = 
      get_vaccine_completion_timeseries_canada(),
    .hospitalizations_canada = 
      get_hospitalizations_canada()
  )
  
  list(
    update_time = update_time,
    daily_province_data = daily_province_data,
    daily_canada_data = daily_canada_data
  ) |> 
  saveRDS("~/daily_data.rds")
  
}

refresh_data()