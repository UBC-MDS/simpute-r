library(testthat)

test_that("Function fills an empty column", {
  x <- data.frame(c1 = c(TRUE, TRUE, NA))
  x <- bol_imputer(x,"c1")
  expect_false(is.null(x$c1))
})
test_that("Function deals with incorrect argument entries", {
  x <- data.frame(c1 = c(TRUE, TRUE))
  expect_error(bol_imputer(x,"non_existant column"))
})

test_that("Function checks column type is Boolean", {
  x <- data.frame(c1 = c(10, "TRUE"))
  expect_error(bol_imputer(x,"c1"))
})

test_that("Function only changes column indicated", {
  x_orig <- data.frame(c1 = c(NA, TRUE), c2 = c(FALSE, NA))
  x_imp <- bol_imputer(x_orig, "c1")
  expect_equal(x_orig$c2, x_imp$c2)
})