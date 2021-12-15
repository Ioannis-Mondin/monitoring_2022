library(ncdf4)
library(raster)
setwd("C:/lab/copernicus/")  # windows
lai20200625 <- raster("c_gls_LAI_202006130000_GLOBE_PROBAV_V1.5.1.nc")
lai20200625
plot(lai20200625)
