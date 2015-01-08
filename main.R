#SnakeAkaPython
#January 8 2015


#Call the functions
source('R/ExtractData.R')
source('R/CalcNDVI.R')
source('R/Difference.R')


#From the file name you can derive the date as LXXPPPRRRYYYYDDDSTNVR_prod_band.ext
#(e.g., LC80120542014301LGN00_sr_band1.tif)
#LXX LC8 for Landsat 8 OLI and TIRS
#PPP Path
#RRR Row
#YYYY Year of Acquisition
#DDD Julian Date of Acquisition


LandSat8 <- 'data/LC81970242014109-SC20141230042441/'
Landsat5 <- 'data/LT51980241990098-SC20150107121947/'


data <- ExtractData(LandSat8, Landsat5)


Ndvi_LC8 <- CalcNDVI(data[[1]], data[[2]])
Ndvi_LC5 <- CalcNDVI(data[[3]], data[[4]])
NdviChange <- Difference(Ndvi_LC8, Ndvi_LC5)


opar <- par(mfrow=c(2,2))
plot(Ndvi_LC5, zlim = c(-0.2, 1), main = '1990')
plot(Ndvi_LC8, zlim = c(-0.2, 1), main = '2014')
plot(NdviChange, zlim = c(-1, 1), main = '2014 - 1990')
par(opar)
