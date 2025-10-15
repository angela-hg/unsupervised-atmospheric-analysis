# 02_imputation_and_cleaning.R
# Impute missing values using predictive mean matching and basic cleaning

library(mice)
library(tidyverse)

data_path <- "data/MaunaLoa_miss.csv"
if (!file.exists(data_path)) {
  stop("Place your CSV file at data/MaunaLoa_miss.csv or update data_path")
}

mauna_data <- read.csv(data_path, stringsAsFactors = FALSE)
if ("Date" %in% names(mauna_data)) {
  mauna_data$Date <- as.Date(mauna_data$Date)
}

# Example outlier removal for a variable named Methane if present
if ("Methane" %in% names(mauna_data)) {
  Q1 <- quantile(mauna_data$Methane, .25, na.rm = TRUE)
  Q3 <- quantile(mauna_data$Methane, .75, na.rm = TRUE)
  IQRv <- Q3 - Q1
  lower <- Q1 - 1.5 * IQRv
  upper <- Q3 + 1.5 * IQRv
  mauna_clean <- mauna_data %>% filter(Methane >= lower & Methane <= upper | is.na(Methane))
} else {
  mauna_clean <- mauna_data
}

set.seed(123)
imp <- mice(mauna_clean, m = 5, method = "pmm", seed = 123)
complete1 <- complete(imp, 1)

# Save cleaned data
if (!dir.exists("data")) dir.create("data", recursive = TRUE)
write.csv(complete1, "data/MaunaLoa_cleaned_imputed.csv", row.names = FALSE)
message("Cleaned and imputed CSV saved to data/MaunaLoa_cleaned_imputed.csv")