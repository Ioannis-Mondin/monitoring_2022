# R code for "Monitoring Ecosystem Changes and Functioning" exam 

# In this code Leaf Area Index (LAI) data is being analyzed 

# I analysed "Copernicus" data in order to represent a view of the impact of the fire in Gironde 
# -department in the Nouvelle-Aquitaine region of Southwestern France-, 
# which happened mostly in July and August of 2022

# I begin by setting my working directory:
setwd("C:/lab/ExamProject/")

# recalling the -already downloaded- packages that will be needed:
library(ncdf4)
library(raster)
library(ggplot2)
library(RStoolbox)
library(viridis)
library(patchwork)

# After having downloaded the two image files:
# the first representing the LAI a year before the wildfires (10/09/2021) and 
# the other representing the LAI after fires were finished (10/09/2022) 
# I moved them to my working directory folder and
# imported them in R all at once with the list.files function, using a common pattern keyword ("LAI"):

rlist <- list.files(pattern="LAI")
rlist

# Made use of lapply function to the list to convert it into raster list:
list_rast <- lapply(rlist, raster) 
list_rast

# Created a stack:
LAI_stack <- stack(list_rast)
LAI_stack

# I use the $ symbol to extract the laywers I need:
LAI_2022 <- LAI_stack$Leaf.Area.Index.333m.1
LAI_2021 <- LAI_stack$Leaf.Area.Index.333m.2

# Set the coordinates of Gironde area (longitude: -1.4181, -0.4093, latidude: 44.2467, 44.7766) in a 4-element vector:
ext <- c(-1.4181, -0.4093, 44.2467, 44.7766)

LAI2021_cropped <- crop(LAI_2021, ext)
LAI2022_cropped <- crop(LAI_2022, ext)

# Made use of ggplot function to plot the stack and changed "inferno" color scale (Viridis color maps)

LAI_plot_1 <- ggplot() +
geom_raster(LAI2021_cropped, mapping = aes(x=x, y=y, fill=Leaf.Area.Index.333m.2)) +
scale_fill_viridis(option="inferno") +
ggtitle("LAI - 10 September 2021") 

LAI_plot_2 <- ggplot() +
geom_raster(LAI2022_cropped, mapping = aes(x=x, y=y, fill=Leaf.Area.Index.333m.1)) +
scale_fill_viridis(option="inferno") +
ggtitle("LAI - 10 September 2022")

# Set the plots together in a vertical sequence and exported the image as png file:

png("Gironde Fire - Leaf Area Index before and after.png")
LAI_plot_1 / LAI_plot_2
