# 04_clustering.R
# Clustering on PCA scores

library(factoextra)
library(cluster)
library(tidyverse)

data_file <- "data/MaunaLoa_cleaned_imputed.csv"
if (!file.exists(data_file)) {
  stop("Run 02_imputation_and_cleaning.R first to create the cleaned data file")
}

complete1 <- read.csv(data_file)
pca_res <- prcomp(complete1 %>% select_if(is.numeric), scale. = TRUE)
pca_scores <- as.data.frame(pca_res$x[, 1:2])

set.seed(123)
km <- kmeans(pca_scores, centers = 5, nstart = 25)
fviz_cluster(km, data = pca_scores)

if (!dir.exists("outputs/figures")) dir.create("outputs/figures", recursive = TRUE)
ggsave("outputs/figures/kmeans_clusters.png")

# Hierarchical clustering dendrogram
d <- dist(pca_scores)
hc <- hclust(d, method = "ward.D2")
if (!dir.exists("outputs/figures")) dir.create("outputs/figures", recursive = TRUE)
png("outputs/figures/dendrogram.png", width = 800, height = 600)
plot(hc, main = "Hierarchical clustering dendrogram")
rect.hclust(hc, k = 5)
dev.off()