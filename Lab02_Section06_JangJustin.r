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
bask = yale[which(yale$Sport=="Basketball"), ]

pTall_gBask = sum(bask$Height>72)/nrow(bask)

base = yale[which(yale$Sport=="Baseball"), ]
pTall_gBase = sum(base$Height>72)/nrow(base)

rrT_gBask_v_Base = pTall_gBask/pTall_gBase

rrT_gBase = pTall_gBase / (1-pTall_gBase)
rrT_gBask = pTall_gBask / (1-pTall_gBask)

glue("{rrT_gBask_v_Base} times more likely to")

# 6. odds ratio arithmetic

oTall_gBase = pTall_gBase / (1-pTall_gBase)
oTall_gBask = pTall_gBask / (1-pTall_gBask)

orT_gBask_v_Base = oTall_gBask / oTall_gBase

glue("{orT_gBask_v_Base} times more likely to")

yale = subset(yale, subset =Sport %in% c("Baseball","Basketball"))
yale$Tallness = ifelse(yale$Height>72, "Tall","Short")

tbl = table(yale$Sport, yale$Tallness)

# 7.
oddsratio(tbl)
# 8.
riskratio(tbl)