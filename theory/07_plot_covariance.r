#--------------plot--------------

seed <- 50
set.seed(50)
noise_level <- 3

x <- rnorm(200, 0, 3)
print(mean(x))

# random noise
e <- rnorm(200, 0, noise_level)

y <- x + e # y = x + e
y <- rnorm(200, 0, 3)


my_data <- data.frame(x, y)
print(head(my_data))

# plot(x,y)
plot(
    x = x,
    y = y
)

# mean of x and y
mean_x <- mean(x)
mean_y <- mean(y)

# showing the mean point on the graph
points(
    x = mean_x,
    y = mean_y,
    cex = 2, # size of the pint
    col = "blue" # color of the point
)

#--------------covariance--------------

print(cov(x, y))

# histogram
hist(x)

x2 <- rnorm(200, 1, 1.5)
#windows()
hist(x2)

#--------------correlation--------------

cor(x, y)

#real example correlation
data_sw <- read.csv2("C:\\Users\\mirax\\OneDrive\\Desktop\\R\\data\\DATASW.csv")
print(head(data_sw))

#form this we can see that people had similar times compliting task 1 & 2
print(cor(data_sw$TT1t1, data_sw$TT1t2))
plot(data_sw$TT1t1, data_sw$TT1t2)
