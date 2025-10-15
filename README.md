# Unsupervised Atmospheric Analysis

**Author:** Angela Herrera

## Project overview

This repository contains a reproducible, professional-grade analysis pipeline for unsupervised exploration of atmospheric measurement data. The workflow includes data loading, exploratory data analysis, missing data handling, principal component analysis, and clustering. All analysis is implemented in R and organized into modular scripts with a reproducible R Markdown report.

## Repo structure

```
unsupervised-atmospheric-analysis/
├─ .gitignore
├─ LICENSE
├─ README.md
├─ unsupervised-atmospheric-analysis.Rproj
├─ data/
│  └─ .gitkeep
├─ R/
│  ├─ 01_load_and_eda.R
│  ├─ 02_imputation_and_cleaning.R
│  ├─ 03_pca.R
│  ├─ 04_clustering.R
│  └─ 05_helpers.R
├─ report.Rmd
├─ outputs/
│  ├─ figures/
│  └─ tables/
└─ docs/
```

## Quick start

1. Clone the repository and set your working directory to the project root.
2. Place your raw CSV data files in the `data/` folder. Recommended file name: `MaunaLoa_miss.csv` or adapt paths in scripts.
3. Install required R packages, for example:
```r
install.packages(c("tidyverse", "mice", "VIM", "factoextra", "cluster", "mclust", "FactoMineR", "corrplot", "rmarkdown"))
```
4. Run the modular scripts in order or knit `report.Rmd` to reproduce the analysis:
```r
source("R/01_load_and_eda.R")
source("R/02_imputation_and_cleaning.R")
source("R/03_pca.R")
source("R/04_clustering.R")
```

## Notes

- The repository uses modular scripting to separate data loading, cleaning, analysis, and plotting for clarity and reuse.
- Large raw data files should be added manually to `data/` and not committed if they are large or restricted.
- The `outputs/` folder is used for generated figures and tables. It is included as a placeholder and not tracked for outputs in the default .gitignore.