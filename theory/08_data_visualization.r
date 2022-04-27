#--------------visualization--------------

seed <- 500
set.seed(
    seed = seed
)

x <- rnorm(250, 0, 3)
y <- x + rnorm(250, 0, 1.5) # y = x + e (e = noise, random error)

my_data <- data.frame(x, y)

print(head(my_data))

#--------------scattereplot--------------

windows()
plot(
    x = my_data$x,
    y = my_data$y,
    main = "Scattereplot X and Y", # title label
    xlab = "Variable X", # x label
    ylab = "Variable Y", # y label
    xlim = c(-13, 13), # range we want to see on X
    ylim = c(-18, 18) # range we want to see on Y
)

#--------------instagram--------------

windows()
hist(
    x = x,
    breaks = 20, # break points
    freq = FALSE # change from density to frequency
)

#--------------boxplot (it is a box)--------------

z <- rnorm(250, 0.5, 3)

windows()
boxplot(
    x,
    y,
    z,
    names = c("X", "Y", "Z")
)

w1 <- rnorm(250, 0.5, 1)
w2 <- rnorm(250, 0, 1)

windows()
boxplot(
    w1,
    w2,
    names = c("w1", "w2")
)

print(median(w1))
print(median(w2))
