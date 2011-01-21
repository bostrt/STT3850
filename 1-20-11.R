# 11:02:45 AM
# Jan 20, 2011
# 
# Author: Robert Bost
###############################################################################
# Today.
# 	1. table
#	2. tapply 
#	3. write own function
#

library(PASWR)
str(quine)
table(quine$Sex, quine$Lrn) # AL-Avg. Learner, SL-Slow Learner
# applying the to ragged array, days.
tapply(quine$Day, list(quine$Sex, quine$Lrn), mean)
tapply(quine$Day, list(quine$Sex, quine$Lrn), max)
tapply(quine$Day, list(quine$Sex, quine$Lrn), sd)
# str() gives structure of frame
str(quine)
# Max missed days Sex vs. Ethinicity
tapply(quine$Day, list(quine$Sex, quine$Eth), max)

# Over whole table...who's male?
quine$Sex=="M"
quine$Sex=="M" & quine$Lrn == "AL"
# NOOOOOO!!!!!!!!!!....yes maybe? Ask
head(quine[quine$Sex=="M" & quine$Lrn == "AL", ])

values <- c(14, 24, 36, 5678, 23, 2345)
# Integral
stump <- function(x){
	exp(-x^2)
}
stump(values)
result <- for(i in 1:length(values)){
	print(integrate(stump, 0, values[i]))
}

curve(stump, 0, 30)

square <- function(x){
	x^2
}
