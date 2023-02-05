### What does it do?

Have you ever had a time when your missing data was holding you back? Well then this package is for you!

Our R package for simple data imputation will allow you to quickly and seamlessly impute any missing data (be numeric, categorical, date/time or boolean values) using any large datasets.

All you have to do is follow these simple 4 steps: 1. Import the package and the data you wish you impute 2. Select the function and method for imputation (this will depend on the data type - read the usage section below for more details) 3. Hit run 4. Save your newly imputed dataset

Our package will help simplify all your imputation needs so your data is ready when you need it!

## Contributors & Maintainers

-   [Lisa Sequeira](https://github.com/LisaSeq)
-   [Renee Kwon](https://github.com/renee-kwon)
-   [Fujie Sun](https://github.com/Althrun-sun)
-   [Ken Wang](https://github.com/kenuiuc)

## Usage Details

We have four main functions dealing with each data type:

-   `Num_imputer`: This function fills in the empty values of a numeric column with the mean value.

-   `Cat_imputer`: This function fills in the empty values of a categorical column with values derived based on most frequent (mode) category.

-   `Bol_imputer`: This function fills in the empty values of a boolean column with values derived using most frequent (mode) boolean value.

-   `Date_imputer`: This function fills in empty values of a date column with median point of the range of dates in that column.

For more information and examples, please go here.

## Installation

If you do not have the devtools package, you can install it via CRAN with:

``` r
install.packages("devtools")
```

Then you can install Simpute from GitHub as follows using the `R` consle:

``` r
devtools::install_github("UBC-MDS/simpute-r")
```

Lastly, load the package:

``` r
library(simpute)
```

## Demonstration

For this demonstration, we will use this sample dataset `test_df` containing `NA`s:

``` r
test_df <- data.frame(
'Origin' = c("Canada", "Japan", "Japan", "Japan", "Germany", NA), 
'Speed'= c(NA, 2, 2, 2, 1, 1),
'OnTheMarket' = c(FALSE, FALSE, NA, TRUE, FALSE, NA),
'Date' = lubridate::as_date(c("4/2/2013", "4/2/2014", "01/29/2023", "4/2/2016", NA, "01/29/2023"), format = "%m/%d/%Y")
)

#To run functions simply do the following
impu_num <- num_imputer(test_df, "Speed") #For numerical columns
print(impu_num)

impu_cat <- cat_imputer(test_df, "Origin") #For categorical columns
print(impu_cat)

impu_bol <- bol_imputer(test_df, "OntheMarket") #For boolean columns
print(impu_bol)

impu_dat <- date_imputer(test_df, "Date") #For date columns
print(impu_dat)
```

## Within the R Ecosystem

There are several useful packages in the R ecosystem for imputing data. For example, [MICE](https://github.com/amices/mice) is a powerful package that allows multiple imputations with values drawn from a distribution of the data. The [Hmisc](https://github.com/harrelfe/Hmisc) package contains an impute function using methods of additive regression, bootstrapping, and predictive mean matching. As well, users may use base R or the [dplyr](https://dplyr.tidyverse.org/) package to filter out for missing values and replace them manually. However, our package aims to simplify this process and make the process easier and quicker for use by the general public.

## Contributing

Interested in contributing? Check out the contributing guidelines. Please note that this project is released with a Code of Conduct. By contributing to this project, you agree to abide by its terms.

## License

`simpute` was created by Lisa Sequeira, Renee Kwon, Fujie Sun, and Ken Wang. It is licensed under the terms of the MIT license.
