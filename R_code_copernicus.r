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
