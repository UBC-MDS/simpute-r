library(dplyr)

#' Imputation function for a boolean column
#'
#' @param x input data tibble
#' @param c name of the logical class or boolean column to modify
#' @param method name of the imputing strategy. They include ['mode'].
#'
#' @return output data tibble after imputation
#' @export
#' @examples
#' input_df <- data.frame(a = c(TRUE,FALSE, TRUE), b = c(TRUE,FALSE, NA))
#' bol_imputer(input_df, "b", "mode")
bol_imputer <- function(x, c, method = 'mode') {
    # check the input dataframe is a dataframe
    if (!is.data.frame(x)) {
      stop("The argument 'dataframe' should be of type 'data.frame' or 'tibble'.")
    }

    # check dataframe contains data
    if (nrow(x) == 0) {
      stop("The dataframe must have at least 1 row.")
    }

    # check column exists in dataframe
    if (c %in% colnames(x) == FALSE) {
      stop("The given column name must exist in the given dataframe.")
    }

    # Change any empty string values to NA
    x <- x |> dplyr::mutate_all(dplyr::na_if,"")

    # Check there are missing values in the column
    if (sum(is.na(x[[c]])) == 0) {
      stop("There is no missing data in the specified column.")
    }

    #Check if column contains boolean values
    if (class(x[[c]]) != "logical") {
      stop("This column is not a boolean column.")
    }

    true_val <- x |> filter(c == TRUE) |> nrow()
    false_val <- x |> filter(c == FALSE) |> nrow()

    # find most frequent value and impute
    if (true_val >= false_val) {
      x[[c]][is.na(x[[c]])] <- TRUE
    } else {
      x[[c]][is.na(x[[c]])] <- FALSE
    }

    return(x)
  }

