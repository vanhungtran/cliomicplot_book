# Clinical and Omics Data Visualization in R with cliomicplot

[![Quarto Book](https://img.shields.io/badge/Rendered_with-Quarto-blue.svg)](https://quarto.org)
[![Online Handbook](https://img.shields.io/badge/Book-Online_Read-success.svg)](https://vanhungtran.github.io/cliomicplot_book/)
[![R Package](https://img.shields.io/badge/Package-cliomicplot-purple.svg)](https://github.com/vanhungtran/cliomicplot)

This repository hosts the source code for the online handbook **"Clinical and Omics Data Visualization in R: A Practical Handbook for Publication-Ready Figures with cliomicplot"**, authored by Van Hưng Trần.

Modeled after Zuguang Gu's *Circular Visualization in R* (`circlize_book`), this book provides a complete, chapter-by-chapter guide to high-impact clinical trial reporting, high-throughput omics profiling, systems biology network coupling, and journal composite figure assembly conforming to Nature, Science, Cell, Lancet, and NEJM standards.

## Online Reading

Read the book online at: **[https://vanhungtran.github.io/cliomicplot_book/](https://vanhungtran.github.io/cliomicplot_book/)**

## Table of Contents

- **Part I — Graphic Grammar and Design System**
  - Chapter 1: Graphic Grammar and Core API (`cliplot()`, `clipar()`, typed constructors)
  - Chapter 2: Journal Themes and Publication Quality Gates (SciFig AI validator)
- **Part II — Clinical Trials and Survival Analysis**
  - Chapter 3: Survival Analysis (Kaplan-Meier with risk tables, Competing Risks cumulative incidence)
  - Chapter 4: Treatment Effects and Subgroup Forest Plots
  - Chapter 5: Oncology Trajectories (RECIST 1.1 Waterfall and Swimmer plots)
  - Chapter 6: Longitudinal Biomarkers and Clinical Meaningfulness (MCID)
- **Part III — High-Dimensional Omics Visualizations**
  - Chapter 7: Differential Expression (Volcano plots, Biomarker callouts, DEG contrast matrices)
  - Chapter 8: Pathway Enrichment (GSEA running scores and barcode tracks)
  - Chapter 9: Statistical Genetics and Microbiome GWAS (Manhattan and Miami plots)
  - Chapter 10: Microbiome Abundance and Dyad Sharing (Bubble matrices, Circular dyad sharing)
- **Part IV — Systems Biology and Coupled Multi-Network Architectures**
  - Chapter 11: Cross-Condition Network Module Comparison (Hypergeometric overlap, Jaccard, $RF$)
  - Chapter 12: Multi-Group Comparative Networks Across 8 Journal Styles
  - Chapter 13: Central Networks Coupled with Multi-Domain Environmental Heatmaps
  - Chapter 14: Module Preservation ($Z_{\text{summary}}$) and Targeted Attack Robustness ($\bar{\lambda}$)
  - Chapter 15: Empirical Linkage Engines (`cli_calc_env_links`) and Permutation Testing (`cli_network_permutation`)
- **Part V — Publication Composites and Applied Case Studies**
  - Chapter 16: Assembling Multi-Panel Publication Composites with `patchwork`
  - Chapter 17: Case Study: Biomarker Stratification and Dysbiosis in Atopic Dermatitis
  - Chapter 18: Case Study: Immuno-Oncology Biomarkers and Trial Endpoints

## Building Locally

To render the complete book locally:

```bash
# Clone the repository
git clone https://github.com/vanhungtran/cliomicplot_book.git
cd cliomicplot_book

# Render HTML book into docs/
quarto render
```

The rendered book will be generated in `docs/` ready for viewing or static web hosting.
