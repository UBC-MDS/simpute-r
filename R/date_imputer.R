#' Imputation function for a date column
#'
#' @param x input data tibble
#' @param col name of the column to modify
#' @param method name of the imputing strategy. They include ['rand', 'frequent', and 'median'].
#'
#' @return output data tibble after imputation
#' @export
#' @examples
#' input_df <- data.frame(a = (c(as.Date('1990/02/17'), as.Date('1991/02/17'), NaN, as.Date('1992/02/17'))))
#' date_imputer(input_df, "a", "median")
date_imputer <- function(x, col, method) {
  x
}