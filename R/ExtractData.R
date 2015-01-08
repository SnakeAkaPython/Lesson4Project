#SnakeAkaPython
#January 8 2015

library(raster)

ExtractData <- function (LC8, LC5) {

  #Extract files from archives to explore the information about the files
  
  LandSat8 <- list.files(LC8, pattern = glob2rx('*.tif'), full.name = TRUE)
  LandSat5 <- list.files(LC5, pattern = glob2rx('*.tif'), full.name = TRUE)
  
  #Stack the layers for each Landsat dataset(cfmask layer, band3, band4)
  
  LandSat8Stack <- stack(c(LandSat8[[1]], LandSat8[[5]], LandSat8[[6]]))
  LandSat5Stack <- stack(c(LandSat5[[1]], LandSat5[[6]], LandSat5[[7]]))
  
  #Intersect and get a extext(e) for croping the data 
  
  e <- intersect(extent(LandSat5Stack), extent(LandSat8Stack))
  
  #Crop the datasets
  
  LandSat8_Croped <- crop(LandSat8Stack, e)
  LandSat5_Croped <- crop(LandSat5Stack, e)
  
  #Remove pixels in the stack that has clouds (cloud mask)
  
  cfmask8 <- LandSat8_Croped[[1]]
  LandSat8_Croped[cfmask8 != 0] <- NA
  
  cfmask5 <- LandSat5_Croped[[1]]
  LandSat5_Croped[cfmask5 != 0] <- NA
  
  #select band to use for the computation of the NDVI
  
  LC8_3 <- LandSat8_Croped[[2]]
  LC8_4 <- LandSat8_Croped[[3]]
  
  LC5_3 <- LandSat5_Croped[[2]]
  LC5_4 <- LandSat5_Croped[[3]]
  
  return (c(LC8_3, LC8_4, LC5_3, LC5_4))
}

