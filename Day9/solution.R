library("tidyverse")
input <- read.table("Day9\\input.txt")

head_loc <- c(0, 0)
tail_loc <- c(0, 0)
U <- c(0, 1)
D <- c(0, -1)
R <- c(1, 0)
L <- c(-1, 0)
tail_loc_list <- list(tail_loc)

#part1
for (i in 1:nrow(input)) {
  direction <- input$V1[i]
  count <- input$V2[i]

  while (count > 0) {
    head_loc <- head_loc + get(direction)
    if (2 %in% abs(head_loc - tail_loc)) {
      tail_loc <- head_loc - get(direction)
      tail_loc_list <- c(tail_loc_list, list(tail_loc))

    }

    count = count - 1
  }

}
#part1_solution
length(unique(tail_loc_list))

#part2
tail_loc_list <- list()

knots <-
  rep(list(as.double(c(0, 0))), 10)
names(knots) <- paste("k", 1:10, sep = "")


for (i in 1:nrow(input)) {
  direction <- input$V1[i]
  count <- input$V2[i]
  
  while (count > 0) {
    k = 1
  while (k <= 10) {
    switch(as.character(k),
           "1" = {
             
             knots[["k1"]] <- knots[["k1"]] + get(direction)
             
           },
           
           {
             dist <- knots[[paste("k", (k - 1), sep = "")]] - knots[[paste("k", k, sep = "")]]
             if (2 %in% abs(dist)) {
               
               to_move <-as.character(dist) %>%
                 str_replace_all("2","1")%>%
                 as.numeric()
               knots[[paste("k", k, sep = "")]] <- knots[[paste("k", k, sep = "")]] + to_move
               
             }
             
           })
    tail_loc_list <- c(tail_loc_list, list(knots[["k10"]]))
    k = k + 1
    
  }
  count = count-1
  }
}
#part2_solution
length(unique(tail_loc_list))
