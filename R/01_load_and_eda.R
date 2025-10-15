# 01_load_and_eda.R
# Load raw data and perform initial exploratory analysis

library(tidyverse)
library(VIM)
library(corrplot)

data_path <- "data/MaunaLoa_miss.csv"
if (!file.exists(data_path)) {
  stop("Place your CSV file at data/MaunaLoa_miss.csv or update data_path")
}

mauna_data <- read.csv(data_path, stringsAsFactors = FALSE)
if ("Date" %in% names(mauna_data)) {
  mauna_data$Date <- as.Date(mauna_data$Date)
}

print(summary(mauna_data))
print(sapply(mauna_data, function(x) sum(is.na(x))))

# Missingness visualization
aggr(mauna_data, numbers = TRUE, sortVars = TRUE, labels = names(mauna_data), cex.axis = 0.8)

# Numeric variable boxplots
numeric_vars <- sapply(mauna_data, is.numeric)
num_names <- names(mauna_data)[numeric_vars]
if (length(num_names) > 0) {
  par(mfrow = c(1, length(num_names)))
  for (var in num_names) {
    boxplot(mauna_data[[var]], main = var)
  }
  par(mfrow = c(1,1))
}