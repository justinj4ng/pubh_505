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
# shapiro-wilk test tests whether a dataset comes from a normal distribution

SW_P_base = shapiro.test(base)$p.value
SW_P_foot = shapiro.test(foot)$p.value

cat("Shapiro-Wilk test for baseball heights. P-value:", SW_P_base,"There is insufficient evidence that the data deviate from normality.\n")
cat("Shapiro-Wilk test for football heights. P-value:", SW_P_foot,"There is insufficient evidence that the data deviate from normality.\n")

# p-value < 0.05: fail to reject H_O; insufficient evidence that the data deviate from normality.


# 3. hypothesis test. t-test

# 
# equal variance?
t.test(base, foot, var.equal = F)


# 4. 1-way ANOVA

# 5. test skewness of residuals, is ANOVA justified?

#5. 2-way ANOVA

yale = yale[which(yale$Sport %in% c("Baseball", "Football")),]
yale$Year = as.factor(yale$Year)
aov(Height~Sport + Year, data=yale)

# 7. 2-way ANOVA but reverse the order of the predictor

# 8. rerun both 2-way ANOVAs, but as type-II ANOVA


