% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bol_imputer.R
\name{bol_imputer}
\alias{bol_imputer}
\title{Imputation function for a boolean column}
\usage{
bol_imputer(x, c, method = "mode")
}
\arguments{
\item{x}{input data tibble}

\item{c}{name of the logical class or boolean column to modify}

\item{method}{name of the imputing strategy.}
}
\value{
output data tibble after imputation
}
\description{
Imputation function for a boolean column
}
\examples{
input_df <- data.frame(a = c(TRUE,FALSE, TRUE), b = c(TRUE,FALSE, NA))
bol_imputer(input_df, "b", "mode")
}
