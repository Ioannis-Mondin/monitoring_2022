#R code for species distribution modelling, namely the distribution of individuals

library(sdm)
library(raster) # predictors
library(rgdal) # species: an array of x,y points (x0,y0, x1,y1...)

# OSgeo 

file <- system.file("external/species.shp", package="sdm")
file

species <- shapefile(file) # exactly as the raster function for raster files
species

species$Occurrence

# how many occurrences are there? subset a DataFrame
specences <- species[species$Occurrence == 1,]
absences <- species[species$Occurrence == 0,]


plot(species, pch=19)


plot(presences, pch=19, col="blue")
plot(absences, pch=19, col"red")

# plot presences and absences!
plot(presences, pch=19, col="blue")
points(absences, pch=19, col="red")

# let's look at the predictors
path <- system.file("external", package="sdm")
lst <- list.files(path, pattern='asc')

# you can use the lapply function with the raster function ...........????

preds <- stack(lst)

cl <- colorRampPalette(c('blue','orange','red','yellow')) (100)
plot(preds, col=cl) 

plot(preds$elevation, col=cl)
points(presences, pch=19)

plot(preds$temperature, col=cl)
points(presences, pch=19)

plot(preds$vegetation, col=cl)
points(presences, pch=19)

plot(preds$precipitation, col=cl)
points(presences, pch=19)
