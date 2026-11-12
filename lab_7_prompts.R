# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# prompt: Below are eight instructions. Create a .R file with 
# these prompts; execute them on the nhanes_demobmx dataset.
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


# 1. we are interested in assessing the relationship between
# height and weight in adult males. let's pursue this line of 
# inquiry by opening the nhanes dataset. call it 'nhanes'. 
# report on the total number of observations and the total
# number of variables at the command line, and place a comment 
# below the code segment to document this result


# 2. find any variables that are more than half-missing (i.e. 
# where NA values occupy more than 50% of the rows in the column)
# and eliminate them. it is OK to overwrite 'nhanes' as we 
# won't need these variables any more. if you can, find a way
# to streamline the process of summarizing the missingness,
# without having to resort to checking each column manually
# with a new line of code for each column. report on the surviving 
# number of columns at the command line, and place a comment 
# below the code segment to document this result


# 3. subset the 'nhanes' data-frame to just adult males 
# (ridageyr 18-40 inclusive; riagendr 1). Keep all variables.
# then condition the data-frame so that we can carry out a 
# complete-case analysis for the remaining items in this 
# assignment. report on the new dimensionality of 'nhanes'
# at the command line, and place a comment below the code 
# segment to document this result


# 4. some of the variables in the NHANES_DemoBMX dataset
# are extraneous for our enterprise here. reduce the data-frame
# to include: age (ridageyr), survey weight (wtmec2yr), and
# any variable that relates to body composition (i.e. has
# the letters 'bmx' in the variable name). try to find a
# function that will allow you to find a string (here: 'bmx')
# as a so-called regular expression, so that you are not
# manually picking out these columns. report on the new 
# number of columns in 'nhanes' at the command line, and place 
# a comment below the code segment to document this result


# 5. take a look at the variables in this data-frame. do 
# they show a high co-linearity? compute the correlation matrix,
# and create a visual display via a corrplot. Please sort this
# plot via hierarchical clustering so that variables with similar
# profiles group together. For this item, report on which
# variables in the nhanes data-frame co-cluster with Height 
# (bmxht), and which variables co-cluster with Weight (bmxwt).
# report on these co-clusterings at the command line, and place 
# a comment below the code segment to document this result


# 6. now we want to know how height predicts weight. create
# a linear regression model of weight as a function of height.
# extract the slope coefficient and report on the relationship
# between weight (kg units) and height (cm units). report 
# your findings at the command line, and place a comment below 
# the code segment to document this result. please round the
# slope to three decimal places


# 7. revise your so-called simple-linear regression to include
# a co-variate (age; ridageyr). extract the slope coefficient 
# again and report on the relationship between weight (kg units) 
# and height (cm units). report your findings at the command 
# line, and place a comment below the code segment to document 
# this result. please round the slope to three decimal places


# 8. revise your so-called multiple regression to include
# reflect the survey weights. extract the slope coefficient 
# again and report on the relationship between weight (kg units) 
# and height (cm units). report your findings at the command 
# line, and place a comment below the code segment to document 
# this result



