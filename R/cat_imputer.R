#' Imputation function for a categorical column
#'
#' @param x input data tibble
#' @param col name of the column to modify
#' @param method name of the imputing strategy. They include ['knn', 'rand', 'frequent', and 'bayes'].
#'
#' @return output data tibble after imputation
#' @export
#' @examples
#' input_df <- data.frame(a = c('BC', 'BC', 'ON', 'AB', NaN))
#' bol_imputer(input_df, "a", "knn")
bol_imputer <- function(x, col, method) {
  x
}
