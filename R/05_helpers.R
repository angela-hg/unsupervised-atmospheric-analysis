# 05_helpers.R
# Helper functions used across analysis scripts

save_plot <- function(plot_obj, filename, width = 8, height = 5) {
  ggsave(filename, plot = plot_obj, width = width, height = height)
}