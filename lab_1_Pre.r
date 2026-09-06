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

# replace numerical designation of sex with characters
nyc$sex[nyc$sex == "1"] <- "male"
nyc$sex[nyc$sex == "2"] <- "female"

# make a table displaying count of how many males and females
sex_table <- data.frame(
  SEX = c("male", "female"),
  SUM = c(
  sum(nyc$sex == "male"),
  sum(nyc$sex == "female")))
  
print(sex_table)  
#SEX   SUM
#1   male 11879
#2 female 14801  


# round income to nearest dollar
nyc$income <- round(nyc$income, digits = 0)

# make a new column to flag negative income values.
nyc$debt <- ifelse(nyc$income > 0, "earning", "debt")

# make a two-way table sex(table row), debt(table col)

sex_debt_table <- table(nyc$sex, nyc$debt)

print(sex_debt_table)
# total number of observations in each sub-category

#debt earning
#female   315   14486
#male     243   11636

# 5.
# visualize frequency of boros

BORO = c("brooklyn", "bronx", "manhattan", "queens", "staten island")
SUM = c(
  sum(nyc$boro == "bronx"), # 3744
  sum(nyc$boro == "brooklyn"), # 9268
  sum(nyc$boro == "manhattan"), # 4430
  sum(nyc$boro == "queens"), # 7779 
  sum(nyc$boro == "staten island"))# 1459

boro_frq_plot <- barplot(height = SUM, names.arg = BORO, col = "tomato", ylim = c(0, 10000))
# text()


# 6.


