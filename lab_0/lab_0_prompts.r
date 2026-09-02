# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# prompt: Below are eight instructions. Create a .R file with 
# these prompts, execute them on the stock_prices.csv dataset,
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


# 1. read-in dataset from file, call it 'stocks'. report on the 
# the total number of observations at the command line, and 
# place a comment below the code segment to document this result


# 2. the date variable has is of class-character. enforce Date 
# class. demonstrate effective conversion by print-ing out the
# class at the command line


# 3. how many companies are there in this dataset and what are 
# the companies' names? use the unique function. print the names
# of the companies at the command line, and report how many there
# are in total; and place a comment below the code segment to 
# document this result 


# 4. the far-right column of this dataset lists the daily trading
# volume of each company's stocks. calculate the median trading
# volume for each company within the dataset. use the by function.
# for each company, print the result at the command line, and
# place a comment below the code segment to document this result.


# 5. find the date when the trading volume was the highest across
# the whole dataset. what was the date, and what was the company
# for this highest-volume day? also, how many shares were traded
# on that day. print the result at the command line, and place a 
# comment below the code segment to document this result.


# 6. find the date with the largest within-day loss, i.e. the day
# on which the stock's closing prices was the lowest percentage
# of its opening price. what was the date, what was the company, 
# and what was the percentage change in stock value? print the 
# result at the command line, and place a comment below the code 
# segment to document this result. round the percentage to the 
# nearest tenth of a percent


# 7. find the date when the day-to-day difference in stock 
# closing price was the largest (i.e. what was the biggest daily
# jump in stock value within this dataset). what was the date,
# what was the company, and what was the percentage change in 
# stock value? print the result at the command line, and place
# a comment below the code segment to document this result. 
# round the percentage to the nearest tenth of a percent


# 8. create a visual of the stock closing price for whichever
# company occupies the first 1000 days in the dataset. 

