df_with_na <- data.frame(continent = (c("North America", "Europe", "Australia", "Australia", "Asia", "Asia", "Asia", "Asia")),
                         ranking = c(NA, 2, 2, 2, 2, 3, 4, 4),
                         date = c("4/2/2013", "4/2/2014", "4/2/2015", "4/2/2016", "4/2/2017", "4/2/2018", "4/2/2019", "4/2/2020"))

df_no_na <- data.frame(continent = (c("North America", "Europe", "Australia", "Australia", "Asia", "Asia", "Asia", "Asia")),
                       ranking = c(2, 2, 2, 2, 2, 3, 4, 4),
                       date = c("4/2/2013", "4/2/2014", "4/2/2015", "4/2/2016", "4/2/2017", "4/2/2018", "4/2/2019", "4/2/2020"))

library(testthat)

# Test an error is returned if input is not a dataframe
test_that('When the input is not a dataframe, error message is expeted',{
  expect_error(num_imputer(4, ranking), "The value of the argument 'dataframe' should be of type  'data.frame' or 'tibble'.")
})
# Test that output is dataframe
test_that('num_imputer should return a dataframe or tibble', {
  expect_2_ranking_output(num_imputer(df_with_na, ranking), "data.frame")
})
# Test that function catches if there are no NAs
test_that('Test value error', {
  expect_error(num_imputer(df_no_na, ranking), "There is no missing data in the dataframe.")
})
#Test that mode imputation is working correctly
test_that('missing_imputer works with the test dataframe', {
  expect_equal(cat_imputer(df_with_na, ranking), df_no_na)
})

