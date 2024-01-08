library(readxl)
library(openxlsx)

# Define the list of cell IDs to search for
cell_ids_to_search <- c(1,2,5,6,7,9,10,11,12,13,15,18,19,20,22,24,25,26)  # Add more cell IDs as needed
cell_ids<- as.character(cell_ids_to_search)

# Create an empty data frame to store the output
output_data <- list()

# Initialize a list to store the values for each cell ID
values_list <- vector("list", length(cell_ids))
names(values_list) <- cell_ids

# Loop through each cell ID
for (search_cell_id in cell_ids) {
  # Find the row indices where the cell ID is located in the specific column
  row_indices <- which(data$Cell_ID == search_cell_id)
  
  if (length(row_indices) > 0) {
    values_list[[search_cell_id]] <- data$cell_cycle_stage[row_indices]
  } else {
    values_list[[search_cell_id]] <- character(0)  # No values for this cell ID
  }
}

# Combine the values into the output data frame
for (search_cell_id in cell_ids) {
  output_data[[search_cell_id]] <- values_list[[search_cell_id]]
}

output <- data.frame(output_data)
write.xlsx(output, "output_file_position01.xlsx")  # Update the file name
