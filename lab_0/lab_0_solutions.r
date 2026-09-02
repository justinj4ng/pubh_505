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
setwd("/Users/wininger/Documents/Yale/PUBH505/2026/Labs/lab_0/")


# 1. read-in dataset from file, call it 'stocks'. report on the 
# the total number of observations at the command line, and 
# place a comment below the code segment to document this result
read_file = "stock_prices.csv"
stocks = read.csv(read_file)
print(paste("n observations = ",nrow(stocks)))
# there are 4680 observations in this dataset
# NOTE: this is a code sandwich: comment-code-comment
# NOTE: this is a long-format dataset: observations as rows
# NOTE: the print-paste statement is the standard way to report
#		at the command line
# NOTE: could have also utilized dim(stocks)[1] in lieu of nrow
#		for a 2-dimensional data-object (data-frame or matrix)

# 2. the date variable has is of class-character. enforce Date 
# class. demonstrate effective conversion by print-ing out the
# class at the command line
stocks$date = as.Date(stocks$date)
print(paste("class of stocks$date is",class(stocks$date)))
# yields Date class
# NOTE: forcing a class (also known as coercion) can be a 
# 		critically important data-conditioning step
# NOTE: can inspect the class of any data-object using class()


# 3. how many companies are there in this dataset and what are 
# the companies' names? use the unique function. print the names
# of the companies at the command line, and report how many there
# are in total; and place a comment below the code segment to 
# document this result 
unique_cos = unique(stocks$company)
print(paste("there are",length(unique_cos),"unique companies in the dataset"))
cat(unique_cos,sep="\n")
# there are two unique companies in the dataset
# they are Eli Lilly & Company and Novo Nordisk A/S
# NOTE: the cat() function is preferable to print() when printing
#		multiple elements (as might be found in a vector)
# NOTE: the length() function counts the number of elements in 
#		a vector


# 4. the far-right column of this dataset lists the daily trading
# volume of each company's stocks. calculate the median trading
# volume for each company within the dataset. use the by function.
# for each company, print the result at the command line, and
# place a comment below the code segment to document this result.
group_medns = by(stocks$volume,stocks$ticker,FUN=median)
print(paste(names(group_medns)[1],"median daily volume:",round(group_medns[1]),"shares"))
print(paste(names(group_medns)[2],"median daily volume:",round(group_medns[2]),"shares"))
# lilly: 3.1M shares per day
# novo: 3.0M shares per day
# NOTE: median is the proper summary here because distributions 
#		are non-normal (not-shown, but confirm via hist(stocks$volume))
# NOTE: calculation of group-wise summary statistics is an important 
#		skill, e.g. when creating tables for manuscripts
# NOTE: the print-pastes are partially elegent: they are pulling
#		values by way of index reference, but they are manually 
#		coded one through two

# 5. find the date when the trading volume was the highest across
# the whole dataset. what was the date, and what was the company
# for this highest-volume day? also, how many shares were traded
# on that day. print the result at the command line, and place a 
# comment below the code segment to document this result.
max_idx = which.max(stocks$volume)
max_date = stocks$date[max_idx]
max_comp = stocks$company[max_idx]
max_volm = stocks$volume[max_idx]
print(paste("highest trading-day company: ",max_comp,"(",max_date,")"))
print(paste("highest trading-day volume: ",max_volm,"shares"))
# highest-volume trade occurred at Novo: 111M shares on July 29, 2025
# coincides with an approximate 24% loss in stock value
# coincides with downgrade of company sales forecast
# NOTE: the which.max function was not specifically mentioned in
#		the prompt. this will be part of the class concept (finding
#		a good solution to a prompt
# NOTE: will see logic in future weeks, but equivalent code is
#		which(stocks$volume == max(stocks$volume))
# NOTE: index references (square brackets on data-objects) are
# 		an important coding skill
# NOTE: index references here are variables, not values (as in
#		previous: [1] and [2])

# 6. find the date with the largest within-day loss, i.e. the day
# on which the stock's closing prices was the lowest percentage
# of its opening price. what was the date, what was the company, 
# and what was the percentage change in stock value? print the 
# result at the command line, and place a comment below the code 
# segment to document this result. round the percentage to the 
# nearest tenth of a percent
max_idx = which.min(stocks$close-stocks$open)
max_date = stocks$date[max_idx]
max_comp = stocks$company[max_idx]
max_loss = stocks$close[max_idx]-stocks$open[max_idx]
max_pctg = max_loss/stocks$open[max_idx]
max_pctg = round(100*max_pctg,1)
print(paste("largest same-day loss: ",max_comp,"(",max_date,")"))
print(paste("largest same-day percent drop: ",max_pctg,"%"))
# largest same-day loss occurred at Lilly: -6.4% drop on july 18, 2024
# coincides with sell-off due to rival Roche announcing good study results
# NOTE: could have created new column, e.g. 
#		stocks$change = stocks$close-stocks$open
# NOTE: rounding helps to avoid false precision


# 7. find the date when the day-to-day difference in stock 
# closing price was the largest (i.e. what was the biggest daily
# jump in stock value within this dataset). what was the date,
# what was the company, and what was the percentage change in 
# stock value? print the result at the command line, and place
# a comment below the code segment to document this result. 
# round the percentage to the nearest tenth of a percent
max_idx = which.max(diff(stocks$close))
max_date = stocks$date[max_idx]
max_comp = stocks$company[max_idx]
max_diff = diff(stocks$close)[max_idx]
max_pctg = max_diff/stocks$close[max_idx]
max_pctg = round(100*max_pctg,1)
print(paste("largest jump company: ",max_comp,"(",max_date,")"))
print(paste("largest jump percent change: ",max_pctg,"%"))
# largest day-to-day jump occurred at Lilly: 14.3% jump on April 16, 2025
# coincides with promising results of a GLP-1 clinical trial
# coincides with confirmed projections of company sales forecast
# https://lilly.mediaroom.com/index.php
# NOTE: This is a challenge item due to the need for the 
#		diff function, which computes the difference between rows
# NOTE: The notion of a long-format dataset (item 1 note) is 
#		relevant to the difference-between-rows action of diff()


# 8. create a visual of the stock closing price for whichever
# company occupies the first 1000 days in the dataset. 
plot(stocks$date[1:1000],stocks$close[1:1000],type="l",
	main=paste(unique(stocks$company[1:1000]),"stock price"),
	xlab="Date",ylab="Price per share (USD)")
# yields a broadly increasing, but noisy upward trending graph
# NOTE: line plot is preferred plot because of consecutivity
#		of price day-to-day
# NOTE: reminder that all plots need full annotations: title,
#		x-label, and y-label
