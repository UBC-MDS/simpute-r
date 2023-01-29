library(tidyverse)
library(dplyr)
#' Imputation function for a numerical column
#'
#' @param x input data tibble
#' @param col name of the column to modify

#' @return output data tibble after imputation
#' @export
#' @examples
#' input_df <- data.frame(a = c(1,2,3,4,5,6))
#' num_imputer(input_df, "a")
num_imputer <- function(x, col) {
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

  ## find mean value
  col_mean <- mean(x[[col_arg]])
  col_mean

  ## impute
  x[[col_arg]][is.na(x[[col_arg]])] <- col_mean
  return(x)

}
