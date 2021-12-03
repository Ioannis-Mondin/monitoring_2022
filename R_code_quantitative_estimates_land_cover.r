# 03/10/2021

library(raster)
setwd("C:/lab/")
# brick

# 1 list the files available

rlist <- list.files(pattern="defor")
rlist

# 2 apply: apply a fuction to a list
list_rast <- lapply(rlist, brick)
list_rast

plot(list_rast[[1]])

# defor: 1st band NIR, 2nd band red, 3rd band green
plotRGB(list_rast[[1]], r=1, g=2, b=3, stretch="lin")

# we can reassign "list_rast[[1]]" this with a new name, in order to work easily
l1992 <- list_rast[[1]]
plotRGB(l1992, r=1, g=2, b=3, stretch="lin")

l2006 <- list_rast[[2]]
plotRGB(l2006, r=1, g=2, b=3, stretch="lin")

# Unfupervised classification function
l1992c <- unsuperClass(l1992, nClasses=2)

#Value 1: Agriculture and water
forests

36664
304628

plot(l1992c$map)
freq(l1992c$map)

total <- 341292
propagri <- 36664/total
propforest <- 304628/total

# build a dataframe
cover <- c("Forest", "Agriculture")
prop1992 <- c(0.8925729, 0.1074271)

 

proportion1992 <- data.frame(cover, prop1992)
ggplot(proportion1992, aes(x=cover, y=prop1992, color=cover)) + geom_bar(stat="identity", fill="white")
