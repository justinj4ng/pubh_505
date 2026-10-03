# Lab 4

# close all, clear all
rm(list=ls())
graphics.off()

# 0. set the working directory
setwd("~")

# 1. Generate height data for NHV-area males
set.seed(505) # set seed per prompt

# generate 20 normally-distributed random values, where the 
# underlying distribution has a mean value of 68.4 inches, and a
# standard deviation of 4 inches.
h_nhv = rnorm(n = 20, mean = 68.4, sd = 4)

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
CI_plus = mean_nhv + (z / (sd_us / sqrt(n)))
CI_min = mean_nhv - (z / (sd_us / sqrt(n)))

z_value = CI_plus-CI_min
  
  
p_nhv = pnorm(z_value)

print(p_nhv)
# 2.2765e-10 #### ???????????????????????????



# 3. Test the hypothesis under different circumstances


# 4. Item 2, streamlined
# 5, Item 3, streamlined
# 6. What about HFD-area males
# 7. Check your assumptions
# 8. What if the data were paired?