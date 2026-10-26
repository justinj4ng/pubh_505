# Lab 6
# justin.jang@yale.edu
# @justinj4ng

rm(list=ls())
graphics.off()

setwd("~/pubh_505")

# 1. subsetting
yale = read.csv("Yale_Athletics.csv")

#logical indexing/subsetting
yale = yale[yale$Year >= 2005 & yale$Year <= 2015,]

base = yale$Height[yale$Sport == "Baseball"]

foot = yale$Height[yale$Sport == "Football"]

length(base)
length(foot)

# 2. are the distributions normal?
# shapiro-wilk test

shapiro.test(base)
shapiro.test(foot)

# p-value < 0.05: fail to reject H_O; insufficient evidence that the data deviate from normality.




# 3.