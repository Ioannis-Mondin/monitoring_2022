# R code for chemical cycling study
# time series of NO2 change in Europe during the lockdown

setwd("C:/lab/EN/")

library(raster)

en01 <- raster("EN_0001.png")
en01

# what is the range of the 
# 8bit images: values (0,255) (2^8 -1)
cl <- colorRampPalette(c('deepskyblue3','aquamarine3','yellow'))(100)

> plot(en01, col=cl)

en13 <- raster("EN_0013.png")
> plot(en13, col=cl)


