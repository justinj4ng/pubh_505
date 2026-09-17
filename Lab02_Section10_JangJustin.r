rm(list=ls())
graphics.off()

setwd("~/pubh_505")
library(doBy)
# library(glue)
library(epitools)


# 1.
yale = read.csv("Yale_Athletics.csv")
print(nrow(yale))
# 1228 observations in this dataset

# 2. Subsetting data

yale_sub = subset(yale, subset = Sport %in% c("Baseball","Basketball"))

yale_subSH <- yale_sub[,c("Sport", "Height")]

yale_subSH <- na.omit(yale_subSH)

print(paste(dim(yale_subSH)[1],"rows,",dim(yale_subSH)[2], "columns"))
# 202 rows, 2 columns

# 3. Summarizing heights

height_summary <- summaryBy( Height ~ Sport , data = yale_subSH, FUN = c(mean,sd))


print(height_summary)
# Sport Height.mean Height.sd
# 1   Baseball    73.25234  2.503181
# 2 Basketball    77.43158  3.240871

# 4. Probability of meeting an athlete > 75

base = subset(yale, subset = Sport %in% "Baseball")
bask = subset(yale, subset = Sport %in% "Basketball")

p_bask = round(mean(bask$Height>75), digits = 4)
p_base = round(mean(base$Height>75), digits =4)

print(paste("P(Tall|Baseball) =",p_base,"%; P(Tall|Basketball)=",p_bask,"%"))
# "P(Tall|Baseball) = 0.1495 %; P(Tall|Basketball)= 0.7474 %"

# 5.Relative risk of being tall as a basketball player vs baseball player
# arithmetically.
bask = yale[which(yale$Sport=="Basketball"), ]

pTall_gBask = sum(bask$Height>75)/nrow(bask)

base = yale[which(yale$Sport=="Baseball"), ]
pTall_gBase = sum(base$Height>75)/nrow(base)


rrT_gBase = pTall_gBase / (1-pTall_gBase)
rrT_gBask = pTall_gBask / (1-pTall_gBask)

rrT_gBask_v_Base = round(pTall_gBask/pTall_gBase, digits = 3)

print(paste(rrT_gBask_v_Base, "times the risk to be tall as a basketball player vs baseball player."))
# 4.998 times the risk to be tall as a basketball player vs baseball player.


# 6. odds ratio arithmetic

oTall_gBase = pTall_gBase / (1-pTall_gBase)
oTall_gBask = pTall_gBask / (1-pTall_gBask)

orT_gBask_v_Base = round(oTall_gBask / oTall_gBase , digits = 3)

print(paste(orT_gBask_v_Base, "times the odds of being tall as a basketball player vs baseball player "))
# 16.83 times the odds of being tall as a basketball player vs baseball player 

# 7.
yale = subset(yale, subset =Sport %in% c("Baseball","Basketball"))
yale$Tallness = ifelse(yale$Height>75, "Tall","Short")

tbl = table(yale$Sport, yale$Tallness)
or = oddsratio(tbl)

print(tbl)
print(or$measure[2,1])
#             Short Tall
# Baseball      91   16
# Basketball    24   71
# 16.40094
# The odds of being tall as a basketball player versus being tall as a baseball
# player is 16.40


# 8.
rr = riskratio(tbl)
print(rr$measure[2,1])
# 4.998026
# The relative risk (RR) of being tall (>75in) for a basketball player versus
# a baseball player is 4.998
