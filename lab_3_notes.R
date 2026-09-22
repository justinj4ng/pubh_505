dbinom(16, size = 25, prob = 0.4)
dbinom(15, size = 25, prob = 0.4)
dbinom(8, size = 25, prob = 0.4)


dbinom(0:5, size = 25, prob = 0.4)

pbinom(5, size = 25, prob = 0.4) # accumulation of bars

sum(dbinom(0:5, size = 25, prob = 0.4))

2/7

dbinom(0, 5, 0.4) # height at 1 bar

dbinom(1, 5, 0.4)

dbinom(2, 5, 0.4)


sum(dbinom(0:5, 5, 0.4))

dbinom(0:5, 5, 0.4)
# 0.07776 0.25920 0.34560 0.23040 0.07680 0.01024

pbinom(2, 5, 0.4)
# 0.68256
pbinom(2, 5, 0.4, lower.tail = FALSE)
# 0.31744
pbinom(3, 5, 0.4, lower.tail = FALSE)
# 0.08704

pbinom(0:5, 5, 0.4, lower.tail = FALSE)
# 0.92224 0.66304 0.31744 0.08704 0.01024 0.00000

qbinom(0.8, 5, 0.4)
# 3
qbinom(0.9, 5, 0.4)
# 3


dnorm(72, mean = 68, sd =3)
# 0.05467002
dnorm(72.05, mean = 68, sd =3)
# 0.05346111






