# ice melt in greenland
# Proxy: LST

setwd("C:/lab/greenland/")

rlist <- list.files(pattern="lst")
rlist

# raster => single layers
# stack => all layers together
library(raster)

import <- lapply(rlist,raster)
import

tgr <- stack(import)
tgr

cl <- colorRampPalette(c("blue","light blue","pink","yellow"))(100)
plot(tgr, col=cl)

library(ggplot2)

library(RStoolbox)

library(patchwork)

library(viridis)
#ggplot of first and final images 2000 vs 2015

ggplot() +
geom_raster(tgr$lst_2000, mapping = aes(x=x, y=y, fill=lst_2000)) +
scale_fill_viridis(option="magma") + 
ggtitle("LST in 2000")

ggplot() +
geom_raster(tgr$lst_2015, mapping = aes(x=x, y=y, fill=lst_2015)) +
scale_fill_viridis(option="magma") + 
ggtitle("LST in 2015")

p1 <- ggplot() +
geom_raster(tgr$lst_2000, mapping = aes(x=x, y=y, fill=lst_2000)) +
scale_fill_viridis(option="magma") +
ggtitle("LST in 2000")

p2 <- ggplot() +
geom_raster(tgr$lst_2015, mapping = aes(x=x, y=y, fill=lst_2015)) +
scale_fill_viridis(option="magma") +
ggtitle("LST in 2015")


p1 + p2

# plotting frequency destributions of data

par(mfrow=c(1,2))
hist(tgr$lst_2000)
hist(tgr$lst_2015)

par(mfrow=c(2,2))
hist(tgr$lst_2000)
hist(tgr$lst_2005)
hist(tgr$lst_2010)
hist(tgr$lst_2015)

dev.off()
plot(tgr$lst_2010, tgr$lst_2015, xlim=c(12500,15000), ylim=c(12500,15000))
abline(0,1,col="red")


# plot all the graphs together
par(mfrow=c(4,4))
hist(tgr$lst_2000)
hist(tgr$lst_2005)
hist(tgr$lst_2010)
hist(tgr$lst_2015)
plot(tgr$lst_2010, tgr$lst_2015, xlim=c(12500,15000), ylim=c(12500,15000))
plot(tgr$lst_2010, tgr$lst_2000, xlim=c(12500,15000), ylim=c(12500,15000))

# big nightmRE, ISN'T IT? 
pairs(tgr)
# the lowest temperatures are higher in 2015
