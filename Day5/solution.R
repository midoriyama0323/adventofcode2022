library("tidyverse")
input <- lapply(str_split(gsub("\\[|\\]", "", gsub(
  " ", "-",
  gsub("    ", "-",
       gsub(
         "     ", "--", readLines("Day5\\input.txt", n = 8)
       ))
)), pattern = "-")[8:1], "[", 1:9)

input <- as.list(map_dfr(input, ~ as.data.frame(t(.))))

for (i in 1:length(input)) {
  input[[i]] <- input[[i]][input[[i]] != '']
  
}

moves <-
  read.csv("Day5\\input.txt",
           sep = " ",
           skip = 10,
           header = FALSE)[, c(2, 4, 6)]

input2 <- input
for (i in 1:nrow(moves)) {
  
  input[[moves[i, 3]]] <-
    append(input[[moves[i, 3]]], tail(input[[moves[i, 2]]], n = moves[i, 1])[moves[i,1]:1])
  input[[moves[i, 2]]] <- head(input[[moves[i, 2]]],-moves[i, 1])
  
  
  input2[[moves[i, 3]]] <-
    append(input2[[moves[i, 3]]], tail(input2[[moves[i, 2]]], n = moves[i, 1]))
  input2[[moves[i, 2]]] <- head(input2[[moves[i, 2]]],-moves[i, 1])
  
}
paste(unlist(lapply(input, last)), sep = "")
paste(unlist(lapply(input2, last)), sep = "")
