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


######
# 6
######
detach(vit2005)
site <- "http://www.stat.berkeley.edu/users/statlabs/data/babies.data"
BABIES <- read.table(file=url(site), header=TRUE)
attach(BABIES)
head(BABIES)
#
# a
CLEAN <- BABIES[bwt != 999 & gestation != 999 & parity != 9 & height != 99 & weight != 999 & smoke != 9,]
#
# b
detach(BABIES)
attach(CLEAN)
par(mfrow=c(1,2))
hist(CLEAN[smoke == 0,]$bwt, freq=FALSE,
     main="Non-smoker", 
	 xlab="Birth Weight (oz)", col="#8888ee", xlim=c(30, 180))
lines(density(CLEAN[smoke == 0,]$bwt))
hist(CLEAN[smoke == 1,]$bwt, freq=FALSE,
		main="Smoker", 
		xlab="Birth Weight (oz)", col="#ee8888", , xlim=c(30, 180))
lines(density(CLEAN[smoke == 1,]$bwt))
#
# c
# The smoking mothers distribution is closer to a normal curve than
# the non-smoking mothers distribution. Non-smoking mothers are skewed 
# to the left, tend to have higher baby weight.

#
# d
meanSmokeWeight <- mean(CLEAN[smoke==1,]$bwt)
meanNoSmokeWeight <- mean(CLEAN[smoke==0,]$bwt)
meanNoSmokeWeight - meanSmokeWeight
# Difference of ~9 oz.
# Using mean for measuring center of non-smokers may be a problem
# because distribution is slightly skewed to left.
# If you use median for non-smoking moms you get a lower difference.

#
# e
library("lattice")
boxplot(bwt~smoke, names=c("Non-smoker", "Smoker"), col=c("#8888ee", "#ee8888"), ylab="Weight (oz)")
bwplot(smoke~bwt, ylab=c("Non-smoker", "Smoker"), col=c("#8888ee", "#ee8888"), xlab="Weight (oz)")

#
# f
medFirst <- median(CLEAN[parity == 0,]$bwt)
medNoFirst <- median(CLEAN[parity != 0,]$bwt)
medFirst - medNoFirst
# Firts born children tend to weight more by 2 oz.

#
# g
par(mfrow=c(1,2))
#histogram(~weight|smoke, type="density")
plot(density(CLEAN[smoke == 0,]$weight), col="#8888ee", xlab="lbs.", main="Non-smoke")
plot(density(CLEAN[smoke == 1,]$weight), col="#ee8888", xlab="lbs.", main="Smoke")
legend("top", legend=c("Non-smoker", "Smoker"), lty=1, col=c("#8888ee", "#ee8888"))
#
# h
densityplot(~weight, groups=smoke)
# Mothers that smoke tend to weigh less. Their distribution skews right.

#
# i
meanSmoke <- mean(CLEAN[smoke == 1,]$weight)
meanNoSmoke <- mean(CLEAN[smoke == 0,]$weight)
abs(meanSmoke - meanNoSmoke)
# Both distributions, smoking and non-smoking, are skewed to right.

#
# j
get_bmi <- function(weight, height){
	(weight*0.45359)/((height*0.0254)^2)
}
CLEANP <- get_bmi(CLEAN$weight, CLEAN$height)
densityplot(CLEANP)

#
# k 
# Distribution is skewed right.

#
# l
