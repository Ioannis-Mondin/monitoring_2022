# This is my first code in GitHub! quite exciting. right?

# Here are the input data
# Costanza data on streams
water <- c(100, 200, 300, 400, 500)
water

# Marta data on fishes genomes
fishes <- c(10, 50, 60, 100, 200)
fishes

# plot the diversity of fishes (y) versus the amount of water (x)

plot(water, fishes)

# the data we developed can be stored in a table
# a table in R is called data frame

streams <- data.frame(water, fishes)
streams
View(screams)

# From now on, we are going to import and/or export data!
# setwd for Windows
setwd("C:/lab/")

# Let's export our table
# 
write.table(streams, file="my_first_table.txt")

#Some colleagues did sent us some file. How can we import the table in R?

read.table("my_first_table.txt")

# let's assign it to an object inside R

yiannistable <- read.table("my_first_table.txt")
yiannistable

# the first statistics for lazy beautiful people

summary(yiannistable)
#the media ειναι ο μεσος αριθμος, the mean ειναι ο μεσος ορος

#Marta does not like water
#Marta wants to get info only on fishes
summary(yiannistable$fishes)

#histogram
hist(ducciotable$fishes)

