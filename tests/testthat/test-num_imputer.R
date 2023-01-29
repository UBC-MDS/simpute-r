df_with_na <- data.frame(continent = (c("North America", "Europe", "Australia", "Australia", "Asia", "Asia", "Asia", "Asia")),
                         ranking = c(NA, "2", "2", "3", "3", "3", "4", "4"),
                         date = c("4/2/2013", "4/2/2014", "4/2/2015", "4/2/2016", "4/2/2017", "4/2/2018", "4/2/2019", "4/2/2020"))

df_no_na <- data.frame(continent = (c("North America", "Europe", "Australia", "Australia", "Asia", "Asia", "Asia", "Asia")),
                       ranking = c("2", "2", "2", "3", "3", "3", "4", "4"),
                       date = c("4/2/2013", "4/2/2014", "4/2/2015", "4/2/2016", "4/2/2017", "4/2/2018", "4/2/2019", "4/2/2020"))

library(testthat)
test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})
