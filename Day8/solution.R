library("tidyverse")
listremoval <- function(x) { 
  
  unlist(strsplit(x, split = ""))
  
}
#converting to matrix for easy handling
#input[row,column]
input <-
  do.call("cbind", lapply(readLines("Day8\\input.txt"), listremoval))

vis = 0
scen <- list()

for (i in 1:length(input)) {
  col = ceiling(i / nrow(input))
  row = nrow(input) - abs(i - col * (nrow(input)))
  
  arow <-
    all(c(max(as.numeric(input[row, 1:col])) == as.numeric(input[i]), length(which(
      as.numeric(input[row, 1:col]) == input[i]
    )) == 1))
  brow <-
    all(c(max(as.numeric(input[row, col:ncol(input)])) == as.numeric(input[i]), length(which(
      as.numeric(input[row, col:ncol(input)]) == input[i]
    )) == 1))
  acol <-
    all(c(max(as.numeric(input[1:row, col])) == as.numeric(input[i]), length(which(
      as.numeric(input[1:row, col]) == input[i]
    )) == 1))
  bcol <-
    all(c(max(as.numeric(input[row:nrow(input), col])) == as.numeric(input[i]), length(which(
      as.numeric(input[row:nrow(input), col]) == input[i]
    )) == 1))
  
  vis <- ifelse(any(arow, brow, acol, bcol), (vis + 1), vis)
  
  if(row==1 | row == nrow(input) | col == 1 | col == ncol(input)){
    
    final_score <- 0
    scen <- append(scen, final_score)
    
  }
  else {
    arow_list <- as.numeric(input[row, 1:col])
    j = length(arow_list)-1
    arow_score = 1
    while(j>1){
      
      if (arow_list[j] < arow_list[length(arow_list)]){
        arow_score <- arow_score + 1
        
      } else {break}
      
      j <- j-1
      
    }
    
    brow_list <- as.numeric(input[row, col:ncol(input)])
    j = 2
    brow_score = 1
    while(j<length(brow_list)){
      
      if (brow_list[j] < brow_list[1]){
        brow_score <- brow_score + 1
        
      } else {break}
      
      j <- j+1
      
    }
    
    acol_list <- as.numeric(input[1:row, col])
    j = length(acol_list)-1
    acol_score = 1
    while(j>1){
      
      if (acol_list[j] < acol_list[length(acol_list)]){
        acol_score <- acol_score + 1
        
        
      } else {break}
      
      j <- j-1
      
    }
    
    bcol_list <- as.numeric(input[row:nrow(input), col])
    j = 2
    bcol_score = 1
    while(j<length(bcol_list)){
      
      if (bcol_list[j] < bcol_list[1]){
        bcol_score <- bcol_score + 1
        
      } else {break}
      
      j <- j+1
      
    }
    
    final_score <- (arow_score*brow_score*acol_score*bcol_score)
    
    scen <- append(scen, final_score)
  }
  
}
vis
max(unlist(scen))
