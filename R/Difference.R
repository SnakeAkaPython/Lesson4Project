#SnakeAkaPython
#January 8 2015

#NDVI difference from 1990 to 2014
Difference <- function(NDVI8, NDVI5) {
  subtraction <- (NDVI8 - NDVI5)
  return(subtraction)
} 