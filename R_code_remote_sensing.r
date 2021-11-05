# R code for ecosystem monitoring by remote sensing
# First of all, we need to install additional packages
# raster package to manage image data
# https://www.rdocumentation.org/packages/utils/versions/3.6.2/topics/install.packages

install.packages("raster")
# no quotes because its inside R (we previously installed it
library(raster)

# set the working diretory
setwd("C:/lab/")

# we are going to import satellite data
l2011 <- brick("p224r63_2011.grd")
#objects can not be numbers!!
plot(l2011)

# B1 is the reflectance in the blue band
# B2 is the reflectance in the green band
# B3 is the reflectance in the red band
# B4 is the reflectance in the deep red (NIR) band

cl <- colorRampPalette(c("black", "grey", "light grey"))(100)
plot(l2011, col=cl)

plotRGB(l2011, r=3, g=2, b=1, stretch="Lin")

# RGB all colors that human sees, kind of natural...

l2011 <- brick("p224r63_2011.grd")
l2011

# sre means spectural reflectance
# we link with the $ !!!
# let's plot the green band
plot(l2011 $ B2_sre) 

cl <- colorRampPalette(c("black", "grey", "light grey"))(100)
plot(l2011$B2_sre, col=cl)

# change the colorRampPalette with dark green and light green
clg <- colorRampPalette(c("dark green", "green", "light green"))(100)
plot(l2011$B2_sre, col=clg)

# change the colorRampPalette with dark blue, blue and light blue (change also the name -B2_sre-)
clb <- colorRampPalette(c("dark blue", "blue", "light blue"))(100)

# Ultra useful stuff below!
# plot both images in just one multiframe graph
par(mfrow(1,2))
plot(l2011 $ B1_sre, col=clb) 
plot(l2011 $ B2_sre, col=clg) 

# plot both images in just one multiframe graph with two rows and just one column
par(mfrow=c(2,1))
plot(l2011$B1_sre, col=clb)
plot(l2011$B2_sre, col=clg)
