# 11:12 AM
# Jan 18, 2011
# 
# Author: robert
###############################################################################

height <- c(71, 63,  70.5, 32, 65, 73, 67, 72, 72, 65, 69, 74, 72)
gender <- c("M", "F", "M", "M", "F", "M", "M", "F", "M", "M", "M", "F", "M")
height
is.factor(gender)
sex <- as.factor(gender)
is.factor(sex)
sex
class <- data.frame(height, sex)
rm(height, gender, sex)
height
gender
sex
class

rm(height)
height
head(class)
attach(class)
height

#
# Graphing
#
hist(height)
plot(density(height))
hist(height, col="pink", main="Height of First Two Rows", xlab="Heigh in inches", ylab="Number of Students")
plot(density(height), lwd=3, col="violet")
boxplot(height)
colors()
# height(sex)
boxplot(height~sex, col=c("pink", "blue"))

#
# Categorical data
table(sex)
pie(table(sex))
barplot(table(sex), col=c("tomato4", "tomato3"))

library(PASWR)
str(quine)
bwplot(Days~Sex|Eth*Lrn, data=quine )
histogram(~Days|Sex, data=quine)
densityplot(~Days|Sex, data=quine)
densityplot(~Days|Sex*Eth, data=quine, layout=c(2,2))

hist(quine$Days, col="blue")

salary <- c(20, 20, 20, 20, 200)
# When data is skewed use median for a middle value.
# When data is level use mean.
#   In our salary case you would use median
mean(salary)
sd(salary) # Standard deviation	
median(salary)
IQR(salary)

