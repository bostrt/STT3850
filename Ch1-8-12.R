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
total_ham_stretch <- length(EPIDURALf[Treatment == "Hamstring Stretch",1])
# Proportion of hamstring stretch that were easy
easy <- length(EPIDURALf[Treatment == "Hamstring Stretch" & Ease == "Easy",1])
easy/total_ham_stretch
# Proportion of hamstring stretch that were difficult
difficult <- length(EPIDURALf[Treatment == "Hamstring Stretch" & Ease == "Difficult",1])
difficult/total_ham_stretch
# Proportion of hamstring stretch that were impossible
impossible <- length(EPIDURALf[Treatment == "Hamstring Stretch" & Ease == "Impossible",1])
impossible/total_ham_stretch

# OR A, B, C all in one table
TE <- table(Treatment, Ease)
TE[Treatment == "Traditional Sitting",1]
#
# c
total_easy <- length(EPIDURALf[Ease == "Easy", 1])
trad_sit <- length(EPIDURALf[Ease == "Easy" & Treatment == "Traditional Sitting",1])
# Proportion of easy that had traditional sitting  
trad_sit/total_easy 
#
# d
