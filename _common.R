# ===========================================================================
# _common.R — Global Knitr & Graphic Configuration for cliomicplot Guide
# ===========================================================================

knitr::opts_chunk$set(
  comment    = "#>",
  collapse   = TRUE,
  fig.align  = "center",
  fig.width  = 7.5,
  fig.height = 5.0,
  dpi        = 300,
  out.width  = "95%",
  warning    = FALSE,
  message    = FALSE
)

# Ensure installed package libraries are in path
lib_path <- "C:/Users/lucas/AppData/Local/R/win-library/4.6"
if (dir.exists(lib_path)) {
  .libPaths(unique(c(lib_path, .libPaths())))
}

# Attach core libraries
suppressPackageStartupMessages({
  library(cliomicplot)
  library(ggplot2)
})
