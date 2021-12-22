# R code for measuring interactions!

library(vegan)

load("biomes_multivar.RData")
ls()
biomes
biomes_types

multivar <- decorana(biomes)
multivar



lets take a loo at the grouping of species! Are they at the same biome?
attach(biomes_types)
plot(multivar)
ordiellipse(multivar, type, col=c("black","red","green","blue"), kind="ehull", lwd=3)

ordispider(multivar, type, col=c("black","red","green","blue"), label=T)
