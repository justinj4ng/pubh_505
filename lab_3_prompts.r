# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# prompt: Below are eight instructions. Create a .R file with 
# these prompts, execute them on the nhanes_demobmx.csv dataset,
# and for any code segments yielding a calculation, place a
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
setwd("/Users/wininger/Documents/Yale/PUBH505/2026/Labs/lab_3/")


# 1. read-in dataset from file, call it 'nhanes'. report on the 
# the total number of observations at the command line, and 
# place a comment below the code segment to document this result


# 2. subset this data-frame to just three variables: riagendr,
# ridageyr, and bmxht; rename these to 'gender', 'age', and
# 'height'. clear any row with missing data. subset on ages
# 13 through 15 (inclusive). when done, report on the total 
# number of observations at the command line, and place a comment 
# below the code segment to document this result


# 3. create a visual of the distribution of height values in this
# dataset. is it symmetric? calculate the skewness of this 
# distribution; if the value is between -0.5 and +0.5, then it is
# acceptably symmetric, and not skewed. report on the skewness 
# at the command line, and place a comment below the code segment 
# to document this result


# 4. ascertain the summary parameters of the distribution of 
# heights in this population (mean and standard deviation). 
# use the dnorm function to create a theoretical distribution
# to match these data. plot this distribution as a line-plot.


# 5. suppose anyone in this population with height beyond 175cm
# is to be considered 'tall'. what proportion of this dataset is
# tall? report on this probability value at the command line, and 
# place a comment below the code segment to document this result. 
# express this probability as a percent, and round to the nearest
# tenth of a percent in reporting



# 6. suppose we were to encounter 20 of these survey respondents.
# what is the probability that exactly 3 of the 20 are categorically
# tall? report on this probability value at the command line, and 
# place a comment below the code segment to document this result. 
# express this probability as a percent, and round to the nearest
# tenth of a percent in reporting


# 7. suppose the same situation (i.e. that we encounter 20 of these
# survey respondents). what is the probability that 5 or more of 
# them are categorically tall? report on this probability value at 
# the command line, and place a comment below the code segment to 
# document this result. express this probability as a percent, and 
# round to the nearest tenth of a percent in reporting


# 8. suppose we encounter a member of this population who is 180cm
# tall. what is their percentile height among their peers with 
# similar body parameters as the NHANES population? (i.e. this is
# a theoretical percentile, not an empirical percent within the
# NHANES dataset. express this percentile as a percent, and round to 
# the nearest tenth of a percent in reporting. report on this value 
# at the command line, and place a comment below the code segment to 
# document this result.


