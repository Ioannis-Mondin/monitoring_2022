# R code for estimating energy in ecosystems

library(raster)
setwd("C:/lab/")
# brick("defor1_.jpg")

install.packages("rgdal")

library(rgdal)

l1992 <- brick("defor1_.jpg") # image of 1992

plotRGB(l1992, r=1, g=2, b=3, stretch="Lin")
