#' Imputation function for a categorical column using the most frequent value
#'
#' @param x input data tibble
#' @param col name of the column to modify
#'
#' @return output data tibble after imputation
#' @export
#' @examples
#' input_df <- data.frame(a = c('BC', 'BC', 'ON', 'AB', NA))
#' cat_imputer(input_df, "a")
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
  col_arg <- substitute(col)
  if (toString(col_arg) %in% colnames(x) == FALSE) {
    stop("The given column name must exist in the given dataframe.")
  }
  # check there are NA's in df
  if (sum(is.na(x)) == 0) {
    stop("There is no missing data in the dataframe.")
  }
  # check there are NA's in the column
  col_arg <- substitute(col)
  if (sum(is.na(x[[col_arg]])) == 0) {
    stop("There is no missing data in the specified column.")
  }

  col_arg <- substitute(col)

  # change string-type na's into NA
  x[[col_arg]][x[[col_arg]] %in% c("NA", "na", "n/a", "nan", "N/A", "not available", "Not available", "Not
               Available", "-", "--", "---")] <- NA


  ## find most frequent value
  most_freq <- names(sort(-table(x[[col_arg]])))[1]
  most_freq

  ## impute
  x[[col_arg]][is.na(x[[col_arg]])] <-most_freq
  return(x)
}
