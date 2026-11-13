# Lab 7
# justin.jang@yale.edu
# @justinj4ng

rm(list=ls())
graphics.off()

# 0. set the working directory
setwd("~/pubh_505")
nhanes = read.csv("NHANES_DemoBMX.csv")

#1.
rows = nrow(nhanes)
cols = ncol(nhanes)

cat(rows,"observations")
cat(cols, "variables")

# 2.remove NA values, 
nhanes = nhanes[,colMeans(is.na(nhanes)) <= 0.5]
  
cat(cols, "variables after cleaning")

# 3. subset to adult males

nhanes[]
