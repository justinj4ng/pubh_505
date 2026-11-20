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

cat(rows,"observations\n")
cat(cols, "variables\n")

### OUTPUT:
# 9338 observations
# 32 variables



# 2.remove missing values
nhanes = nhanes[,colMeans(is.na(nhanes)) <= 0.5]
cols = ncol(nhanes)

cat(cols, "variables after excluding variables with >50% missing values\n")

### OUTPUT:
# 25 variables after excluding variables with >50% missing values



# 3. subset to adult males

#subset to adults
nhanes = nhanes[nhanes$ridageyr >= 18 & nhanes$ridageyr <= 40 & nhanes$riagendr == 1,]
nhanes = na.omit(nhanes)
# dimensionality of subsetted df
rows = nrow(nhanes)
cols = ncol(nhanes)

cat(rows,"observations after subsetting\n")
cat(cols, "variables after subsetting\n")

### OUTPUT
# 941 observations after subsetting
# 25 variables after subsetting


# 4. Keep only certain columns
nhanes = nhanes[, c("ridageyr", "wtmec2yr", grep("bmx", names(nhanes),
                ignore.case = TRUE,value = TRUE)), drop = FALSE]

cols = ncol(nhanes)

cat(cols, "variables after subsetting\n")

### OUTPUT:
# 9 variables after subsetting


# 5. correlation
# build corrplot
nhanes_numeric = nhanes[, sapply(nhanes, is.numeric)]
nhanes_corr_matrix = cor(nhanes_numeric, use = "pairwise.complete.obs")
# corrplot(nhanes_corr_matrix)


# report which variables co-cluster with bmxht, bmxwt.
corrplot(nhanes_corr_matrix, 
         order = "hclust",
         method = "color",
         
         title = "Correlation Matrix of Age, Survey Weight, and Body-Composition Measures",
         mar = c(0, 0, 2, 0)
         )
#hclust for hierarchical clustering

# hc <- hclust(as.dist(1 - nhanes_corr_matrix), method = "complete")
# plot(
#   hc,
#   main = "Hierarchical Clustering of NHANES Variables",
#   xlab = "",
#   sub = "",
#   ylab = "Correlation-based distance"
# )


print("bmxwt co-clusters with bmxarmc, bmxbmi, bmxwaist")
print("bmxht co-clusters with bmxleg and bmxarml")

### OUTPUT:
# bmxwt co-clusters with bmxarmc, bmxbmi, bmxwaist
# bmxht co-clusters with bmxleg and bmxarml


# 6. lin reg

linmod = lm(bmxwt ~ bmxht, data = nhanes)
# summary(linmod)

slope = coef(linmod)['bmxht'] # call x var for the slope
slope = round(slope, digits = 3)

cat("The slope coefficient between wt and ht:", slope, "kg/cm\n")
cat("Every 1 cm of height is associated with a", slope,"kg increase in weight\n")
 
### OUTPUT:
# The slope coefficient between wt and ht: 1.093 kg/cm
# Every 1 cm of height is associated with a 1.093 kg increase in weight


# 7. lin reg add ridageyr as covariate

linmod_age = lm(bmxwt ~ bmxht + ridageyr, data = nhanes)
# summary(linmod_age)

### OUTPUT:

slope = coef(linmod_age)['bmxht'] # call x var for the slope
slope = round(slope, digits = 3)

cat("The slope coefficient between wt and ht:", slope, "kg/cm\n")
cat("Every 1 cm of height is associated with", slope, "kg increase, adjusted for age\n")

### OUTPUT:
# The slope coefficient between wt and ht: 1.085 kg/cm
# Every 1 cm of height is associated with 1.085 increase in weight, adjusted for age


# 8. lin reg, include survey weights
linmod_weighted_simple = lm(
  bmxwt ~ bmxht + ridageyr,
  data = nhanes,
  weights = wtmec2yr
)

slope = coef(linmod_weighted_simple)['bmxht'] # call x var for the slope
slope = round(slope, digits = 3)


cat("The slope coefficient between wt and ht:", slope, "kg/cm")
cat("Every 1 cm of height is associated with ",slope, "kg increase, weighted by ")


