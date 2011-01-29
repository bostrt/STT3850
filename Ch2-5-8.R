# 5:01:42 PM
# Jan 29, 2011
# 
# Author: Robert Bost
###############################################################################
# Chapter 2
# Problems 5-8
###############

######
# 5
######
library(PASWR)
attach(vit2005)
#
# a
str(vit2005)
# Number of apartments grouped by 'out'
table(out)
pie(table(out)) 
barplot(table(out), xlab="out", ylab="# Apts.")
# Bar plot is easier for me to read.

#
# b
plot(density(totalprice/1000), xlab="Thousands of dollars")
# Data is slightly skewed to the right.

#
# c
plot(totalprice/1000, area, xlab="In thousands of dollars")
# The relationship between totalprice and area seems to be that
# as area increases so does price.

#
# d
xyplot(area~totalprice/1000|toilets)
# Areas between 75 and 110 have both
# one and two bathrooms

#
# e
apts <- data.frame(vit2005[area >= 75 | area <= 110,])
# Since we found that the center of totalprice was skewed 
# I will use median.
medianAll <- median(apts$totalprice)
medianOneBath <- median(apts[apts$toilets == 1,]$totalprice) # Median total price of 1 bathroom apt.
medianTwoBath <- median(apts[apts$toilets == 2,]$totalprice) # Median total price of 2 bathroom apt.
(medianTwoBath - medianOneBath)/medianAll
# Nah, I probably wouldn't pay for extra bath. 35% more.
