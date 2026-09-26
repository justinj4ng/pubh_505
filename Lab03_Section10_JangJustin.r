rm(list=ls())
graphics.off()

library(doBy)
library(moments)
# 1. 
setwd("~/pubh_505")

nhanes = read.csv("NHANES_DemoBMX.csv")
print(paste(nrow(nhanes), "rows"))
# 9338 rows

# 2, subset to 3 specified categories
nhanes = nhanes[,c("riagendr", "ridageyr", "bmxht")] # subset this data-frame
names(nhanes) <- c("gender", "age", "height")
nhanes = na.omit(nhanes)

nhanes = subset(nhanes, age >= 13 & age <= 15)
print(paste(nrow(nhanes), "rows"))
# 473 rows

# 3.visualization of height distribution

hist(nhanes$height,
     main = "histogram of height distribution",
     xlab = "height(cm)",
     col = "steelblue")

plot(density(nhanes$height), 
     main = "density plot of height distribution", 
     xlab = "height(cm)", 
     col = "steelblue", 
     lwd = 2)

# use moments package
heights = nhanes$height

h_skewness = skewness(nhanes$height)

print(paste(h_skewness, 
            "skewness, the distribution is acceptably symmetric, and not skewed"))
# "0.193857189895947 skewness, the distribution is acceptably symmetric, and not skewed"




# 4. summary (mean, SD), theoretical distribution line plot
mean_heights = mean(heights)
sd_heights = sd(heights)

print(paste("mean:",(mean_heights), "cm"))
print(paste("SD:",(sd_heights), "cm"))

# "mean: 164.082241014799 cm"
# "SD: 9.04312301037489 cm"

x_vals = seq(min(heights), max(heights), by = 0.1)

theoretical_dist= dnorm(x_vals, mean = mean_heights, sd = sd_heights, log = FALSE)

plot(x_vals,theoretical_dist,
     type = "l",
     xlab = "height(cm)",
     ylab = "density",
     main = "theoretical normal distribution of height")

# 5. proportion > 175cm

tall_percent = round(sum(nhanes$height > 175) / length(nhanes$height) * 100, digits = 1)

print(paste(tall_percent, "% probability of being over 175cm"))

# "11.2 % probability of being over 175cm"


# 6. binomial probability. what is the probability that exactly 3 of the 20 are categorically
# tall?

tall_prob = sum(nhanes$height > 175) / length(nhanes$height)

p1 = dbinom(3, size = 20, prob = tall_prob)

p1 = round(p1, digits = 3) * 100
# 0.2126903

print(paste(p1, "% probability of getting exactly 3 tall individuals"))

# "21.3 % probability of getting exactly 3 tall individuals"



#. 7 binomial probability. 5 or more of 20 are tall?

p2 = 1 - pbinom(4, size = 20, prob = tall_prob)

p2= round(p2, digits = 3) * 100

print(paste(p2, "% probability that 5 or more individuals are tall"))
# "6.5 %probability that 5 or more individuals are tall"


# 0.06515883


# 8. THEORETICAL percentile of 180cm individual

mean_heights = mean(heights)
sd_heights = sd(heights)

percentile_180 = pnorm(q = 180, mean_heights, sd_heights, lower.tail = TRUE) * 100

pnorm = round(percentile_180, digits = 1)
print(paste(pnorm, "percentile for an 180cm individual"))
# "96.1 percentile for an 180cm individual"





