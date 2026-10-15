# Lab 4
# justin.jang@yale.edu
# @justinj4ng


rm(list=ls())
graphics.off()

setwd("~/pubh_505")


# 1. 
noaa_longformat = read.csv("NOAA_longformat.csv")

noaa_clean = na.omit(noaa_longformat)

print(table(noaa_clean$City))

# Result: 11,771 observations remain after removing missing data.
# ARK = 1181, DAK = 1200, LAS = 1136, LAX = 1164,
# MIA = 1173, NYC = 1200, SEA = 1199, STL = 1183,
# VTX = 1165, WOH = 1170.

#2. subset to summer months, years 1980-2000, and four cities
noaa_summer = subset(
  noaa_clean,
  Month %in% c(6, 7, 8) &
    Year >= 1980 & Year <= 2000 &
    City %in% c("NYC", "MIA", "LAX", "STL")
)

print(table(noaa_summer$City))

# Result: 252 observations remain.
# NYC = 63, MIA = 63, LAX = 63, STL = 63.


# 3.one-way ANOVA: temperature by city
anova_model = aov(Temperature ~ City, data = noaa_summer)

anova_result = summary(anova_model)

anova_p = anova_result[[1]]["City", "Pr(>F)"]

print(anova_result)
cat("ANOVA p-value for City:", format.pval(anova_p))

print("There is a statistically significant difference in temperature among cities.")

# Result: p-value = 2.22e-16.
# Reject the null hypothesis. Mean summer temperatures differ
# significantly among at least some of the four cities.

# 4. check normality of ANOVA residuals using skewness

residuals_anova = residuals(anova_model)

skewness = mean(
  (residuals_anova - mean(residuals_anova))^3
) / sd(residuals_anova)^3

print(skewness)
cat("Residual skewness:", round(skewness, 4), "\n")

print("Residual skewness is within the threshold. The normality assumption is reasonable based on skewness.")


# Result: skewness is approximately -0.0321.
# Since its absolute value is less than 0.4, residual skewness
# is small and does not indicate substantial asymmetry.
# The ANOVA is reasonable based on this skewness check alone.

# 5. Tukey HSD pairwise comparisons

tukey_result = TukeyHSD(anova_model)

print(tukey_result)

nyc_lax = tukey_result$City["NYC-LAX", "diff"]

print(paste("Estimated difference (NYC - LAX):", nyc_lax))



nyc_lax = tukey_result$City["NYC-LAX", ]

if (nyc_lax["p adj"] < 0.05) {
  cat(
    "NYC and LAX are significantly different.",
    "Estimated temperature difference (NYC - LAX):",
    round(nyc_lax["diff"], 4), "degrees.\n"
  )
} else {
  print("NYC and LAX: Not Different")
}

# Result: NYC and LAX are Not Different at alpha = 0.05.
# The estimated difference is approximately 1.0079 degrees,
# but the adjusted p-value is 0.2306, so it is not significant.


# 6. categorize temperatures as cool, nice, or hot

noaa_summer$Feel = ifelse(
  noaa_summer$Temperature <= 70, "cool",
  ifelse(noaa_summer$Temperature <= 80, "nice", "hot")
)

feel_table = table(noaa_summer$City, noaa_summer$Feel)

print(feel_table)

# Quality control: MIA has 61 hot observations and 2 nice
# observations. It has 0 cool observations.


# 7. chi-square test of independence

chi_result = chisq.test(feel_table)

print(chi_result)

chi_p = chi_result$p.value

cat("Chi-square p-value for City:", format.pval(chi_p), "\n")

if (chi_p < 0.05) {
  print("There is a statistically significant association between city and temperature category.")
} else {
  print("There is no statistically significant association between city and temperature category.")
}

# Result: p-value = 2.22e-16 .
# Reject the null hypothesis of independence. The distribution
# of cool, nice, and hot observations differs significantly
# among cities.


# 8. check the chi-square expected-count assumption

expected_counts = chi_result$expected

print(expected_counts)

cells_below_one = sum(expected_counts < 1)
cells_below_five = sum(expected_counts < 5)
total_cells = length(expected_counts)
percent_below_five = 100 * cells_below_five / total_cells

cat("Cells with expected counts below 1:", cells_below_one, "\n")
cat("Cells with expected counts below 5:", cells_below_five, "\n")
cat("Total number of cells:", total_cells, "\n")
cat("Percent of cells below 5:", percent_below_five, "%\n")

if (cells_below_one == 0 && percent_below_five <= 20) {
  print("The expected-count assumptions are satisfied.")
} else {
  print("The expected-count assumptions are not satisfied.")
}

# Result: 0 cells have expected counts below 1.
# 4 of 12 cells (33.33%) have expected counts below 5.
# The expected-count assumption is not satisfied because
# more than 20% of cells have expected counts below 5.
