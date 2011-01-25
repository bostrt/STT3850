# 11:02:52 AM
# Jan 25, 2011
# 
# Author: Robert Bost
###############################################################################

f <- function(x){
	(1/sqrt(2*pi))*exp(-x^2/2)
}
curve(f, -4, 4)
integrate(f, -Inf, Inf)
# Don't use big number to approximate infinity
integrate(f, -4000, 4000)
lvalues <- c(-Inf, -3, -2.5, -2, -1.5, -1)
uvalues <- c(Inf, 3, 2.5, 2, 1.5, 1)
for(i in 1:length(lvalues)){
	print(integrate(f, lvalues[i], uvalues[i])$value)
}

# In book:
# pdist -- Cumulative distribution integrates from -Inf -> x
# qdist -- Inv cumulative distribution 
# ddist -- density function 
# rdist -- random numbers from dist.

# Working with Matrices
x <- matrix(data=1:16, nrow=4, byrow=TRUE)
x

# LETTERS give capital letters 1-4
y <- matrix(data=1:16, nrow=4, byrow=FALSE,
		dimnames=list(LETTERS[1:4], letters[1:4]))
y

# Two steps
z <- matrix(1:16, nrow=4)
dimnames(z) <- list(LETTERS[1:4], letters[1:4])
z

z
# All rows, third column 
z[, 3]
# All rows, third column #2
z[, "c"]
# Do not drop dimensions, notice how the above
# outputs are not columns
z[, 3, drop=FALSE]

# cbind -- column bind
# rbind -- row bind

apply(X = barley.data, MARGIN = 1, FUN = mean)

# t() -- transpose

# Ax = b
# A^-1 A x = A^-1 b
# x = A^-1 b
#
# %*% -- matrix mulitiplication
A <- matrix(data=c(3,2,1,2,-3,1,1,1,1),
		nrow=3, byrow=TRUE)
b <- matrix(data=c(10, -1, 6), nrow=3, byrow=TRUE)
x1 <- solve(A)%*%b
x2 <- solve(A, b) # same as above
cbind(x1, x2)

# det() -- determinant
# diag() --
# eigen() --
# crossprod() --

for(m in seq(10, 50, by=5)){
	print(c(m, 1-prod(365:(365-m+1))/365^m))
}

data(Grades, package="PASWR")
attach(Grades)
par(mfrow=c(2,2))
plot(sat, gpa)
plot(x=sat, y=gpa)

# Median -- number that splits ditribution in half
# write function that computes median
myMedian <- function(x){
	n <- length(x)
	if(n %% 2 == 1){
		# Number is odd
		sort(x)[(n+1)/2]
	}else{
		# Even
		twomiddle <- sort(x)[c(n/2, n/2+1)]
		mean(twomiddle)
	}
}