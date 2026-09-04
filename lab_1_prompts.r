# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# prompt: Below are eight instructions. Create a .R file with 
# these prompts, execute them on the nyc_poverty.csv dataset,
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


# 1. read-in dataset from file, call it 'nyc'. report on the 
# the total number of observations at the command line, and 
# place a comment below the code segment to document this result


# 2. subset nyc to include only the following variables:
# Sex (SEX), Boro (Boro), and Income (PreTaxIncome_PU). maintain
# the data-frame as having the name 'nyc' (i.e. do not create
# a new data-frame). rename these columns as "sex", "boro" and
# "income" (all lower-case). when this is accomplished, demonstrate 
# completeness by reporting on the number of columns in your 
# data-frame. please use an R function to report on the number 
# of columns and code this elegantly (i.e. pass a function or
# variable into your print-paste statement rather than manually
# typing the number three). report on the total number of variables 
# at the command line, and place a comment below the code segment to 
# document this result


# 3. the boros are labeled numerically. please revise the 
# elements in this variable to reflect their true boro names
# 1 = bronx 
# 2 = brookly
# 3 = manhattan
# 4 = queens
# 5 = staten island
# when done, create a table that reports on the number of 
# observations corresponding to each boro. report on the total 
# number of observations per boro at the command line (it is 
# fine to just print the table using the print command, 
# specifically), and place a comment below the code segment 
# to document this result


# 4. sex is also labeled numerically; please revise the elements
# in this variable to reflect their lexical names: 1 = male, 
# and 2 = female. also, round income to the nearest dollar.
# when done, create a table that reports on the number of 
# observations corresponding to each sex. lastly, create a 
# new column to flag any income values that are negative
# (i.e. value less than zero dollars). call this new column 
# 'debt', and set the values to "earning" if the income
# is non-negative, or "owing" otherwise. create a 2-way 
# table of sex (table rows) and debt (table columns). report 
# on the total number of observations in each sub-category at 
# the command line (it is fine to just print the table using the 
# print command, specifically), and place a comment below the 
# code segment to document this result


# 5. create a visual to show the proportion of the dataset
# represented by each nyc boro


# 6. create a visual to show the income by boro (i.e. one graphical
# element per-boro, please). chart should give some impression of 
# the distribution, with a measure of centrality and a measure of
# dispersion somehow included in the graphic


# 7. calculate a representative value of the income within the 
# broader dataset (no need to separate by boro; look at the entire)
# dataset. select the proper measure of centrality and dispersion 
# and report these values at the command line, and place a comment 
# below the code segment to document this result


# 8. calculate the median income by-boro. use the summaryBy function.
# print the result at the command line, and place a comment below the 
# code segment to document this result.


