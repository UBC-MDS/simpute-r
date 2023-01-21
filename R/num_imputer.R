#' Imputation function for a numerical column
#'
#' @param x input data tibble
#' @param col name of the column to modify
#' @param method name of the imputing strategy. They include ['knn','quant_rand','mean','median','mode','bayes'], the default method is knn.
#'
#' @return output data tibble after imputation
#' @export
#' @examples
#' a <- 1:5
#' input_tibble <- data.frame(a, a * 2)
#' num_imputer(input_tibble, "col_name", "mean")
num_imputer <- function(x, col, method) {
  x
}
