rm(list=ls())
graphics.off()

library(doBy)
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
     xlab = "height",
     col = "steelblue")

plot(density(nhanes$height), 
     main = "density plot of height distribution", 
     xlab = "height", 
     col = "steelblue", 
     lwd = 2)
# skewness formula : 3(mean - median) / SD
heights = nhanes$height
n = length(nhanes$height)
skewness_height = (3*(mean(heights) - median(heights)) / sd(heights))

print(paste(skewness_height, "skewness"))
# "-0.0390658133475752 skewness", therefore not skewed

# 4. summary (mean, SD), theoretical distribution line plot
print(paste("mean:",(mean(heights))))
print(paste("SD:",(sd(heights))))

theoretical_dist= dnorm(heights, mean = mean(heights), sd = sd(heights), log = FALSE)

plot(heights,theoretical_dist,
     type = "l",
     xlab = "height",
     ylab = "density",
     main = "theoretical normal distribution of height")

# 5. proportion > 175cm

tall_percent = round(sum(nhanes$height > 175) / length(nhanes$height) * 100, digits = 1)

print(paste(tall_percent, "% of individuals in the dataset are over 175cm"))



# 6. binomial probability. what is the probability that exactly 3 of the 20 are categorically
# tall?

tall_prob = sum(nhanes$height > 175) / length(nhanes$height)

p1 = pbinom(3, size = 20, prob = tall_prob)

p1

# 0.2126903


#. 7 binomial probability. 5 or more of 20 are tall?

p2 = 1 - pbinom(4, size = 20, prob = tall_prob)

p2

# 0.06515883


# 8. THEORETICAL percentile of 180cm individual
my_cdf = ecdf(heights)
percentile_rank = round(my_cdf(180), digits = 3)
print(percentile_rank * 100)

 # dnorm = 180, 




