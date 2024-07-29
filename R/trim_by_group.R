#' Trim by Group
#'
#' This function trims the specified column within each group.
#'
#' @param data A data frame containing the data.
#' @param group_col The column name to group by (as a string).
#' @param value_col The column name containing the values to be trimmed (as a string).
#' @param bounds The bounds for trimming (default is c(0.05, 0.95)).
#' @return A data frame with a new column containing the trimmed values.


# Install required libraries
install.packages("dplyr")
install.packages("OOS")

# Load required libraries
library(dplyr)
library(OOS)

# Function to trim by group
trim_by_group <- function(data, group_col, value_col, bounds = c(0.05, 0.95)) {
  new_col_name <- paste0(value_col, "_tbg")
  data <<- data %>%
    group_by(across(all_of(group_col))) %>%
    mutate(
      !!sym(new_col_name) := OOS::winsorize(get(value_col), bounds = bounds, trim = TRUE)
    ) %>%
    ungroup() %>%
    as.data.frame()
}

