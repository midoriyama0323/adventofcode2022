library("magrittr")
input <- readLines("Day3\\input.txt")
#check input
1 %in% (nchar(input) %% 2)
cols <- strsplit(substr(input, 1, nchar(input) / 2), "") %>%
  cbind(strsplit(substr(input, (nchar(
    input
  ) / 2) + 1, nchar(input)), ""))

vals <- append(letters, LETTERS) %>%
  cbind(seq.int(append(letters, LETTERS))) %>%
  as.data.frame()

priolist <- list()
for (i in 1:(length(cols) / 2)) {
  priolist <-
    append(priolist, intersect(cols[[i]], cols[[(length(cols) / 2) + i]]))
}
priolist <- as.data.frame(unlist(priolist))
res <-
  merge(priolist,
        vals,
        by.x = names(priolist),
        by.y = names(vals)[1])
print(sum(as.numeric(res[[2]])))



#part2
groups <- list()
for (i in seq(1, length(input), by = 3)) {
  groups <-
    append(groups, intersect(intersect(
      strsplit(input[i], "")[[1]], strsplit(input[i + 1], "")[[1]]
    ), strsplit(input[i + 2], "")[[1]]))
  
}
groups <- as.data.frame(unlist(groups))
res2 <-
  merge(groups,
        vals,
        by.x = names(groups),
        by.y = names(vals)[1])
print(sum(as.numeric(res2[[2]])))