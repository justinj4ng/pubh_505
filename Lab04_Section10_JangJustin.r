# Lab 4
# justin.jang@yale.edu
# @justinj4ng


# sorry for the inconsistent print statements, I will cat() for everything in
# the next lab.

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
h_nhv = rnorm(n = 20, mean = 68.4, sd = 4) # args assigned by prompt

is.vector(h_nhv) # sanity check


mean_nhv = mean(h_nhv)
sd_nhv = sd(h_nhv)

cat("mean:", round(mean_nhv, 1),"in")
cat("standard deviation:", round(sd_nhv, 1), "in")


# OUTPUT
# mean: 66.9 in
# standard deviation: 3.7 in

# 2. Test the hypothesis that NHV males are short

# 1-sample Z-test: determine whether an unknown population mean (US males)
# differs significantly from a known/hypothesized population mean(NHV males) when the 
# population SD(US SD, given in prompt) is known.

# "population" parameters from prompt
mean_us = 69
sd_us = 3
n = 20

z_value = (mean_nhv - mean_us) / (sd_us / sqrt(n))

p = pnorm(z_value)


# printed answer
cat('H_0: Mean New Haven height = 69 in')
cat('H_a: Mean New Haven height < 69 in')
cat('z-statistic =', z_value)
cat('p-value:', p)
cat('Since p < 0.05, we reject the null hypothesis. There is evidence that New Haven males have a mean height below 69 in.')

# OUTPUT
# H_0: Mean New Haven height = 69 in
# H_a: Mean New Haven height < 69 in
# z-statistic = -3.116892
# p-value: 0.0009138421
# Since p < 0.05, we reject the null hypothesis. There is statistically significant evidence that New Haven males have a mean height below 69 in.


# 3. Test the hypothesis under different circumstances

# b/c sigma not known.....
# 1-sample t-test: compare the sample mean(mean_nhv) against a pop. mean mu (mean_us)

t_value = (mean_nhv - mean_us) / (sd_nhv / sqrt(n))

p_t_nhv = pt(t_value, df = n - 1)

# print(p_t_nhv)

cat('H_0: The New Haven mean male height is = 69 in')
cat('H_a: THe  mean height of New Haven males is < 69 in')
cat('p-value:', p_t_nhv)
cat('Since p < 0.05, we reject the null hypothesis. There is evidence that the mean height of New Haven males is below 69 in.')

# OUTPUT
# H_0: The New Haven mean male height is = 69 in
# H_a: The  mean height of New Haven males is < 69 in
# p-value: 0.00972631
# Since p < 0.05, we reject the null hypothesis. There is evidence that the mean height of New Haven males is below 69 in.



# 4. Item 2, streamlined
# syntax:
# z.test(x, y = NULL, alternative = "two.sided", mu = 0, sigma.x = NULL, sigma.y = NULL, conf.level = 0.95)
test = z.test(x = h_nhv, y = NULL,
       alternative = "less", # 1-tailed
       mu = mean_us,
       sigma.x = sd_us,
       conf.level = 0.95)

cat('p-value:', test$p.value)
cat('Since p < 0.05, we reject the null hypothesis. There is evidence that New Haven males have a mean height below 69 in.')

# OUTPUT
# p-value: 0.0009138421
# Since p < 0.05, we reject the null hypothesis. There is evidence that New Haven males have a mean height below 69 in.



# 5. Item 3, streamlined
#t.test()
test = t.test(h_nhv, 
              mu = mean_us,
              alternative = 'less'
              )

cat('p-value:', test$p.value)
cat('Since p < 0.05, we reject the null hypothesis. There is evidence that New Haven males mean height is lower than the American mean height.')

# 6. What about HFD-area males
set.seed(50505) # set seed per prompt

# generate 20 normally-distributed random values, where the 
# underlying distribution has a mean value of 68.8 inches, and a
# standard deviation of 3.8 inches.
#generate for Hartford males

h_hfd = rnorm(n = 20, mean = 68.8, sd = 3.8)

mean_hfd = mean(h_hfd)
sd_hfd = sd(h_hfd)

print(paste(round(mean_hfd, digits = 1),"in"))
print(paste(round(sd_hfd, digits = 1),"in"))

# Unpaired t-test (ie., independent-samples t-test):
# compare the MEANS of two separate unrelated groups to see if they are statistically
# different from each other.



test = t.test(
  h_nhv,
  h_hfd,
  alternative = "two.sided",
  var.equal = TRUE
)

cat('p-value:', test$p.value)
cat('The p-value is < 0.05, so we reject the null hypothesis. The New Haven male mean height is different from the Hartford male mean height.')

# OUTPUT
# p-value: 0.03378589
# The p-value is < 0.05, so we reject the null hypothesis. The New Haven male mean height is different from the Hartford male mean height.





# 7. Check your assumptions
p_nhv = shapiro.test(h_nhv) # test normality
p_hfd = shapiro.test(h_hfd)

cat('New Haven p-value:',p_nhv$p.value)
cat('Hartford p-value:', p_hfd$p.value)
cat("Both p-values > 0.05. We fail to reject the null hypothesis. The normality assumption appears reasonable.")

# OUTPUT
# New Haven p-value: 0.917242
# Hartford p-value: 0.4463685
# Both p-values > 0.05. We reject the null hypothesis. The normality assumption appears reasonable.



# variance, F-test:
# compare variance of two or more samples
p_f_test = var.test(h_nhv, h_hfd)

cat('p-value:', p_f_test$p.value)
cat('The p-value is > 0.05, se we fail to reject the null hypothesis. There is evidence that the data are homoskedastic.')

# OUTPUT
# p-value: 0.8001963
# The p-value is > 0.05, so we fail to reject the null hypothesis. There is evidence that the data are homoskedastic.



# 8. What if the data were paired?
# Paired t-test:
# Determine whether the mean difference between two sets of observations.
# NOT pairwise t-test.

delta_h= h_nhv - h_hfd

paired_normality = shapiro.test(delta_h)

cat('p-value:', paired_normality$p.value)
cat('The p-value for paired differences is > 0.05, so the data is adequately normal.')

# OUTPUT
# p-value: 0.8989
# The p-value for paired differences is > 0.05, so the data is adequately normal.


# paired t-test here
paired_t_test = t.test(h_nhv,
                       h_hfd,alternative = "two.sided", 
                       mu = 0, 
                       paired = TRUE)
cat('p-value:', paired_t_test$p.value)
cat('The p-value is > 0.05, so we fail to reject the null hypothesis. There is not sufficient evidence that New Haven and Hartford males differ
in mean height when the observations are treated as paired.')

# OUTPUT
# p-value: 0.06785565
# The p-value is > 0.05, so we fail to reject the null hypothesis. There is not sufficient evidence that New Haven and Hartford males differ
# in mean height when the observations are treated as paired.