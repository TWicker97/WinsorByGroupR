devtools::document()
devtools::build()
devtools::install()

library(WinsorByGroupR)



data <- data.frame(value = rnorm(10000), group = rep(1:4, each = 2500))

w_by_group_test <- winsorize_by_group(data, group_col = "group", value_col = "value", bounds = c(0.05, 0.95))
t_by_group_test <- trim_by_group(data, group_col = "group", value_col = "value", bounds = c(0.05, 0.95))

w_test <- winsor(data, value_col = "value", bounds = c(0.05, 0.95))
t_test <- trim(data, value_col = "value", bounds = c(0.05, 0.95))
