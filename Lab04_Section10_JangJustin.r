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

# z-test because data is normal distribution
z = mean_nhv - mean_us
# z = -2.090875
CI_plus = mean_nhv + (z / (sd_nhv / sqrt(n)))
CI_min = mean_nhv - (z / (sd_nhv / sqrt(n)))

z_value = CI_plus-CI_min
  
  
p_nhv = pnorm(z_value)

print(p_nhv)
# 1.652718e-07 #### ???????????????????????????

# interpretation:

# 3. Test the hypothesis under different circumstances

# t-test because we don't know population SD (sigma)

t = qt(0.025, n - 1)

  
CI_plus_t = mean_nhv + (t / (sd_us / sqrt(n)))
CI_min_t = mean_nhv - (t / (sd_us / sqrt(n)))

t_value = CI_plus_t - CI_min_t

p_t_nhv = pnorm(t_value)

print(p_t_nhv)
# 2.185169e-10 #### ?????????????????????????

# 4. Item 2, streamlined
# syntax:
# z.test(x, y = NULL, alternative = "two.sided", mu = 0, sigma.x = NULL, sigma.y = NULL, conf.level = 0.95)
z.test(x = h_nhv, y = NULL,
       alternative = "two.sided",
       mu = mean_us,
       sigma.x = sd_us,
       conf.level = 0.95)
### One-sample z-Test

# data:  h_nhv
# z = -3.1169, p-value = 0.001828
# alternative hypothesis: true mean is not equal to 69
# 95 percent confidence interval:
#   65.59434 68.22391
# sample estimates:
#   mean of x 
# 66.90913 


# 5, Item 3, streamlined
# tsum.test()
tsum.test(
  mean.x = mean_nhv,       # Sample mean
  s.x = sd_nhv,          # Sample standard deviation
  n.x = n,           # Sample size
  mu = mean_us,           # Hypothesized population mean
  alternative = "two.sided", # "two.sided", "less", or "greater"
  conf.level = 0.95   # Confidence level
  )
# One-sample t-Test
# 
# data:  Summarized x
# t = -2.5526, df = 19, p-value = 0.01945
# alternative hypothesis: true mean is not equal to 69
# 95 percent confidence interval:
#   65.19468 68.62357
# sample estimates:
#   mean of x 
# 66.90913 

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


tsum.test(
  mean.x = mean_hfd,       # Sample mean
  s.x = sd_hfd,          # Sample standard deviation
  n.x = n,           # Sample size
  mu = mean_nhv,           # Hypothesized population mean
  alternative = "two.sided", # "two.sided", "less", or "greater"
  conf.level = 0.95)

# p-value = 0.006937
# We are 95% confident that NHV male mean height lies in the interval of BHD
# male heights. ######## CHECK

# output:
# One-sample t-Test
# 
# data:  Summarized x
# t = 3.0268, df = 19, p-value = 0.006937
# alternative hypothesis: true mean is not equal to 66.90913
# 95 percent confidence interval:
#   67.72037 71.35711
# sample estimates:
#   mean of x 
# 69.53874 
# 7. Check your assumptions


# 8. What if the data were paired?