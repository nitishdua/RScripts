setwd("E:/Mitochondrial analysis/20191003/1/Output/Number of mtROIs/")
list_files = list.files(".")
list_files
R <- read.csv("E:/Mitochondrial analysis/20191003/1/Cell Identities.csv",header = F)


for (j in seq(1,ncol(R))) {
  final <- c()
  for (i in seq(1,length(list_files)) ) {
  k = R[i,j]
  if( k==0){ 
    final <- rbind(final,rep(0,ncol(A)))
    }
  if(! k == 0){
    filename <- list_files[i]
    A <- read.csv(filename,header = T)
    final <- rbind(final,A[k,])
    }
  }
  write.csv(final,paste("../Combined number of mtROIs/Cell",j,".csv",sep = ""))
}


