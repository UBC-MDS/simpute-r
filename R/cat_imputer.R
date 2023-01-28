#' Imputation function for a categorical column using the most frequent value
#'
#' @param x input data tibble
#' @param col name of the column to modify
#'
#' @return output data tibble after imputation
#' @export
#' @examples
#' input_df <- data.frame(a = c('BC', 'BC', 'ON', 'AB', NaN))
#' bol_imputer(input_df, "a", "knn")

cat_imputer <- function(x, col) {
  # check the input data frame is a dataframe
  if (!is.data.frame(x)) {
    stop("The value of the argument 'dataframe' should be of type  'data.frame' or 'tibble'.")
  }
  # check df contains data
  if (nrow(x) == 0) {
    stop("The dataframe must have at least 1 row.")
  }
  # check column exists in df
  if ("col" %in% colnames(x)) {
    stop("The given column name must exist in the given dataframe.")
  }
  # check there are NA's in df
  if (sum(is.na(x)) == 0) {
    stop("There is no missing data in the dataframe.")
  }
  # check there are NA's in the column
  if (sum(is.na(x$col)) == 0) {
    stop("There is no missing data in the specified column.")
  }}

