# TODO: Add comment
# 
# Co-Author: Robert Bost
# Co-Author: Nick Galloway
# Co-Author: Jeff Schauble
###############################################################################


# 2
plot(dbinom(0:8, 8, .3))
x <- 0:8
px <- dbinom(x, 8, .3)
plot(x, px, type="h")
qbinom(.44, 8, .7)
sum(dbinom(3:20, 20, .2)) 
# OR
1-pbinom(2, 20, .2)

# 3
dpois(0, 2)
1-ppois(2, 2)
qpois(.7, 2)

# 4
# ASKKKK
pexp(6, 3)-pexp(2, 3)

# 5
seed <- 500
