rm(list=ls())
graphics.off()

setwd("~/pubh_505")
library(doBy)
library(glue)
library(epitools)


# 1.
yale <- read.csv("Yale_Athletics.csv")
print(nrow(yale))
# 1228 observations

# 2. Subsetting data
yale_sub <-yale[which(yale$Sport == c("Baseball", "Basketball")),]

yale_subSH <- yale_sub[,c("Sport", "Height")]

yale_subSH <- na.omit(yale_subSH)

# sum(is.na(yale_subSH$Height))
# sum(is.na(yale_subSH$Weight))
# 
print(dim(yale_subSH))
# 102 rows, 2 columns

# 3. Summarizing heights

height_summaryBS <- summaryBy( Height ~ Baseball , data = yale_subSH, FUN = mean) #FUN is Function. e.g., centrality or spread
height_summaryBK <- summaryBy( Height ~ Basketball , data = yale_subSH, FUN = mean)


print(height_summaryBS)
# Height.mean
# 1     75.0098
print(height_summaryBK)
# Height.mean
# 1     75.0098

# 4. Probability of meeting an athlete > 75
ht <- yale_subSH$Height
prob_tall <- round((sum(ht > 75) / length(ht)) * 100, digits = 2)
glue("{prob_tall}%")
# 41.18%

# 5.Relative risk of being tall as a basketball player vs baseball player
S <- subset(yale_subSH, subset = Sport == "Baseball")
K <- subset(yale_subSH, subset = Sport == "Basketball")

STall <-subset(S, subset = Height > 75) # return df of baseball players > 75
# head(STall)
rS<- nrow(STall) / nrow(S) #risk of baseball player being tall


KTall <-subset(K, subset = Height > 75)
rK<- nrow(KTall) / nrow(K) #risk of basketball player being tall

# relative risk
print(rK/rS)
# [1] 4.78125
# 4.78 times more likely to be tall as basketball player than as a baseball player


# 6. Odds ratio of being tall as a basketball player vs baseball player
# Odds ratio = odds of tall as basketball player / odds of tall as baseball player

KShort <- nrow(K) - nrow(KTall) # no. short based on total {sport}ball players - tall {sport}ball players
SShort <- nrow(S) - nrow(STall)


odds_K <- nrow(KTall) / KShort # no. tall basketball players / no. short basketball players
odds_S <- nrow(STall) / SShort

odds_ratio <- odds_K / odds_S

print(odds_ratio)
# [1] 13.96429 times the odds of being tall as basketball player than baseball player


# 7. contingency table, calculate odds ratio
# basketball/baseball x short/tall

df <- data.frame(
  Sport = yale_subSH$Sport,
  Height = yale_subSH$Height > 75
  )

my_table <- table(df$Sport, df$Height, dnn = c("Sport","> 75cm vs <= 75cm") )
  print(my_table)
  # FALSE TRUE
  # Baseball      46    8
  # Basketball    14   34
  
oddsratio(my_table)
# odds ratio with 95% C.I.
# Sport        estimate    lower    upper
# Baseball    1.00000       NA       NA
# Basketball 13.34158 5.227217 37.86765


# 8. calculate relative risk

riskratio(my_table)
# risk ratio with 95% C.I.
# Sport        estimate   lower    upper
# Baseball    1.00000      NA       NA
# Basketball  4.78125 2.45929 9.295508