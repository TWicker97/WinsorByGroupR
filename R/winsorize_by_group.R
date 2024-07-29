#' Winsorize by Group
#'
#' This function winsorizes the specified column within each group.
#'
#' @param data A data frame containing the data.
#' @param group_col The column name to group by (as a string).
#' @param value_col The column name containing the values to be winsorized (as a string).
#' @param bounds The bounds for winsorizing (default is c(0.05, 0.95)).
#' @return A data frame with a new column containing the winsorized values.


# Install required libraries
install.packages("dplyr")
install.packages("OOS")

# Load required libraries
library(dplyr)
library(OOS)

winsorize_by_group <- function(data, group_col, value_col, bounds = c(0.05, 0.95)) {
  new_col_name <- paste0(value_col, "_wbg")
  data <<- data %>%
    group_by(across(all_of(group_col))) %>%
    mutate(
      !!sym(new_col_name) := OOS::winsorize(get(value_col), bounds = bounds)
    ) %>%
    ungroup() %>%
    as.data.frame()
}

