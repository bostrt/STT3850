# 11:29:06 AM
# Feb 8, 2011
# 
# Author: Robert Bost
###############################################################################

# Combination
choose(8,5)

# Factorial
factorial(170)
prod(1:5)

# If sum of 3 dice equal 9 then you win!
# Find probability of winning.
# Probability => <Outcomes of Interest> / <Total outcomes>
# Roll 3 dice
S <- expand.grid(roll1 = 1:6, roll2 = 1:6, roll3 = 1:6)
head(S, 10)
nrow(S[S$roll1+S$roll2+S$roll3 == 9, ])

three_rolls <- apply(S, 1, sum)
three_rolls
length(which(apply(S[, c("roll1", "roll2", "roll3")], 1, sum) == 9))



