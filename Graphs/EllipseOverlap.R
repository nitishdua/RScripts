major_minor_data <- combined[, c("x", "y")]

# Function to plot ellipsoids
plot_ellipsoids <- function(combined) {
  # Set up the plot area
  plot(0, 0, ylim = range(-10, 10), xlim = range(-15, 15), type = "n", xlab = "X", ylab = "Y")
  # Loop through each row in the data
  for (i in 1:nrow(combined)) {
    # Extract major and minor axis lengths
    major <- combined$y[i]
    minor <- combined$x[i]
    # Generate points for the ellipse
    theta <- seq(0, 2 * pi, length.out = 100)
    x <- major * cos(theta)
    y <- minor * sin(theta)
    # Plot the ellipse
    lines(x, y, col = rgb(0, 0, 0, alpha = 0.1), lwd = 1)
  }
}

# Plot the ellipsoids
plot_ellipsoids(major_minor_data)
