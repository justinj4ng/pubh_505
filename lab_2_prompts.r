# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# prompt: Below are eight instructions. Create a .R file with 
# these prompts, execute them on the yale_athletics.csv dataset,
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
setwd("~")


# 1. read-in dataset from file, call it 'yale'. report on the 
# the total number of observations at the command line, and 
# place a comment below the code segment to document this result


# 2. subset the dataset to include only observations related to
# baseball and basketball. further subset the dataset to include
# only columns of Sport and Height. clean the resultant data-frame
# of any missing data. report the final dimensions of the data-
# frame at the command line, and place a comment below the code 
# segment to document this result


# 3. summarize the height of athletes in both sports. AOK to use
# mean and standard deviation. use the summaryBy function. print 
# the result at the command line, and place a comment below the 
# code segment to document this result.


# 4. calculate the probability of encountering a tall athlete
# (defined here as taller than 75 inches), in both sports. 
# express your result as a percentage, and round to the nearest
# tenth. print the result at the command line, and place a comment 
# below the code segment to document this result.


# 5. calculate the relative risk of being tall as a basketball
# player, versus being tall as a baseball player. print the result 
# at the command line, and place a comment below the code segment 
# to document this result. do not use any functions; only arithmetic.


# 6. calculate the odds ratio of being tall as a basketball
# player, versus being tall as a baseball player. print the result 
# at the command line, and place a comment below the code segment 
# to document this result. do not use any functions; only arithmetic.


# 7. build a contingency table using the matrix or table function. 
# be sure to label the rows and columns of your table. place sport as the
# row elements, and height status as the columns. calculate the
# odds ratio via the oddsratio() function. print the result 
# at the command line, and place a comment below the code segment 
# to document this result. 


# 8. use the contingency table built in item 7 to calculate the 
# relative risk of being tall as a basketball player, versus as a 
# baseball player via the riskratio() function. print the result 
# at the command line, and place a comment below the code segment 
# to document this result. 


