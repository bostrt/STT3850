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
loadBabies <- function(){
	site <- "http://www.stat.berkeley.edu/users/statlabs/data/babies.data"
	BABIES <- read.table(file=url(site), header=TRUE)
	attach(BABIES)
	head(BABIES)
}
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
densityplot(~bwt,groups=smoke) # this helps us compare the curves better
#
# c
# Mothers that smoke tend to have babies with slightly lower weight.
# Mothers that do not smoke have a mostly normal curve.

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
densityplot(~weight, groups=smoke, auto.key=TRUE)

#
# h
# Mothers that smoke tend to weigh less. Their distribution skews right.
tapply(CLEAN$weight,smoke, median)

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
CLEANP <- CLEAN
CLEANP <- cbind(CLEANP, "BWI"=get_bmi(CLEAN$weight, CLEAN$height))
CLEANP <- cbind(CLEANP, "weightM"=(CLEAN$weight)*0.45359)
CLEANP <- cbind(CLEANP, "heightM"=((CLEAN$height)*0.0254)^2)

#
# k
densityplot(CLEANP$BWI)
# Distribution is skewed right.
median(CLEANP$BWI)
IQR(CLEANP$BWI)

#
# l
values <- quantile(CLEANP$BWI)
CLEANPa <- cbind(CLEANP, Q=cut(CLEANP$BWI, values, order_results=TRUE))
with(CLEANPa, tapply(bwt, list(Q, smoke), mean))
with(CLEANPa, tapply(bwt, list(Q, smoke), sd))
with(CLEANPa, tapply(bwt, list(Q, smoke), median))
with(CLEANPa, tapply(bwt, list(Q, smoke), IQR))
# bwt conditioned on BWI quartiles. These graphs are 
# mostly Symmetrical.
densityplot(~CLEANPa$bwt|CLEANPa$Q)
histogram(~CLEANPa$bwt|CLEANPa$Q)
# bwt conditioned on smoking
densityplot(~CLEANPa$bwt|CLEANPa$smoke, groups=smoke, auto.key=TRUE)
histogram(~CLEANPa$bwt|CLEANPa$smoke)

#
# m
bwplot(CLEANPa$smoke~CLEANPa$bwt|CLEANPa$Q)

#
# n
xyplot(CLEANPa$bwt~CLEANPa$BWI|CLEANPa$Q, groups=CLEANPa$smoke, auto.key=TRUE)
# I decided to use the groups parameter in the function instead of doing bwt~BWI|Q*smoke.
# I can read this much easier than the many plots that the other formula produces.
# There is not visible relationship between BWI and bwt.

#
# o
with(CLEANPa, tapply(gestation, list(Q, smoke), mean))
with(CLEANPa, tapply(gestation, list(Q, smoke), sd))
with(CLEANPa, tapply(gestation, list(Q, smoke), median))
with(CLEANPa, tapply(gestation, list(Q, smoke), IQR))
# gestation conditioned on BWI quartiles. These graphs are 
# mostly Symmetrical.
densityplot(~CLEANPa$gestation|CLEANPa$Q)
histogram(~CLEANPa$bwt|CLEANPa$Q)
# gestation conditioned on smoking
densityplot(~CLEANPa$gestation|CLEANPa$smoke, groups=smoke, auto.key=TRUE)
histogram(~CLEANPa$bwt|CLEANPa$smoke)
bwplot(CLEANPa$smoke~CLEANPa$gestation|CLEANPa$Q)
xyplot(CLEANPa$gestation~CLEANPa$BWI|CLEANPa$Q, groups=CLEANPa$smoke, auto.key=TRUE)

#
# p
xyplot(CLEANPa$bwt~CLEANPa$gestation|CLEANPa$Q*CLEANPa$smoke,
		panel=function(x, y)
		{
			panel.xyplot(x, y)
			panel.abline(lm(y~x))
			panel.abline(lqs(y~x), col=3, lty=2)
			panel.abline(rlm(y~x), col=6, lty=3)
		})
# TODO: Examine graph

#
# q


######
# 7
######
library(PASWR)
detach(CLEAN)
attach(titanic3)

#
# a
tapply(titanic3$survived, titanic3$pclass, mean)

#
# b
tapply(survived, list(pclass, sex), mean)

#
# c
densityplot(titanic3$age)
# Density plot is slighty skewed to right.
mean(titanic3[!is.na(age),]$age)
median(titanic3[!is.na(age),]$age)
IQR(titanic3[!is.na(age),]$age)

#
# d
mean(titanic3[!is.na(age) & sex == 'female' & survived == 1,]$age)
mean(titanic3[!is.na(age) & sex == 'female' & survived == 0,]$age)
median(titanic3[!is.na(age) & sex == 'female' & survived == 1,]$age)
median(titanic3[!is.na(age) & sex == 'female' & survived == 0,]$age)
# More older females survived.
range(titanic3[!is.na(age) & sex == 'female' & survived == 1,]$age)
range(titanic3[!is.na(age) & sex == 'female' & survived == 0,]$age)

#
# e
mean(titanic3[!is.na(age) & sex == 'male' & survived == 1,]$age)
mean(titanic3[!is.na(age) & sex == 'male' & survived == 0,]$age)
median(titanic3[!is.na(age) & sex == 'male' & survived == 1,]$age)
median(titanic3[!is.na(age) & sex == 'male' & survived == 0,]$age)
# More younger males survived.
range(titanic3[!is.na(age) & sex == 'male' & survived == 1,]$age)
range(titanic3[!is.na(age) & sex == 'male' & survived == 0,]$age)

#
# f
min(titanic3[survived == 1 & sex == 'female' & !is.na(age), ]$age)

#
# g
# I definitely see an issue with class warfare from the results
# in (a). Only a quarter of 3rd class passengers survived compared 
# to more than half of 1st class passengers.
# Though there were a little less than twice as many 3rd class
# passengers than 1st or 2nd.
# 
values <- quantile(titanic3[!is.na(age),]$age)
CLEANt <- cbind(titanic3[!is.na(age), 0:14], Q=cut(titanic3[!is.na(age),]$age, values, ordered_results=TRUE))
detach(titanic3)
attach(CLEANt)
densityplot(~Q|sex, groups=survived , auto.key=TRUE)
densityplot(~pclass, groups=survived, auto.key=TRUE)


######
# 8
######
detach(CLEANt)
detach(Cars2004EU)
library(PASWR)
attach(Cars2004EU)
str(Cars2004EU)
#
# a
total.cars <- (Cars2004EU$cars*population)/1000
total.cars
death.rate <- deaths/(cars*population)
death.rate
#
# b


#
# c
CARSd <- cbind(Cars2004EU, death.rate)
with(CARSd, CARSd[death.rate == min(CARSd$death.rate),])

#
# d
xyplot(population~total.cars)
# Average number of cars is around 400 per 1000 inhabitants.

#
# e
xyplot(population~total.cars, panel=function(x, y){
		panel.xyplot(x, y)
		panel.abline(lm(y~x))			
		})

# Plot show that population goes up so does cars per 1000 inhabitants.
lm(total.cars~population)
0.5172^-1 # is inverted
# y = mx+b
1.933488*19224.630+(-864.6413)
Cars2004EU[cars*(population/1000) == 19224.630,]
# Spain is it

#
# f
xyplot(total.cars~death.rate)
# No relationship....?

#
# g
cor(total.cars, death.rate, method="spearman")
# It's measuring the trend of the curve. The number is close to
# negative one so total.cars and death.rate have a close 
# relationship.

#
# h
plot(log(total.cars), log(death.rate))

#
# i
xyplot(log(total.cars)~log(death.rate), panel=function(x, y){
			panel.xyplot(x, y)
			panel.abline(lm(y~x))			
		})
lm(log(death.rate)~log(total.cars))
# y = mx + b
(-1.050^-1)*9.863948+(-1.883)

# ask about 8
