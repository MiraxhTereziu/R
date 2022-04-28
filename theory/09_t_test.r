#--------------one sample t test--------------

# setting seed
seed <- 8
set.seed(seed = seed)

# generation of data
a <- rnorm(
    65,
    mean = 25.3,
    sd = 1.1
)

# our target mean
mu0 <- 24

# we are testing our data (with mean 25.1 and sd 1.1)
# with a predefined mean equal to 24
print(t.test(a, mu = mu0))

#--------------two samples t test--------------

# setting seed
seed <- 50
set.seed(50)

# generation of data sample 1
x <- rnorm(
    45,
    mean = 50,
    sd = 3
)

# generation of data sample 2
y <- rnorm(
    53,
    mean = 51,
    sd = 4
)

u <- seq(
    0,
    90,
    by = 0.5
)

fx <- dnorm(
    u,
    50,
    3
)

fy <- dnorm(
    u,
    51,
    4
)

plot(
    u,
    fx,
    type = "l",
    xlim = c(35, 65)
)

points(
    u,
    fy,
    type = "l",
    col = "#EB1C1C"
)

t.test(x, y)
boxplot(
    x,
    y,
    names = c("X", "Y")
)