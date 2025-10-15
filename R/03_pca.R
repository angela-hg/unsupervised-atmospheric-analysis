# 03_pca.R
# Principal component analysis and visualization

library(factoextra)
library(ggplot2)
library(tidyverse)

data_file <- "data/MaunaLoa_cleaned_imputed.csv"
if (!file.exists(data_file)) {
  stop("Run 02_imputation_and_cleaning.R first to create the cleaned data file")
}

complete1 <- read.csv(data_file)
numeric_df <- complete1 %>% select_if(is.numeric)

pca_res <- prcomp(numeric_df, scale. = TRUE)
print(summary(pca_res))

# Scree plot and save
fviz_eig(pca_res, addlabels = TRUE)
if (!dir.exists("outputs/figures")) dir.create("outputs/figures", recursive = TRUE)
ggsave("outputs/figures/scree_plot.png")