# 03/10/2021

library(raster)
library(RStoolbox) #we will use this package to make the classification
library(ggplot2)
setwd("C:/lab/")
# brick

# 1 list the files available

rlist <- list.files(pattern="defor")
rlist

# 2 apply: apply a fuction to a list
list_rast <- lapply(rlist, brick) # lapply(x, FUN)
list_rast

plot(list_rast[[1]])

# defor: 1st band NIR, 2nd band red, 3rd band green
plotRGB(list_rast[[1]], r=1, g=2, b=3, stretch="lin")

# we can reassign "list_rast[[1]]" this with a new name, in order to work easily
l1992 <- list_rast[[1]]
plotRGB(l1992, r=1, g=2, b=3, stretch="lin")

l2006 <- list_rast[[2]]
plotRGB(l2006, r=1, g=2, b=3, stretch="lin")

# Unsupervised classification function (automated function => we save a lot of time
l1992c <- unsuperClass(l1992, nClasses=2) #unsuperClass(x, #number_of_Classes#)
l1992


# Value 1: Agricultural areas and water
# Value 2: Forests
# It differs from time to time

plot(l1992c$map)
freq(l1992c$map)
#     value  count
# [1, ]    1  35925
# [2, ]    2 305367

# agricultural areas and water (class 1) 35925
# forest (class 2) 305367

total <- 341292
propagri <- 35925/total # proportion of agricultural areas and water
propforest <- 305367/total # proportion of forest

# Agriculture and water: 0.1052618 ~ 0.10
# Forest: 0.8947382 ~ 0.90

# build a dataframe
cover <- c("Forest", "Agriculture")
prop1992 <- c(0.8947382, 0.1052618)
# or better, we can do this, instead
# prop1992 <- c(propforest, propagri)

proportion1992 <- data.frame(cover, prop1992)
ggplot(proportion1992, aes(x=cover, y=prop1992, color=cover)) + geom_bar(stat="identity", fill="white")

# The same process about 2006 image
l2006c <- unsuperClass(l2006, nClasses=2) # unsuperClass(x, nClasses) 
l2006c

plot(l2006c$map)
freq(l2006c$map)
#     value   count
# [1, ]    1  163399 # agricultural areas and water
# [2, ]    2  179327 # forest

# agricultural areas and water (class 1) 35925
# forest (class 2) 305367

total <- 341292
propagri <- 163399/total # proportion of agricultural areas and water
propforest <- 179327/total # proportion of forest

# 2006
# Agriculture and water:
# Forest:

# build a dataframe
cover <- c("Forest", "Agriculture") #unnecessary, -remains the same-
prop2006 <- c(0.478766, 0.5254357)

proportion <- data.frame(cover, prop1992, prop2006)
ggplot(proportion, aes(x=cover, y=prop2006, color=cover)) + geom_bar(stat="identity", fill="white")

proportion2006 <- data.frame(cover, prop2006)
ggplot(proportion1992, aes(x=cover, y=prop2006, color=cover)) + geom_bar(stat="identity", fill="white")

#plotting all together

p1 <- ggplot(proportion, aes(x=cover, y=prop2006, color=cover)) + geom_bar(stat="identity", fill="white") + ylim(0,1)
p2 <- ggplot(proportion1992, aes(x=cover, y=prop2006, color=cover)) + geom_bar(stat="identity", fill="white") + ylim(0,1)

# plot with gridExtra package:
grid.arrange(p1, p2, nrow=1)

library(patchwork)
# or plot with patchwork package:
p1+p2
# if you want to put one graph on top of the other
p1/p2

# patchwork is working even with raster data, but they should be plotted with
# instead of using plotRGB we are going to use ggRGB
# common stuff (from the first lessons):
plotRGB(l1992, r=1, g=2, b=3, stretch="Lin")
ggRGB(l1992, r=1, g=2, b=3)
ggRGB(l1992, r=1, g=2, b=3, stretch="lin")
ggRGB(l1992, r=1, g=2, b=3, stretch="hist")
ggRGB(l1992, r=1, g=2, b=3, stretch="sqrt") # sort of moderation of data
ggRGB(l1992, r=1, g=2, b=3, stretch="log")

# patchwork
gp1 <- ggRGB(l1992, r=1, g=2, b=3, stretch="lin")
gp2 <- ggRGB(l1992, r=1, g=2, b=3, stretch="hist")
gp3 <- ggRGB(l1992, r=1, g=2, b=3, stretch="sqrt") # sort of moderation of data
gp4 <- ggRGB(l1992, r=1, g=2, b=3, stretch="log")

gp1 + gp2 + gp3 + gp4
l2006 <- list_rast[[2]]
gp1 <- ggRGB(l1992, r=1, g=2, b=3)
gp5 <- ggRGB(l2006, r=1, g=2, b=3)

# multitemporal patchwork
gp1 <- ggRGB(l1992, r=1, g=2, b=3)
gp5 <- ggRGB(l2006, r=1, g=2, b=3)

gp1 + gp5

gp1 / gp5
