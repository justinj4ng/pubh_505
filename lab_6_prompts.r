# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# prompt: Below are eight instructions. Create a .R file with 
# these prompts; execute them on the yale_athletics dataset.
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
setwd("~/lab_6/")

# 1. suppose we were interested in comparing the heights of 
# football players versus baseball players. do they have different
# heights? open the yale-athletics dataset (call it 'yale'), and 
# subset to years 2005 through 2015 (inclusive). extract the 
# height data for baseball players (write these data to a vector 
# called 'base'), and extract the height data for the football 
# players (write these data to a vector called 'foot'). report on 
# the the total number of observations of each vector at the 
# command line, and place a comment below the code segment to 
# document this result


# 2. when comparing the heights of the players on these two
# teams, we first need to know the nature of their distributions.
# are these two vectors acceptably Normal, or are they skew? 
# are these two vectors having similar dispersion, or are they
# heteroskedastic? report on the skewness and provide an 
# interpretation as to whether each vector is skew (or not); 
# and provide a determination about the vectors' skedasticity. 
# report on these results (and your conclusions) at the command 
# line, and place a comment below the code segment to document 
# these results. Since two thresholds have been proposed for 
# skewness (0.3 and 0.5, per Lecture ##, Slide ##), go with 0.4
# for this item.


# 3. given the results from item #2, carry out the appropriate
# hypothesis test. report the p-value, and interpret this as 
# indicating whether there is a statistically significant 
# difference between baseball versus football players, or not.
# report on these results at the command line, and place a 
# comment below the code segment to document this result


# 4. implement this comparison (heights of baseball players
# versus football players) as a one-way ANOVA. report the 
# p-value, and interpret this as indicating whether there is 
# a statistically significant difference between baseball 
# versus football players, or not. report on these results 
# at the command line, and place a comment below the code 
# segment to document this result


# 5. were we justified in using the ANOVA? Test the skewness
# of the residuals. use the smae threshold as for item #2: 
# a skewness threshold of 0.4. report on these results 
# at the command line, and place a comment below the code 
# segment to document this result


# 6. analyze the height difference between these two sports
# (baseball versus football) as a two-way ANOVA, with Year
# as the second categorical predictor. report the p-value from 
# Sport (you can ignore the p-value on Year), and interpret this 
# as indicating whether there is a statistically significant 
# difference between baseball versus football players, or not.
# place Year as the second predictor (i.e. Sport + Year).
# report on these results at the command line, and place a 
# comment below the code segment to document this result

yale = yale[which(yale$Sport %in% c("Baseball", "Football")),]
yale$Year = as.factor(yale$Year)
aov(Height~Sport + Year, data=yale)

# 7. re-run your two-way ANOVA, but this time reverse the
# order of your predictors (i.e. Year + Sport). report the 
# p-value from Sport again (again, you can ignore the p-value 
# on Year), and interpret this as indicating whether there 
# is a statistically significant difference between baseball 
# versus football players, or not. report on these results 
# at the command line, and place a comment below the code 
# segment to document this result


# 8. run both two-way ANOVAs again (i.e. run both the Sport + 
# Year, and the Year + Sport phrasings). this time run as a
# type-II ANOVA. extract the p-value for the Sport predictor
# from both implementations, i.e. Sport as first- and Sport
# as second term. Report both p-values. report on these results 
# at the command line, and place a comment below the code 
# segment to document this result

