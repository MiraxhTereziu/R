#--------------one sample t test--------------

# setting seed
seed <- 8
set.seed(seed = seed)

# generation of data
x <- rnorm(
    65,
    mean = 25.3,
    sd = 1.1
)

# our target mean
mu0 <- 24

# we are testing our data (with mean 25.1 and sd 1.1)
# with a predefined mean equal to 24
print(t.test(x, mu = mu0))

#--------------two samples t test--------------