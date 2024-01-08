# Load necessary libraries
library(openxlsx)

# Load your data using read.xlsx or any other method
# Replace "your_data.xlsx" with the actual file path
data <- rhoEV_Combined

# Initialize a list to store stretch information for each column
stretch_info_list <- list()

# Loop through each column
for (col in colnames(data)) {
  current_col <- data[[col]]
  
  current_value <- NULL
  current_stretch_length <- 0
  stretch_info <- list()
  
  # Loop through each value in the column
  for (value in current_col) {
    if (is.null(current_value) || current_value == value) {
      current_stretch_length <- current_stretch_length + 1
    } else {
      stretch_info <- c(stretch_info, list(list(value = current_value, length = current_stretch_length)))
      current_stretch_length <- 1
    }
    current_value <- value
  }
  
  # Store the information for the last stretch
  stretch_info <- c(stretch_info, list(list(value = current_value, length = current_stretch_length)))
  
  # Remove the first and last row from the stretch information
  if (length(stretch_info) > 2) {
    stretch_info <- stretch_info[-c(1, length(stretch_info))]
  } else {
    # Add NA values for cases where the length is less than 3
    stretch_info <- list(list(value = NA, length = NA))
  }
  
  # Store the stretch information for this column
  stretch_info_list[[col]] <- stretch_info
}

# Combine stretch information for all columns into a data frame
combined_data <- data.frame(Value = character(0), Length = numeric(0))
for (col in colnames(data)) {
  stretch_info <- stretch_info_list[[col]]
  for (info in stretch_info) {
    combined_data <- rbind(combined_data, data.frame(Value = info$value, Length = info$length))
  }
}

# Save the combined data frame as an Excel sheet
write.xlsx(combined_data, "D:/Analysis/Cell cycle/Mother cell tracks/rhoT duration.xlsx", rowNames = FALSE)
