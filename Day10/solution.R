library("tidyverse")
input <- read.delim("Day10\\input.txt", header = FALSE, sep = " ")
x = 1
cycle <- list()

for (i in 1:nrow(input)) {
  switch(input$V1[i],
         
         "noop" = {
           
           cycle <- c(cycle, list(c(x, x)))
           
         },
         
         {

           cycle <-
             c(cycle, list(c(x, x)), list(c(x, x + input$V2[i])))
           x <- x + input$V2[i]
           
         })
  
}

solution1 <- 0

for (i in seq(20, length(cycle), 40)) {
  solution1 <- solution1 + (cycle[[i]][1] * i)
  
}

solution1

screen <- split(cycle, cut(seq_along(cycle), 6, labels = FALSE))

row1 <- row2 <- row3 <- row4 <- row5 <- row6 <- ""
for (i in 1:length(screen)) {
  
  for (j in 1:length(screen[[1]])) {
    
    if (between(screen[[i]][[j]][1],j-2,j)) {
      
      assign(paste("row", i, sep = ""), paste(get(paste("row", i, sep = "")), "#", sep = "" ))
      
    } else{
      
      assign(paste("row", i, sep = ""), paste(get(paste("row", i, sep = "")), ".", sep = ""))
      
    }
    
  }
  
  print(get(paste("row",i, sep = "")))
}