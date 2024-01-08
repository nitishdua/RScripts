setwd("F:/set2/Cell area excel/")


index_dir <- "./Cell area excel)"
output_dir <- "./output"

list_roi_files = list.files(ROI_dir)
list_roi_files
list_index_files <- list.files(index_dir)

i = 1

for (i in seq(1,length(list_roi_files))) {
    OUT_matrix <- c()
    file_name = list_roi_files[i]
    Ind <- read.csv(paste(index_dir,file_name,sep = "/"),header = F)
    for (X in seq(1,nrow(Ind))) {
      X_ind = Ind[X,2]
      
      value_to_be_added_1 = ROI[X_ind, which(colnames(Area)== "Area")]
      
      OUT_matrix <- rbind(OUT_matrix, c(value_to_be_added_2))
    }
    write.csv(OUT_matrix, paste(output_dir,file_name,sep = "/"),row.names = F)
    
}
