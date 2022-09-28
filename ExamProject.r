library(ncdf4)
library(raster)
setwd("C:/lab/ExamProject/")

lai20180630 <- raster("c_gls_LAI300_201806300000_GLOBE_PROBAV_V1.0.1.nc")
lai20180630 

lai20190630 <- raster("c_gls_LAI300_201906300000_GLOBE_PROBAV_V1.0.1.nc")
lai20190630 

library(ggplot2)
library(RStoolbox)
library(viridis)


###day 2
# in order to manage more than 1 or two files we use this method
rlist <- list.files(pattern="LAI")
rlist
list_rast <- lapply(rlist, raster)
list_rast

laistack <- stack(list_rast)
laistack

l2022 <- laistack$Leaf.Area.Index.333m.1
l2021 <- laistack$Leaf.Area.Index.333m.2

ggplot() +
geom_raster(l2021, mapping = aes(x=x, y=y, fill=Leaf.Area.Index.333m.1)) +
scale_fill_viridis(option="plasma") +
ggtitle("LAI 10 September 2021") 

ggplot() +
geom_raster(l2022, mapping = aes(x=x, y=y, fill=Leaf.Area.Index.333m.2)) +
scale_fill_viridis(option="plasma") +
ggtitle("LAI 10 September 2022")

#let's plot them together

library(patchwork)

plot1 <- ggplot() +
geom_raster(l2021, mapping = aes(x=x, y=y, fill=Leaf.Area.Index.333m.1)) +
scale_fill_viridis(option="viridis") +
ggtitle("LAI - 10 September 2021")

plot2 <- ggplot() +
geom_raster(l2022, mapping = aes(x=x, y=y, fill=Leaf.Area.Index.333m.2)) +
scale_fill_viridis(option="viridis") +
ggtitle("LAI - 10 September 2022")

png()
plot1 / plot2

# you can crop your image on a certain area
# longitude from 0 to 10
# latitude from 30 to 50

# crop the stack to the extent of Sicily
ext <- c(-1.3756, -0.1511, 44.1762, 44.8794)
l2021_cropped <- crop(l2021, ext)
l2022_cropped <- crop(l2022, ext)

plot1 <- ggplot() +
geom_raster(l2021_cropped, mapping = aes(x=x, y=y, fill=Leaf.Area.Index.333m.2)) +
scale_fill_viridis(option="viridis") +
ggtitle("LAI - 10 September 2021")

plot2 <- ggplot() +
geom_raster(l2022_cropped, mapping = aes(x=x, y=y, fill=Leaf.Area.Index.333m.1)) +
scale_fill_viridis(option="viridis") +
ggtitle("LAI - 10 September 2022")

plot1 / plot2












library(ncdf4)
library(raster)
setwd("C:/lab/MyExamProject/")

lai20180630 <- raster("c_gls_LAI300_201806300000_GLOBE_PROBAV_V1.0.1.nc")
lai20180630 

lai20190630 <- raster("c_gls_LAI300_201906300000_GLOBE_PROBAV_V1.0.1.nc")
lai20190630 

library(ggplot2)
library(RStoolbox)
library(viridis)


###day 2
# in order to manage more than 1 or two files we use this method
rlist <- list.files(pattern="LAI")
rlist
list_rast <- lapply(rlist, raster)
list_rast

laistack <- stack(list_rast)
laistack

l2021 <- laistack$Leaf.Area.Index.333m.1
l2022 <- laistack$Leaf.Area.Index.333m.2

ggplot() +
geom_raster(l2021, mapping = aes(x=x, y=y, fill=Leaf.Area.Index.333m.1)) +
scale_fill_viridis(option="plasma") +
ggtitle("LAI 10 September 2021")

ggplot() +
geom_raster(l2022, mapping = aes(x=x, y=y, fill=Leaf.Area.Index.333m.2)) +
scale_fill_viridis(option="plasma") +
ggtitle("LAI 10 September 2022")

#let's plot them together

library(patchwork)

plot1 <- ggplot() +
geom_raster(l2021, mapping = aes(x=x, y=y, fill=Leaf.Area.Index.333m.1)) +
scale_fill_viridis(option="viridis") +
ggtitle("LAI - 10 September 2021")

plot2 <- ggplot() +
geom_raster(l2022, mapping = aes(x=x, y=y, fill=Leaf.Area.Index.333m.2)) +
scale_fill_viridis(option="viridis") +
ggtitle("LAI - 10 September 2022")

plot1 / plot2

# you can crop your image on a certain area
# longitude from 0 to 10
# latitude from 30 to 50

# crop the stack to the extent of Sicily
ext <- c(-2.8181, 1.1084, 42.060, 46.0622)
l2021_cropped <- crop(l2021, ext)
l2022_cropped <- crop(l2022, ext)

plot1 <- ggplot() +
geom_raster(l2021_cropped, mapping = aes(x=x, y=y, fill=Leaf.Area.Index.333m.1)) +
scale_fill_viridis(option="viridis") +
ggtitle("LAI - 10 September 2021")

plot2 <- ggplot() +
geom_raster(l2022_cropped, mapping = aes(x=x, y=y, fill=Leaf.Area.Index.333m.2)) +
scale_fill_viridis(option="viridis") +
ggtitle("LAI - 10 September 2022")

plot1 / plot2



#Final code


library(ncdf4)
library(raster)

setwd("C:/lab/ExamProject/")

library(ggplot2)
library(RStoolbox)
library(viridis)


rlist <- list.files(pattern="LAI")
rlist

list_rast <- lapply(rlist, raster)
list_rast

LAI_stack <- stack(list_rast)
LAI_stack

LAI_2022 <- LAI_stack$Leaf.Area.Index.333m.1
LAI_2021 <- LAI_stack$Leaf.Area.Index.333m.2

library(patchwork)

ext <- c(-1.4181, -0.4093, 44.2467, 44.7766)

LAI2021_cropped <- crop(LAI_2021, ext)
LAI2022_cropped <- crop(LAI_2022, ext)

LAI_plot_1 <- ggplot() +
geom_raster(LAI2021_cropped, mapping = aes(x=x, y=y, fill=Leaf.Area.Index.333m.2)) +
scale_fill_viridis(option="inferno") +
ggtitle("LAI - 10 September 2021") 

LAI_plot_2 <- ggplot() +
geom_raster(LAI2022_cropped, mapping = aes(x=x, y=y, fill=Leaf.Area.Index.333m.1)) +
scale_fill_viridis(option="inferno") +
ggtitle("LAI - 10 September 2022")

png()
LAI_plot_1 / LAI_plot_2