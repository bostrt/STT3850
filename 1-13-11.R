# TODO: Add comment
# 
# Author: robert
###############################################################################

# Assign ages var
ages <- c(22, 20, 23, 27, 21, 20, 21)
sum(ages)/7.0
mean(ages)

# Read data from stdin
junk <- scan() 
12 123 4 45 65 389 3585 3  43 34 

library("PASWR")
head(vit2005)

# ways to access vars in dataframes
mean(vit2005$totalprice)
with(data=vit2005, mean(totalprice))
attach(vit2005)
mean(totalprice)

ages2 = c(20, 22, 20, 20, 28, 27, 22)
ages2
num = c(4:1)
num