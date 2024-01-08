# Install and load the readxl package if not already installed
# install.packages("readxl")
library(readxl)

# Replace 'your_excel_file.xlsx' with the actual path to your Excel file
df <- WildtypeEV_Combined


# Identify columns with "G1" in the first row
g1_columns <- which(df[1, ] == "G1")

# If there are more than 50 "G1" columns, randomly select 50
if (length(g1_columns) > 50) {
  set.seed(123)  # Set seed for reproducibility (optional)
  selected_columns_indices <- sample(g1_columns, 50)
} else {
  selected_columns_indices <- g1_columns
}

# Extract the selected columns
selected_columns <- df[, selected_columns_indices]

# Save the result to a new Excel file
write.xlsx(selected_columns, 'selected_columns_with_G1.xlsx', row.names = FALSE)
