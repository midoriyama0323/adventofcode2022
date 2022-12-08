library("tidyverse")
input <- readLines("Day7\\input.txt")
currentdir <- "/root/"
dirstep <- "/root/"
dirs <- data.frame(matrix(ncol = 2, nrow = 0))
dirs <- rbind(dirs, c('/root/', 0))
totalsize <- as.integer(70000000)
targetfree <- as.integer(30000000)

for (i in 2:length(input)) {
  #ignoring root cd
  
  if (input[i] == "$ cd ..") {
    len <- length(unlist(strsplit(currentdir, split = "/")))
    currentdir <-
      paste(append(unlist(strsplit(
        currentdir, split = "/"
      ))[1:(len - 1)], ""), collapse = "/") #go up one dir e.g /abc/cde/ to /abc/
    
  } else if ("cd" %in% unlist(strsplit(input[i], split = " "))) {
    currentdir <-
      paste(currentdir, unlist(strsplit(input[i], split = " "))[3], "/", sep = "") #on cd that is not .. change the currentdir
    dirs <-
      rbind(dirs, c(currentdir, 0)) #add currentdir to the dirs table with size 0
    
    
  } else if (grepl("[[:digit:]]", unlist(strsplit(input[i], split = " "))[1])) {
    #if a line starts with a number then
    
    dirstep <- currentdir
    while (nchar(dirstep) != 1) {
      #add number to the folder, then to the parent, then to the parent's parent etc.
      len <- length(unlist(strsplit(dirstep, split = "/")))
      
      dirs[[2]][dirs[[1]] == dirstep] <-
        as.integer(dirs[[2]][dirs[[1]] == dirstep]) + as.integer(unlist(strsplit(input[i], split = " "))[1])
      
      dirstep <-
        paste(append(unlist(strsplit(
          dirstep, split = "/"
        ))[1:(len - 1)], ""), collapse = "/")
      
    }
    
  }
  
}
#part1_Solution
print(sum(as.integer(dirs[[2]][as.integer(dirs[[2]]) < 100000])))
#1232307 which is correct
dirs[[2]] <- as.numeric(dirs[[2]])

currentsize <- as.integer(dirs[[2]][1]) #Size of root
tofree <- targetfree - (totalsize - currentsize)
dirsizelist <-
  sort(append(as.integer(dirs[[2]]), tofree)) #add the value to free
print(dirsizelist[(match(tofree, dirsizelist)) + 1])#find the first value that is bigger than the "to free" value
#7268994