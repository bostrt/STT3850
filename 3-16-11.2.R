# 
# Co-Author: Robert Bost
# Co-Author: Nick Galloway
# Co-Author: Jeff Schauble
###############################################################################

# 1
# n = 10
# pi = (3/36)
# X = # of rolls with at least one 6
# X~Bin(10, 3/36)
# P(X=5)
dbinom(5, 10, 11/36)

# 2
# E[X] = 35
# P(X >= 30)
# OR 1-P(X < 29)
1-ppois(29, 35)

# 4
# E[X] = (1-PI)/PI
# PI = 1/12
E <- (1-(1/12))/(1/12)
dgeom(2, 1/12)

# 5
dnbinom(3, 7, .2)

# 6
sum(dhyper(7:12, 160, 200, 12))

# 7
.5 

# 8	
# mean = 39.8
# SD = 2.05
# X = # of soldiers with chest >= 40
# P(X = 5)
prob <- 1 - pnorm(40, 39.8, 2.05)
dbinom(5, 20, prob)

# 9
qnorm(.05, 1000, 100)
# LIARS

# 10
(-2.718^(-200)+1)

# 11
# lambda = 12 
# 
1 - pgamma(7, 3, .5)

# 12
# F's
F <- pnorm(60, 72, 7)
F 
# D's
D <- pnorm(70, 72, 7) - F
D
# C's
C <- pnorm(80, 72, 7) - (D+F)
C
# B's
B <- pnorm(90, 72, 7) - (D+F+C)
B
# A's
A <- pnorm(100, 72, 7) - (D+F+C+B) 
A

# 13
susie <- dnbinom(5, 6, .58)
alan <- dnbinom(5, 6, .42)
susie + alan # Ends in seven games 
susie/(susie+alan) # Ends in seven games and Susie wins

# 14
dbinom(0:10, 10, .45)
# k -> 4
max(dbinom(0:10, 10, .45))

# 15
# 8/32 * 4 = 1

# 16
ppois(4, 6)

# 17
# a.
# c = 3
# b.
pexp(.5,3)

# 18
prob <- 1-pnorm(100, 95, 11)
1 - pbinom(1, 10, prob)

# 19
E <- (1/6)*72

# 20

# 21

dbinom(3, 31, x)

# 24
# Must have more than 30 customers....so 31
# 31 customers / 12 customers per hour gives you hours.
31/12


		