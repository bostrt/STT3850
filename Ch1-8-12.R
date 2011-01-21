# 11:46:17 AM
# Jan 20, 2011
# 
# Author: Robert Bost
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
