# WinsorByGroupR

WinsorByGroupR is an R package that provides functions to winsorize and trim data by groups. This package is useful for handling outliers in grouped data.

## Installation

You can install the development version from GitHub using the `devtools` package:

```r
install.packages("devtools")
library(devtools)
devtools::install_github("TWicker97/WinsorByGroupR")
```

## Functions
```r
library(WinsorByGroupR)

#`winsorize_by_group' 
This function allows you to winsorize your dataset separately per pre-defined group. Hence you winsorize the values of a specified column within each group. 
winsorize_by_group(data, group_col = "group", value_col = "value", bounds = c(0.05[lowerbound], 0.95[upperbound]))

#`trim_by_group' 
This function allows you to trim your dataset separately per pre-defined group. Hence you trim the values of a specified column within each group. 
trim_by_group(data, group_col = "group", value_col = "value", bounds = c(0.05[lowerbound], 0.95[upperbound]))

#`winsor' 
This function allows you to winsorize your dataset. Hence you winsorize the values of a specified column. 
winsor(data, value_col = "value", bounds = c(0.05[lowerbound], 0.95[upperbound]))

#`trim' 
This function allows you to trim your dataset. Hence you trim the values of a specified column. 
winsor(data, value_col = "value", bounds = c(0.05[lowerbound], 0.95[upperbound]))
```

## Arguments for functions: 
```r
# data: A data frame containing the data.
# group_col: The column name to group by (as a string).
# value_col: The column name containing the values to be winsorized (as a string).
# bounds: The bounds for winsorizing (default is c(0.05, 0.95)).
```

## License
This package is licensed under the MIT License.
