# 11:08:29 AM
# Jan 26, 2011
# 
# Author: Robert Bost
###############################################################################


# Plotting
library(MASS)
attach(quine)
par(mfrow=c(2,2))
plot(Days~Age)	# Scatterplot
is.numeric(Days)
is.factor(Age)
plot(Age~Sex)	#
detach(quine)
attach(geyser)
str(geyser)
plot(geyser)
plot(density(waiting))

x <- c(1,2,3,4,5,6)
y <- c(6,5,4,3,2,1)
z <- c(9,8,7,6,5,4)
plot(z~y|x)