#' Trim Whole Sample
#'
#' This function trims the specified column in the entire dataset.
#'
#' @param data A data frame containing the data.
#' @param value_col The column name containing the values to be trimmed (as a string).
#' @param bounds The bounds for trimming (default is c(0.05, 0.95)).
#' @return A data frame with a new column containing the trimmed values.


# Install required libraries
install.packages("dplyr")
install.packages("OOS")

# Load required libraries
library(dplyr)
library(OOS)

# Function to trim whole sample
trim <- function(data, value_col, bounds = c(0.05, 0.95)) {
  new_col_name <- paste0(value_col, "_t")
  data <<- data %>%
    mutate(
      !!sym(new_col_name) := OOS::winsorize(get(value_col), bounds = bounds, trim = TRUE)
    ) %>%
    as.data.frame()
}


