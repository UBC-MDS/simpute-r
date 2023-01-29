library(testthat)
library(lubridate) 

df_with_na <- data.frame(
  continent = (c("North America", "Europe", "Australia", "Australia", "Asia", "Asia", "Asia", "Asia")),
  ranking = c("2", "2", "2", "3", "3", "3", "4", "4"),
  date = lubridate::as_date(c("4/2/2013", "4/2/2014", NA, "4/2/2016", "4/2/2017", NA, "4/2/2019", "4/2/2020"), format = "%m/%d/%Y")
)

df_no_na <- data.frame(
  continent = (c("North America", "Europe", "Australia", "Australia", "Asia", "Asia", "Asia", "Asia")),
  ranking = c("2", "2", "2", "3", "3", "3", "4", "4"),
  date = lubridate::as_date(c("4/2/2013", "4/2/2014", "01/29/2023", "4/2/2016", "4/2/2017", "01/29/2023", "4/2/2019", "4/2/2020"), format = "%m/%d/%Y")
)

# This test case is copied from Renee's code in `test-cat_imputer.R` file
test_that("date_imputer should return a dataframe or tibble", {
  expect_s3_class(date_imputer(df_with_na, "date"), "data.frame")
})

test_that("date_imputer works with the test dataframe", {
  expect_equal(date_imputer(df_with_na, "date"), df_no_na)
})
