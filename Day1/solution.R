input <- as.numeric(readLines("Day1\\input.txt"))
splits <- data.frame()

elf=0
for (i in 1:length(input)){
  if (is.na(input[i])){
    splits <- rbind(splits,elf)
    elf=0
    next
  }
  elf <- elf + input[i]
}
print(max(splits))
print(sum(sort(splits[[1]], decreasing = TRUE)[1:3]))
