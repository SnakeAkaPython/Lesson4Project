#SnakeAkaPython
#January 8 2015

#To calculate the NDVI 
CalcNDVI <- function(band3, band4) {
  
  NDVI <- (band4 - band3) / (band4 + band3)
  return(NDVI)
}