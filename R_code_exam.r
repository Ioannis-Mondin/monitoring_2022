# R code for my Monitoring Ecosystem Changes and Functioning exam in 2022

# This code is for analyzing Copernicus Leaf Area Index data in R

# I analysed "Copernicus" data in order to represent a view of the impact of the fire in Gironde -department in the Nouvelle-Aquitaine region of Southwestern France-, 
# which happened between 17 and 21 of July 

# setting my working directory
setwd("C:/lab/ExamProject/")

library(ncdf4)
library(raster)
library(ggplot2)
library(RStoolbox)
library(viridis)
library(patchwork)


rlist <- list.files(pattern="LAI")
rlist

list_rast <- lapply(rlist, raster)
list_rast

LAI_stack <- stack(list_rast)
LAI_stack

LAI_2022 <- LAI_stack$Leaf.Area.Index.333m.1
LAI_2021 <- LAI_stack$Leaf.Area.Index.333m.2

# coordinates of Gironde (longitude: -1.4181, -0.4093, latidude: 44.2467, 44.7766; latitude)
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

png(file = "Gironde Fire - LAI before and after")
LAI_plot_1 / LAI_plot_2
