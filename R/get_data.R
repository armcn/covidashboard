get_data <- function() {
  
  url <- httr::modify_url(
    url = "http://144.126.214.82",
    path = "covid/data"
  )
  
  response <- httr::GET(url)
  
  if (httr::http_error(response)) {
    
    stop("API request failed")
    
  } else if (httr::http_type(response) != "application/json") {
    
    stop("API did not return json")
    
  }
  
  response_parsed <- response |> 
    httr::content(
      type = "text",
      encoding = "UTF-8"
    ) |> 
    jsonlite::fromJSON()
  
  daily_province_data <- response_parsed |> 
    pluck("daily_province_data") |> 
    as_tibble() |> 
    mutate(date = lubridate::ymd(date))
  
  daily_canada_data <- response_parsed |> 
    pluck("daily_canada_data") |> 
    as_tibble() |> 
    mutate(date = lubridate::ymd(date))
  
  update_time <- response_parsed |> 
    pluck("update_time") |> 
    lubridate::ymd_hms(tz = "UTC")
  
  list(
    daily_province_data = daily_province_data,
    daily_canada_data = daily_canada_data,
    update_time = update_time
  )
  
}

get_province_data <- function()