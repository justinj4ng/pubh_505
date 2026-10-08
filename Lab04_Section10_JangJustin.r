# Lab 4

# close all, clear all
rm(list=ls())
graphics.off()

# 0. set the working directory
setwd("~")
library(BSDA)

# 1. Generate height data for NHV-area males
set.seed(505) # set seed per prompt

# generate 20 normally-distributed random values, where the 
# underlying distribution has a mean value of 68.4 inches, and a
# standard deviation of 4 inches.
h_nhv = rnorm(n = 20, mean = 68.4, sd = 4)

is.vector(h_nhv) # sanity check


mean_nhv = mean(h_nhv)
sd_nhv = sd(h_nhv)

print(paste(round(mean_nhv, digits = 1),"inches"))
print(paste(round(sd_nhv, digits = 1),"inches"))





# 2. Test the hypothesis that NHV males are short
mean_us = 69
sd_us = 3
n = 20

z_value = (mean_nhv - mean_us) / (sd_us / sqrt(n))

p = pnorm(z_value)


print(p)


# interpretation:
# H0: Mean New Haven height = 69 inches.
# Ha: Mean New Haven height < 69 inches.
# Z-statistic = -3.117.
# P-value = 0.00091.
# Since p < 0.05, we reject the null hypothesis.
# There is statistically significant evidence that
# New Haven males have a mean height below 69 inches.





# 3. Test the hypothesis under different circumstances

# t-test because we don't know population SD (sigma)

t_value = (mean_nhv - mean_us) / (sd_nhv / sqrt(n))

p_t_nhv = pt(t_value, df = n - 1)

print(p_t_nhv)


#
#
#


# 4. Item 2, streamlined
# syntax:
# z.test(x, y = NULL, alternative = "two.sided", mu = 0, sigma.x = NULL, sigma.y = NULL, conf.level = 0.95)
z.test(x = h_nhv, y = NULL,
       alternative = "less",
       mu = mean_us,
       sigma.x = sd_us,
       conf.level = 0.95)

### One-sample z-Test




# 5, Item 3, streamlined
# tsum.test()
tsum.test(
  mean.x = mean_nhv,       # Sample mean
  s.x = sd_nhv,          # Sample standard deviation
  n.x = n,           # Sample size
  mu = mean_us,           # Hypothesized population mean
  alternative = "less", # "two.sided", "less", or "greater"
  conf.level = 0.95   # Confidence level
  )

# t = -2.5526, df = 19, p-value = 0.009726



# 6. What about HFD-area males
set.seed(50505) # set seed per prompt

# generate 20 normally-distributed random values, where the 
# underlying distribution has a mean value of 68.8 inches, and a
# standard deviation of 3.8 inches.
#generate for Hartford males  
h_hfd = rnorm(n = 20, mean = 68.8, sd = 3.8)

mean_hfd = mean(h_hfd)
sd_hfd = sd(h_hfd)

print(paste(round(mean_hfd, digits = 1),"inches"))
print(paste(round(sd_hfd, digits = 1),"inches"))


t.test(
  h_nhv,
  h_hfd,
  alternative = "two.sided",
  var.equal = TRUE
)
# t = -2.0281, df = 38, p-value = 0.0496










# 7. Check your assumptions
shapiro.test(h_hfd) # test normality
shapiro.test(h_hfd)

# p = 0.4464. We fail to reject the null hypothesis of normality.
# There is insufficient evidence to conclude that the Hartford
# heights deviate from a normal distribution.

var.test(h_nhv, h_hfd)
# p-value = 0.8002
# The data are not adequately homskedastic.



# 8. What if the data were paired?
t.test(h_nhv,
       h_hfd,
       alternative = "two.sided",
       mu = 0,
       paired = TRUE
       )

