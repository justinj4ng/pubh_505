#Lab 01 
#justin.jang@yale.edu


# 1.

rm(list=ls())
graphics.off()

#install.packages("doBy")
library(doBy)

setwd("~/pubh_505")

nyc <- read.csv("NYC_poverty.csv")


nrow(nyc)
# nrow(nyc) is 26680

# 2.

# eliminate all columns except these 3
nyc <- nyc[ , c("SEX", "Boro", "PreTaxIncome_PU")]

colnames(nyc)[1] <- "sex"
colnames(nyc)[2] <- "boro"
colnames(nyc)[3] <- "income"


print(paste("n variables =",ncol(nyc),"variables"))
# n variables = 3 variables


# 3.
# replace numerical designation of boros with name
#vector subsetting
nyc$boro[nyc$boro == "1"] <- "bronx"
nyc$boro[nyc$boro == "2"] <- "brooklyn"
nyc$boro[nyc$boro == "3"] <- "manhattan"
nyc$boro[nyc$boro == "4"] <- "queens"
nyc$boro[nyc$boro == "5"] <- "staten island"

# make a table displaying the count how many times a boro appears in a column
boro_table <-data.frame(
  BORO = c("brooklyn", "bronx", "manhattan", "queens", "staten island"),
  SUM = c(
  sum(nyc$boro == "bronx"), # 3744
  sum(nyc$boro == "brooklyn"), # 9268
  sum(nyc$boro == "manhattan"), # 4430
  sum(nyc$boro == "queens"), # 7779 
  sum(nyc$boro == "staten island"))# 1459
)


print(boro_table)
#BORO  SUM
#1      brooklyn 3744
#2         bronx 9268
#3     manhattan 4430
#4        queens 7779
#5 staten island 1459


# 4. 

# change class of sex from integer to factor
nyc$sex <- as.factor(nyc$sex)
class(nyc$sex)

#change sex to male, female

levels(nyc$sex) <- c("male", "female")

# round income to nearest dollar
nyc$income <- round(nyc$income, digits = 0)


# make a table displaying count of how many males and females

print(table(nyc$sex))  
# male female 
# 11879  14801 



# make a new column to flag negative income values.
nyc$debt <- ifelse(nyc$income >= 0, "earning", "owing")

# make a two-way table sex(table row), debt(table col)

sex_debt_table <- table(nyc$sex, nyc$debt)

print(sex_debt_table)
# total number of observations in each sub-category
# earning owing
# male     11873     6
# female   14796     5

# 5.
# visualize frequency (number of persons) per each boro

boro_prop <- prop.table(table(nyc$boro)) 

barplot(
  boro_prop,
  main = "Proportion of Dataset by NYC Borough",
  xlab = "boro",
  ylab = "relative frequency of observations"
  )


# 6.

# visualize income by boro.show median income. 
boxplot(nyc$income ~ nyc$boro, xlab = "boro", ylab = "income (USD)",
        main = "income distribution by boro"
        )





# 7. calculate a representative value of the income within the  broader dataset
#summary(nyc$income)
print(paste("median:", median(nyc$income))) # .join equivalent, keeps space between strings
print(paste("IQR:", IQR(nyc$income)))

# "median: 58440"
# "IQR: 85645"


# 8. calculate median income 
boro_median <- summaryBy(income ~ boro, data = nyc, FUN = median) #FUN is Function. e.g., centrality or spread

print(boro_median)
# boro income.median
# 1         bronx       37734.5
# 2      brooklyn       55452.5
# 3     manhattan       73503.5
# 4        queens       62470.0
# 5 staten island       78592.0




