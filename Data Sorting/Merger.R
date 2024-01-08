getwd()
setwd("D:/Analysis/DHE/20230909/Output/")
file_list = list.files(".")
M <- matrix(nrow = 10000,ncol = length(file_list)*1)
N <- c()
names <- c()
X = 1
for (files in file_list) {
  D <- read.csv(files)
  for (i in seq(1,nrow(D))) {
  M[i,X] = D$Mean[i]

  }
  names <- c(names,strsplit(files,split = "-") [[1]][1])
  
  N <- c(N,nrow(D))
  X = X+1
}

M <- as.data.frame(M)
NAMES_final <- c()
for (j in names) {
  NAMES_final <- c(NAMES_final,rep(j,1))
}

colnames(M) <- NAMES_final

write.csv(M,"combined.csv")

