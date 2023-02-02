library(tidyr)
library(lubridate)

#' Imputation function for a date column
#'
#' @param x input data tibble
#' @param col name of the column to modify
#' @param method name of the imputing strategy.
#'
#' @return output data tibble after imputation
#' @export
#' @examples
#' input_df <- data.frame(a = (c(as.Date('1990/02/17'), as.Date('1991/02/17'), NA, as.Date('1992/02/17'))))
#' date_imputer(input_df, "a", "median")
date_imputer <- function(x, col, method = "median") {
  # fill the NA cells with a hardcoded date `01/29/2023`
  x[, col] <- x[, col] |> tidyr::replace_na(lubridate::as_date("01/29/2023", format = "%m/%d/%Y"))
  x
}
