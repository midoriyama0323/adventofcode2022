library("tidyverse")
input <- read.table("Day4\\input.txt", header = FALSE, sep = ",")
f_to_range <- function(x){
  
 return(seq(as.numeric(sub("-.*", "", x)),as.numeric(sub(".*-", "", x))))
  
}

input$V1 <- lapply(input$V1, f_to_range)
input$V2 <- lapply(input$V2, f_to_range)
input$bag1_over <- Map(`%in%`, input$V1, input$V2)
input$bag2_over <- Map(`%in%`, input$V2, input$V1)
input$all1 <- Map(all,input$bag1_over)
input$all2 <- Map(all,input$bag2_over)
#solution1
nrow(input[input$all1 == TRUE | input$all2 == TRUE,])
#solution2
input$any1 <- Map(any,input$bag1_over)
input$any2 <- Map(any,input$bag2_over)
nrow(input[input$any1 == TRUE | input$any2 == TRUE,])