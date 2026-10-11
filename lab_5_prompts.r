# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# prompt: Below are eight instructions. Create a .R file with 
# these prompts; execute them on the noaa_longformat dataset.
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


# 1. load in the noaa_longformat dataset from file. clear off
# any observation with any missing data. report on the total 
# number of observations of each vector at the command line, 
# and place a comment below the code segment to document this 
# result


# 2. subset to summer months (june, july, and august; months
# 6, 7, and 8), in years 1980-2000 (inclusive), and only reduce 
# to New York (NYC), Miami (MIA), Los Angeles (LAX), and St. Louis
# (STL) report on the total number of observations of each vector 
# at the command line, and place a comment below the code segment 
# to document this result


# 3. we want to know whether there is any difference in temperature
# among these cities. this is most likely suited for a one-way
# ANOVA (Temperature as a response; City as the predictor). implement
# this, and report on the p-value for the City predictor. interpret
# the outcome. is there a significant difference between cities,
# or are the not (statistically significantly...) different? report 
# the p-value, and your interpretation at the command line, and 
# place a comment below the code segment to document this result


# 4. were we justified in utilizing an ANOVA? check the assumption 
# of normality of residuals. use skewness. Since two thresholds have 
# been proposed for skewness (0.3 and 0.5, per Lecture ##, Slide ##), 
# go with 0.4 for this item.report your finding and interpret the 
# result (i.e. conclude whether the ANOVA was justifiable, or not). 
# report the skewness, and your interpretation at the command line, 
# and place a comment below the code segment to document this result


# 5. regardless of your finding in item 4 (i.e. regardless of whether)
# we were justified in carrying out the anova, let's take the anova
# to its next step: an assessment of pair-wise differences. utilize
# the TukeyHSD function to assess which cities are different from which
# other cities. for the sake of brevity, just report one result: report
# whether New York (NYC) is different in temperature from Los Angeles 
# (LAX), if it is different: what is the difference in temperature (if
# they are not different, you can just say Not Different). report your
# findings at the command line, and place a comment below the code 
# segment to document this result


# 6. trichotomize the temperature data. create a new column on the
# data-frame (call it "Feel") and let temperature up-to 70-degrees be
# considered "cool"; let a temperature up to 80-degrees be considered
# "nice", and any temperature above 80-degrees shall be considered as
# "hot". create a single table with cities as rows and temperature 
# categories as columns. No need to summarize anything, just print
# the table at the command prompt so that it is visible. for best
# results, please wrap in a print(), e.g. print(table(....)). you can
# save your table to a variable if you prefer an intermediate step,
# e.g. tbl = table(...); print(tbl). document one or two data-points
# from the table as a comment below the code segment just to assure
# quality control


# 7. pass your table into chisq.test and ascertain whether there
# are any differences between cities in this categorical view. implement
# this, and report on the p-value for the City predictor. interpret
# the outcome. is there a significant difference between cities,
# or are the not (statistically significantly...) different? report 
# the p-value, and your interpretation at the command line, and 
# place a comment below the code segment to document this result


# 8. were we justified in utilizing chi-square test? check the assumption 
# on adequacy of the chi-square approximation, as seen in the expectation
# matrix. within the expectation matrix, no cell should have value less
# than one, and no more than 20% of the cells should have a value less
# than five. did our expectation matrix here meet those requirements?
# report your findings, at the command line, and place a comment below 
# the code segment to document this result

