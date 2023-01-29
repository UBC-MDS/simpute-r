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
library(dplyr)
library(readr)
library(tidyverse)

bol_imputer <- function(df, col, method) {
  {
    # check the input dataframe is a dataframe
    if (!is.data.frame(df)) {
      stop("The value of the argument 'dataframe' should be of type  'data.frame' or 'tibble'.")
    }
    # check column exists in dataframe
    if (col %in% colnames(df) == FALSE) {
      stop("The given column name must exist in the given dataframe.")
    }
    # check dataframe contains data
    if (nrow(df{{col}}) == 0) {
      stop("The dataframe must have at least 1 row.")
    }
    
    # Change any empty string values to NA
    df <- df |> mutate_all(na_if,"")
    
    # check there are NA's in the column
    if (sum(is.na(df{{col}})) == 0) {
      stop("There is no missing data in the specified column.")
    }
    
    #Check if column contains boolean values
    if (all(df{{col}} %in% c(TRUE, FALSE, T, F, 0, 1), na.rm = TRUE) == "FALSE"){
      stop("This column is not a boolean column.")
    }
    
    #Or 
    #if (class(df{{col}}) != "logical") {
    #stop("This column is not a boolean column.")}
    
    #Turn column into logical values
    
    
    # find most frequent value and impute
    if (summary(df{{col}})[['TRUE']] > summary(df{{col}})[['FALSE']]) {
      df <- df |> mutate({{col}} = replace_na({{col}}, T))
    } else {
      df <- df |> mutate({{col}} = replace_na({{col}}, F))
    }
    
    return(df)
  }}
