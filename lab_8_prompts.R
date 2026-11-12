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



# 1. this first step will be very similar to steps 1-4 in lab
# #7. feel free to copy/paste/adapt your code from last week
# to accomplish the task in this first item. open the dataset
# for NHANES_DEMOBMX, and subset on variables to include only
# age, race-ethnicity, gender, and then any BMX variable. 
# clear off any variable with more than 80 percent missingness.
# then reduce the data-frame to just complete cases. report on 
# the total number of observations and the total number of 
# variables at the command line, and place a comment below the 
# code segment to document this result. the final data-frame
# should be named as 'nhanes'


# 2. perform a single-predictor linear regression of bodyweight 
# (bmxwt; response) against gender (riagendr; predictor). extract 
# the slope coefficient and report on the relationship between 
# weight (kg units) and gender (categorical). report your findings 
# at the command line, and place a comment below the code segment 
# to document this result. please round the slope to three decimal
# places. note: riagendr=1 is male; riagender=2 is female


# 3. create a categorical weight variable. call it nhanes$cat. 
# define it dichotomously: split bodyweight at 75 kilograms
# and label the observations as either 'light' or 'heavy'.
# (folks weighing exactly 75kg can be considered 'light').
# perform a logistic regression with this categorical weight
# as response, and gender as predictor. extract the log-odds 
# coefficient and report on the relationship between weight 
# (categorical) and gender (categorical). report your findings 
# at the command line, and place a comment below the code segment 
# to document this result. please round the slope to three decimal
# places.


# 4. exponentiate the log-odds value obtained in item #3.
# meaning: pass this value into the exp() function. this will be
# the oddsratio. report on this OR, and express its meaning properly
# whilst making reference to being categorically light- or heavy 
# as a male or female. report your findings at the command line, 
# and place a comment below the code segment to document this result. 
# please round the slope to three decimal places.


# 5. we obtained the odds-ratio in item #4, via manual extraction
# from the logistic regression of categorical weight versus gender.
# now, see if you can get the same result by creating a 2x2 table
# and passing it to epitools::oddsratio. report on this OR, and 
# express its meaning properly whilst making reference to being 
# categorically light- or heavy as a male or female. report your 
# findings at the command line, and place a comment below the code 
# segment to document this result. please round the slope to three 
# decimal places.


# 6. remove the categorical weight variable. now create a multivariable
# linear regression with bodyweight (bmxwt) as a function of height 
# (bmxht), age (ridageyr), and race-ethnicity (ridreth1). presumably 
# ridreth1 is seen in its loaded state (as-integer). Perform the 
# regression and extract the slope coefficient on height (similar to 
# lab #7, items 6 and 7, if you like). then, enforce factor-class
# and run the regression again, and report on the slope of height
# under this new regression. report both of your findings at the 
# command line, and place a comment below the code segment to 
# document these two slope coefficient results. please round the slopes 
# to three decimal places.


# 7. perform a regression on all predictors in the dataset using 
# the dot notation. literally, just place a dot to the right of the
# tilde and run the regression. report on the slope for height in
# this full model. report this slope coefficient at the command line, 
# and place a comment below the code segment to document this result. 
# please round the slope to three decimal places.


# 8. using MASS:stepAIC, take your full model from item #7 and
# optimize it. try this in two different ways. firstly, let 
# R run a so-called free-optimization: just place your model
# as the sole argument and see what variables are found to 
# optimize the model. you will probably notice that arm-length
# (bmxarml) is eliminated. so run the optimization a second time
# but force in arm-length, using the scope argument, and setting 
# the "lower" model. for this final model (optimized with arm
# length forced in), extract the slope on height. report this 
# slope coefficient at the command line, and place a comment 
# below the code segment to document this result. please round 
# the slope to three decimal places.





