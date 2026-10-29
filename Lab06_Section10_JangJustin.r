# Lab 6
# justin.jang@yale.edu
# @justinj4ng

rm(list=ls())
graphics.off()

library(moments)
library(car)

setwd("~/pubh_505")

# 1. subsetting
yale = read.csv("Yale_Athletics.csv")

#logical indexing/subsetting
yale = yale[yale$Year >= 2005 & yale$Year <= 2015,]

base = yale$Height[yale$Sport == "Baseball"]

foot = yale$Height[yale$Sport == "Football"]

cat(length(base),"baseball observations\n")
cat(length(foot),"football observation\n")

# 79 baseball observations
# 369 football observation


# 2. are the distributions normal?
# Use skewness() from moments

skew_base = abs(skewness(base, na.rm = T))
# 0.2161072
skew_foot = abs(skewness(foot, na.rm = T))
# 0.3848342

# print interpretation

# F-test to compare variances
Ftest = var.test(base, foot)



cat("Skewness of baseball heights",skew_base, "\n")
cat("Skewness of football heights", skew_foot, "\n")
cat("The distributions of baseball and football heights are sufficiently homoskedastic.")

cat("P-value:",
    Ftest$p.value,
    "; there is insufficient evidence that the variances differ.")

# OUTPUT:
# 

# 3. hypothesis test. t-test

# distributions are symmetric
# equal variance

Ttest = t.test(base,
        foot,
        alternative = "two.sided",
        var.equal = T)

cat("P-value:",
    Ttest$p.value,
    "; there is insufficient evidence that there is a difference between baseball and football heights")

# OUTPUT:
# P-value: 0.1584563 ; there is insufficient evidence that there is a difference between baseball and football heights


# 4. 1-way ANOVA

model1 = aov(Height ~ Sport, data = yale)
print(summary(model1))
p_anova1 = summary(model1)[[1]]["Sport", "Pr(>F)"]
cat("P-value:", p_anova1,
    "; there is insufficient evidence of a statistically significant difference in mean height between baseball and football players ",
    "\n")


# 5. test skewness of residuals, is ANOVA justified?

skew_resid1 = skewness(residuals(model1))
print(skew_resid1)

cat
# -0.3509842
# not skewed

# OUTPUT:
# 


# 6. 2-way ANOVA, sport as first predictor

yale = yale[which(yale$Sport %in% c("Baseball", "Football")),]
yale$Year = as.factor(yale$Year)
model_sport_year = aov(Height ~ Sport + Year, data=yale)


print(summary(model_sport_year))
p_sport_first = summary(model_sport_year)[[1]]["Sport", "Pr(>F)"]
cat("P-value:", p_sport_first,"f", "\n")

# OUTPUT:
# P-value: 0.1605279 f  
# 7. 2-way ANOVA but reverse the order of the predictor

model_year_sport = aov(Height ~ Year + Sport, data = yale)
print(summary(model_year_sport))
p_sport_second = summary(model_year_sport)[[1]]["Sport", "Pr(>F)"]
cat("P-value:", p_sport_second, "\n")

# OUTPUT:
#P-value: 0.1331922

# 8. rerun both 2-way ANOVAs, but as type-II ANOVA
type2_sport_year = car::Anova(model_sport_year, type = 2)
type2_year_sport = car::Anova(model_year_sport, type = 2)

print(type2_sport_year)
print(type2_year_sport)

cat("Sport + Year p-value:",
    type2_sport_year["Sport", "Pr(>F)"], "\n")
cat("Year + Sport p-value:",
    type2_year_sport["Sport", "Pr(>F)"], "\n")

# OUTPUT:
# Sport + Year p-value: 0.1331922 
# Year + Sport p-value: 0.1331922 
