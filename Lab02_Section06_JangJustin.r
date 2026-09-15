rm(list=ls())
graphics.off()

setwd("~/pubh_505")
library(doBy)

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
print(sum(ht > 75) / length(ht))
# [1] 0.4117647

# 5.Relative risk of being tall as a basketball player vs baseball player
S <- subset(yale_subSH, subset = Sport == "Baseball")
K <- subset(yale_subSH, subset = Sport == "Basketball")


print(sum(ht > 75) / (nrow(S)))
# [1] 0.7777778
print(sum(ht > 75) / (nrow(K)))
# [1] 0.875





