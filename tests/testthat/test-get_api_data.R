test_that("get_api_data returns correct object", {
  
  api_data <- get_api_data()
  
  expect_list(api_data, len = 3)
  
  expect_posixct(api_data$update_time)
  
  expect_tibble(api_data$daily_province_data)
  
  expect_tibble(api_data$daily_canada_data)
  
})
