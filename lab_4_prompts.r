# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# prompt: Below are eight instructions. Create a .R file with 
# these prompts; there is no need for an external dataset.
# And for any code segments yielding a calculation, place a
# comment with the numerical result at the bottom of the code
# segment. Reminder to incorporate units into all statements
# about the data (whether embedded comments, or command line
# print-outs). Graphical elements should have proper annotations
# (main title, axis labels, etcetera).
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



# close all, clear all
rm(list=ls())
graphics.off()

# 0. set the working directory
setwd("~")


# 1. suppose we were to measure the height of twenty adult males
# from the new haven area. in order to give life to this scenario,
# generate 20 normally-distributed random values, where the 
# underlying distribution has a mean value of 68.4 inches, and a
# standard deviation of 4 inches. in order to fix the randomness,
# set the seed to value 505. when done, report on the mean- and
# standard deviation of these twenty height values at the command 
# line, and place a comment below the code segment to document 
# this result. the printed results should be rounded to the nearest
# tenth of an inch. store these values in a vector called 'h_nhv'


# 2. according to a recent google inquiry, the average height
# among american adult males is 69 +/- 3 inches. is our own sample
# of new haven-area males shorter than this? test this hypothesis.
# choose the proper test for this, calculate the test-statistic
# manually (i.e. with your own arithmetic), and utilize the proper
# p-family function to calculate the probability of finding 
# a result as- or more-extreme than your result from item 1, 
# under the conditions where the new haven-area males are, indeed
# a proper representative of the american male. report this p-value
# at the command line, and place a comment below the code segment 
# to document this result. the result should include an clear
# interpretation as to whether the new haven males are, indeed,
# shorter or not. UPDATE AFTER LECTURE 7: this is a really 
# clunky prompt. calculate a z-value and use p-norm. let z be
# given as h_mean minus the population average (mu), divided by
# the quantity sigma divided by square-root-n. Plug this z-value
# into pnorm. You should get a small number. hope that helps. 
# -MW, 9/30/26 @ 5:30pm


# 3. in the previous item, we were given information about the 
# population standard deviation being 3 inches. suppose that we
# did not know this. change your hypothesis test from item 2 to
# match the scenario where this sigma value is unknown. now, are 
# the new haven-area males shorter than the typical american male? 
# choose the proper test for this, calculate the test-statistic
# manually (i.e. with your own arithmetic), and utilize the proper
# p-family function to calculate the probability of finding 
# a result as- or more-extreme than your result from item 1, 
# under the conditions where the new haven-area males are, indeed
# a proper representative of the american male. report this p-value
# at the command line, and place a comment below the code segment 
# to document this result. the result should include an clear
# interpretation as to whether the new haven males are, indeed,
# shorter or not. UPDATE AFTER LECTURE 7: OK. This is still a 
# clunky prompt. Pick up a hint in Lecture 7, Slides 37-39, and
# make adjustments to your work from Item 2 accordingly. 


# 4. revisit item #2 (the first hypothesis test calculation) and
# instead of manual calculation, implement this test using a
# hypothesis test function (i.e. an R function containing .test). 
# report the same information as before: report the p-value at
# the command line, and place a comment below the code segment 
# to document this result. the result should include an clear
# interpretation as to whether the new haven males are, indeed,
# shorter or not. UPDATE FOLLOWING LECTURE 7: Woof. Another
# clunky prompt. use z.test(). Hint: it isn't available in 
# Base R, so you'll have to track down its package.


# 5. revisit item #3 (the second hypothesis test calculation) and
# instead of manual calculation, implement this test using a
# hypothesis test function (i.e. an R function containing .test). 
# report the same information as before: report the p-value at
# the command line, and place a comment below the code segment 
# to document this result. the result should include an clear
# interpretation as to whether the new haven males are, indeed,
# shorter or not UPDATE FOLLOWING LECTURE 7: No hints needed
# here; just make a few edits. you'll have to abandon z.test 
# and find a function that suits this situation where you don't
# have sigma/the population standard-deviation.


# 6. suppose we were to collect a separate sample of twenty males
# perhaps from hartford. now we would like to know: are the 
# new haven males different in height from the hartford males. 
# create another hypothetical dataset (similar to what was done
# in item 1), but now with mean-value 68.8 inches, and standard
# deviation 3.8 inches; according to seed 50505. call this new
# sample 'h_hfd'. we will want to use the unpaired t-test for
# this. report the p-value at the command line, and place a 
# comment below the code segment to document this result. the 
# result should include an clear interpretation as to whether 
# the new haven males are, indeed, different in height from the
# hartford area males. UPDATE FOLLOWING LECTURE 7: OK. No
# more editorials from MW. You're on your own. Happy coding...


# 7. we just carried out an unpaired t-test in the previous item. 
# the unpaired t-test has a requirement of normality. and, we 
# must specify within our t-test whether the variances are 
# approximately equal between the new haven-area data, and the
# hartford-area data. go back to your data and check the 
# requirement on normality, and assess the circumstnace with
# regard to variance. check normality via the shapiro-wilk test,
# and check the variance via the F-test. for both tests, report 
# the p-values at the command line, and place comments below the 
# code segment to document these results. the results should 
# include a clear interpretation as to whether the data are
# adequately normal, and another interpretation as to whether
# the data are adequately homoskedastic.


# 8. suppose the data were paired, and not sampled independently.
# adapt your hypothesis test as performed in item #6, and test
# any requirements as appropriate. for any/all tests, report 
# the p-values at the command line, and place comments below the 
# code segment to document these results. the results should 
# include a clear interpretation as to the nature of the data,
# similarly as to the style utilized in items 6 and 7.
