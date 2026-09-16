setwd("C:/Users/justi/Documents/pubh_505")
library(epitools)

yale = read.csv("Yale_Athletics.csv")

yale = subset(yale, subset =Sport %in% c("Baseball","Basketball"))
yale$Tallness = ifelse(yale$Height>72, "Tall","Short")

tbl = table(yale$Sport, yale$Tallness)

# 7.
oddsratio(tbl)
# 8.
riskratio(tbl)




#5. relative risk arithmetic


bask = yale[which(yale$Sport=="Basketball"), ]

pTall_gBask = sum(bask$Height>72)/nrow(bask)

base = yale[which(yale$Sport=="Baseball"), ]
pTall_gBase = sum(base$Height>72)/nrow(base)

rrT_gBask_v_Base = pTall_gBask/pTall_gBase

rrT_gBase = pTall_gBase / (1-pTall_gBase)
rrT_gBask = pTall_gBask / (1-pTall_gBask)




# 6. odds ratio arithmetic

oTall_gBase = pTall_gBase / (1-pTall_gBase)
oTall_gBask = pTall_gBask / (1-pTall_gBask)

orT_gBask_v_Base = oTall_gBask / oTall_gBase

rrT_gBask_v_Base
orT_gBask_v_Base

