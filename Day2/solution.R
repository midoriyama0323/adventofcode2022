input <- data.frame(gsub(" ", "", readLines("Day2\\input.txt")))
names(input) <- 'input'
points <-
  c(
    "AX" = 4,
    "AY" = 8,
    "AZ" = 3,
    "BX" = 1,
    "BY" = 5,
    "BZ" = 9,
    "CX" = 7,
    "CY" = 2,
    "CZ" = 6
  )
input$point1 <- points[input[[1]]]
print(sum(input$point1))

points2 <-
  c(
    "AX" = 3,
    "AY" = 4,
    "AZ" = 8,
    "BX" = 1,
    "BY" = 5,
    "BZ" = 9,
    "CX" = 2,
    "CY" = 6,
    "CZ" = 7
  )
input$point2 <- points2[input[[1]]]
print(sum(input$point2))