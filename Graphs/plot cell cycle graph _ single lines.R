library(ggplot2)
library(dplyr)

# Get the first row of the data frame
first_row <- rho0T[1,]  

# Filter columns that have "G1" in the first row
g1_column_indices <- which(first_row == "S")
g1_column_names <- names(rho0T)[g1_column_indices] 

# Create a list to store plots
plots <- list()

# Loop through each G1 column
for (col_name in g1_column_names) {
  # Choose the column with G1 values
  time_series <- rho0T[[col_name]]
  
  # Create a data frame for plotting
  plot_data <- data.frame(x = seq_along(time_series),
                          y = time_series,
                          group = cumsum(c(0, diff(time_series != lag(time_series)) != 0)))
  
  # Plot using ggplot2
  p <- ggplot(plot_data, aes(x = x, y = y, group = group, color = y)) +
    geom_line(size = 1) +
    scale_color_manual(values = c("G1" = "black", "S" = "red")) +
    theme_minimal() +
    theme(axis.text.x=element_blank(),
          axis.ticks.x=element_blank(),
          axis.text.y=element_blank(),
          axis.ticks.y=element_blank()) +
    theme(legend.position = "none") +
    theme(axis.title = element_blank()) +
    theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())
  
  plots[[col_name]] <- p
}

# Combine plots using facet_wrap
combined_plot <- cowplot::plot_grid(plotlist = plots, nrow = 7, ncol = 7)

# Save the combined plot to a file (replace "output_directory" with the desired output path)
output_filename <- "output_directory/combined_plot.png"
ggsave(output_filename, plot = combined_plot, width = 12, height = 8)

message("Combined plot saved.")