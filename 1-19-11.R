# 10:58:31 AM
# Jan 19, 2011
# 
# Author: Robert Bost
###############################################################################
foo <- c(2, 3, 5)
mean(foo)
median(foo)

INFO <- data.frame(age = 0)
INFO
fix(INFO)

# blah <- read.table(file="C:/file.txt", header=TRUE)
# blah[1:5, 1:12]  # Show 5 rows and 12 columns

# Read in from URL
site <- "http://www1.appstate.edu/~arnholta/PASWR/CD/data/Baberuth.txt"
BR1 <- read.table(file=url(site), header=TRUE)
BR1[1:5, 1:12]

# Read in from clipboard!
waste <- read.table("clipboard", header=TRUE, na.strings="*")
head(waste)

# Can read in CSV files from disk or url

library(PASWR)
Baberuth
# rows 1-6 and columns 3-6
Baberuth[1:6,3:6]
# Show first 2 rows
head(Baberuth, n=2)

getwd()
setwd("/home")
getwd()
setwd('/home/robert')
getwd()
dir.create("/home/robert/asdfasdfasdf")

site <- "http://www1.appstate.edu/~arnholta/PASWR/CD/data/Poplar3.CSV"
poplar <- read.csv(file=url(site), header=TRUE)
head(poplar)
str(poplar)
summary(poplar)

# Missing values are -99
poplar <- read.csv(file=url(site), na.strings="-99", colClasses=c(rep("factor", 3), rep("numeric", 3), "factor"))
str(poplar)
summary(poplar)
     