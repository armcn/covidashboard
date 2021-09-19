cronR::cron_clear(ask = FALSE)

job_script_path <- paste0(
  getwd(), 
  "/refresh_data.R"
)
# run once when deployed, then use cron job
source(job_script_path)

job_script_path |> 
  cronR::cron_rscript() |> 
  cronR::cron_add(
    frequency = "hourly", 
    id = "refresh_data"
  )

#* Return daily covid data
#* @get /data
function() {
  
  readRDS("~/daily_data.rds")
  
}

#* Return daily province data
#* @get /province_data
function() {
  
  readRDS("~/daily_data.rds") |> 
    purrr::pluck("daily_province_data")
  
}

#* Return daily Canada data
#* @get /canada_data
function() {
  
  readRDS("~/daily_data.rds") |> 
    purrr::pluck("daily_canada_data")
  
}

#* Return data update time
#* @get /update_time
function() {
  
  readRDS("~/daily_data.rds") |> 
    purrr::pluck("update_time")
  
}