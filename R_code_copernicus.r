library(ncdf4)
library(raster)
setwd("C:/lab/copernicus/")  # windows
lai20200625 <- raster("c_gls_LAI_202006130000_GLOBE_PROBAV_V1.5.1.nc")
lai20200625
plot(lai20200625)

cl <- colorRampPalette(c("dark blue","blue","light blue"))(100)
plot(lai20200625, col=cl)
library(viridis)

library(ggplot2)
library(RStoolbox)

ggplot() +
geom_raster(lai20200625, mapping = aes(x=x, y=y, fill=Snow.Cover.Extent))

ggplot() +
geom_raster(snow20211214, mapping = aes(x=x, y=y, fill=Snow.Cover.Extent)) +
scale_fill_viridis()



###day 2
# in order to manage more than 1 or two files we use this method
rlist <- list.files(pattern="LAI")
rlist
list_rast <- lapply(rlist, raster)
list_rast

laistack <- stack(list_rast)
laistack

lwinter <- laistack$Leaf.Area.Index.1km.1
lsummer <- laistack$Leaf.Area.Index.1km.2

ggplot() +
geom_raster(lsummer, mapping = aes(x=x, y=y, fill=Leaf.Area.Index.1km.2)) +
scale_fill_viridis(option="viridis") +
ggtitle("LAI June 2020")

ggplot() +
geom_raster(lwinter, mapping = aes(x=x, y=y, fill=Leaf.Area.Index.1km.1)) +
scale_fill_viridis(option="viridis") +
ggtitle("LAI December 2019")

#let's plot them together

library(patchwork)

p1 <- ggplot() +
geom_raster(lwinter, mapping = aes(x=x, y=y, fill=Leaf.Area.Index.1km.1)) +
scale_fill_viridis(option="viridis") +
ggtitle("LAI - December 2019")

p2 <- ggplot() +
geom_raster(lsummer, mapping = aes(x=x, y=y, fill=Leaf.Area.Index.1km.2)) +
scale_fill_viridis(option="viridis") +
ggtitle("LAI - June 2020")

p1 / p2

# you can crop your image on a certain area
# longitude from 0 to 10
# latitude from 30 to 50

# crop the stack to the extent of Sicily
ext <- c(0, 20, 30, 50)
lwinter_cropped <- crop(lwinter, ext)
lsummer_cropped <- crop(lsummer, ext)

p1 <- ggplot() +
geom_raster(lwinter_cropped, mapping = aes(x=x, y=y, fill=Leaf.Area.Index.1km.1)) +
scale_fill_viridis(option="viridis") +
ggtitle("LAI - December 2019")

p2 <- ggplot() +
geom_raster(lsummer_cropped, mapping = aes(x=x, y=y, fill=Leaf.Area.Index.1km.2)) +
scale_fill_viridis(option="viridis") +
ggtitle("LAI - June 2020")

p1 / p2
