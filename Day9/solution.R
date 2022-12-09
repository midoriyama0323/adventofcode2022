library("tidyverse")
input <- read.table("Day9\\input.txt")

head_loc <- c(0,0)
tail_loc <- c(0,0)
move <- c("U"=c(0,1), "D"=c(0,-1), "R"=c(1,0), "L"=c(-1,0))

tail_loc_list <- list(tail_loc)
