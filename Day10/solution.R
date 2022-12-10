library("tidyverse")
input <- read.delim("Day10\\input.txt", header = FALSE, sep = " ")
x = 1
cycle <- list()

for (i in 1:nrow(input)) {
  switch(input$V1[i],
         
         "noop" = {
           cycle_start <- x
           cycle_end <- x
           
           cycle <- c(cycle, list(c(cycle_start, cycle_end)))
           
         },
         
         {
           cycle_start <- x
           cycle_end <- x + input$V2[i]
           x <- cycle_end
           cycle <-
             c(cycle, list(c(cycle_start, cycle_start)), list(c(cycle_start, cycle_end)))
           
           
         })
  
}

solution1 <- 0

for (i in seq(20, length(cycle), 40)) {
  solution1 <- solution1 + (cycle[[i]][1] * i)
  
}

screen <- split(cycle, cut(seq_along(cycle), 6, labels = FALSE))

row1 <- row2 <- row3 <- row4 <- row5 <- row6 <- ""
for (i in 1:length(screen)) {
  
  for (j in 1:length(screen[[1]])) {
    
    if (between(screen[[i]][[j]][1],j-1,j+1)) {
      
      assign(paste("row", i, sep = ""), paste(get(paste("row", i, sep = "")), "#", sep = "" ))
      
    } else{
      
      assign(paste("row", i, sep = ""), paste(get(paste("row", i, sep = "")), ".", sep = ""))
      
    }
    
  }
}