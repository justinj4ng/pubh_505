#Lab 01


# iffelse("column<>=","trait 1", "trait 2" ) 

rm(list=ls())
graphics.off()

setwd("~/pubh_505")

nyc <- read.csv("NYC_poverty.csv")

# 1. nrows(nyc) is 26680

# eliminate all columns except these 3
nyc <- nyc[ , c("SEX", "Boro", "PreTaxIncome_PU")]

colnames(nyc)[1] <- "sex"
colnames(nyc)[2] <- "boro"
colnames(nyc)[3] <- "income"


# 2. ncol(nyc) is 3

# replace numerical designation of boros with name
nyc[nyc$boro == ""] <- 
nyc
nyc