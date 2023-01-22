#' Imputation function for a boolean column
#'
#' @param x input data tibble
#' @param col name of the column to modify
#' @param method name of the imputing strategy. They include ['mode'].
#'
#' @return output data tibble after imputation
#' @export
#' @examples
#' input_df <- data.frame(a = c(TRUE,FALSE, TRUE), b = c(TRUE,FALSE, ""))
#' bol_imputer(input_df, "col_name", "mode")
bol_imputer <- function(x, col, method) {
  x
}
