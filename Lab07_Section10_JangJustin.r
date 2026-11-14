# Lab 7
# justin.jang@yale.edu
# @justinj4ng

rm(list=ls())
graphics.off()

library(corrplot)  

# 0. set the working directory
setwd("~/pubh_505")
nhanes = read.csv("NHANES_DemoBMX.csv")

# 1.
rows = nrow(nhanes)
cols = ncol(nhanes)

cat(rows,"observations")
cat(cols, "variables")

### OUTPUT:
# 9338 observations> cat(cols, "variables")
# 32 variables



# 2.remove NA values
nhanes = nhanes[,colMeans(is.na(nhanes)) <= 0.5]
  
cat(cols, "variables after cleaning")

### OUTPUT:
# 32 variables after cleaning

# 3. subset to adult males

#subset to adults
nhanes = nhanes[nhanes$ridageyr >= 18 & nhanes$ridageyr <= 40 & nhanes$riagendr == 1,]

# dimensionality of subsetted df
rows = nrow(nhanes)
cols = ncol(nhanes)

cat(rows,"observations after subsetting")
cat(cols, "variables after subsetting")

### OUTPUT
# 1149 observations after subsetting
# 25 variables after subsetting


# 4. Keep only certain columns
nhanes = nhanes[, c("ridageyr", "wtmec2yr", grep("bmx", names(nhanes), value = TRUE)), drop = FALSE]
cols = ncol(nhanes)

cat(cols, "variables after subsetting")

### OUTPUT:
# 9 variables after subsetting


# 5. correlation
nhanes_numeric <- nhanes[, sapply(nhanes, is.numeric)]
nhanes_corr_matrix = cor(nhanes_numeric, use = "pairwise.complete.obs")
corrplot(nhanes)
