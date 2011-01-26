# 11:46:17 AM
# Jan 20, 2011
# 
# Author: Robert Bost
# Author: Jeff Schauble
# Author: Nick Galloway
###############################################################################
# Chapter 1 
# Problems 8 through 12
###############################################################################
######
# 8
######
library(PASWR)
str(vit2005)
attach(vit2005)
#
# a
table(garage)
#
# b
tapply(totalprice, garage, mean)
#
# c
table(garage, elevator)
#
# d
tapply(totalprice, list(garage, elevator), mean)
#
# e 
vit2005[garage >= 1,]
#
# f
dir.create("R_data")
setwd("R_data")
file.create("data.c")
results <- vit2005[category == "3B" & elevator >= 1,]
write.table(results, file="data.c")
#
# g
the_table <- read.table("data.c")
c(mean(the_table$totalprice), mean(the_table$area))

######
# 9
######
detach(vit2005)
attach(EPIDURALf)
#
# a
length(EPIDURALf[Treatment == "Hamstring Stretch", 1])
#
# b
THS <- table(Treatment, Ease)
# Proportion of hamstring stretch for each "Ease" level
prop.table(THS, 1)[1,]
#
# c
# Proportion of "Easy" that did "Traditional Sitting"
prop.table(THS, 2)[2,2]
#
# d
# I am assuming by "mean weight" the books means "kg"
tapply(kg, list(Ease, Treatment), mean)
#
# e
get_bmi <- function (weight, dist){
	weight/(dist/100)^2
}
EPIDURALf[Ease == "Easy" & get_bmi(kg, cm) < 25,]

######
# 10
######
#
# a 
tourists <- matrix(c(9.303,9.536,9.918,7.959,7.736,8.875,15.224,15.629,16.090,0.905,0.894,0.883,17.463,18.635,20.148), ncol=3, byrow=TRUE)
rownames(tourists) <- c("Germany", "France", "Great Britain", "USA", "Rest of the world")
colnames(tourists) <- c(2003, 2004, 2005)
tourists
#
# b
margin.table(tourists,1)
#
# c
margin.table(tourists,2)

######
# 11 
######
conv <- function(){
	for(i in seq(18, 28, 2)){
		print((9/5)*i+32)
	}	
}
conv()

######
# 12 
######
# Kilometers to miles.
km2m <- function(km){
	.6214*km
}
km2m(10.2)

# Hectare to acre.
ha2a <- function(ha){
	2.471*ha
}
ha2a(22.4)

# Liter to gallon.
l2g <- function(l){
	0.22*l
}
l2g(13.5)
