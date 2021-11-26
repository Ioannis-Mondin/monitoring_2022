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


par(mfrow=c(2,1))
plot(en01, col=cl)
plot(en13, col=cl)

EN01 <- raster("EN_0001.png")
EN02 <- raster("EN_0002.png")
EN03 <- raster("EN_0003.png")
EN04 <- raster("EN_0004.png")
EN05 <- raster("EN_0005.png")
EN06 <- raster("EN_0006.png")
EN07 <- raster("EN_0007.png")
EN08 <- raster("EN_0008.png")
EN09 <- raster("EN_0009.png")
EN10 <- raster("EN_0010.png")
EN11 <- raster("EN_0011.png")

plot(EN, col=cl)

#plot only the first image from the stack
#check the stack names
EN
plot(EN$EN_0001, col=cl)

#rgb
plotRGB(EN, r=1, g=7, b=13, stretch="lin")




EN12 <- raster("EN_0012.png")
EN13 <- raster("EN_0013.png")

# plot all the data together
par(mfrow=c(4,4))
plot(EN01, col=cl)
plot(EN02, col=cl)
plot(EN03, col=cl)
plot(EN04, col=cl)
plot(EN05, col=cl)
plot(EN06, col=cl)
plot(EN07, col=cl)
plot(EN08, col=cl)
plot(EN09, col=cl)
plot(EN10, col=cl)
plot(EN11, col=cl)
plot(EN12, col=cl)
plot(EN13, col=cl)

#the right way

EN <- stack(EN01, EN02, EN03, EN04, EN05, EN06, EN07, EN08, EN09, EN10, EN11, EN12, EN13)
plot(EN, col=cl)

#rgb
plot(EN$EN_0001, col=cl)
plotRGB(EN, r=1, g=7, b=13, stretch="lin")
