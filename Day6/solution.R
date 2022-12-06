library("tidyverse")
input <- strsplit(readLines("Day6\\input.txt"), split = "")
for (i in (1:length(input[[1]]))){

  if (length(unique(input[[1]][i:(i+3)])) == 4){
    
    print(i+3)
    break
  }
  
}

for (i in (1:length(input[[1]]))){
  
  if (length(unique(input[[1]][i:(i+13)])) == 14){
    
    print(i+13)
    break
  }
  
}