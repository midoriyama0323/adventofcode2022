library("tidyverse")
listremoval <- function(x){
  
  unlist(strsplit(x, split = ""))
  
}
#converting to matrix for easy handling
#input[row,column]
input <- do.call("cbind", lapply(readLines("Day8\\input.txt"), listremoval))

