# 10:57:56 AM
# Jan 27, 2011
# 
# Author: Robert Bost
###############################################################################

# Problem done by hand in notes.
DS = 1:5
sd(DS)
var(DS)

library(PASWR)
head(Grades)
xyplot(gpa~sat, data=Grades)
lmobject <- lm(gpa~sat, data=Grades)
lmobject
plot(Grades$sat,Grades$gpa)
abline(lmobject)

