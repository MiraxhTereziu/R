#--------------summary & apply--------------

# summary (DATA) summarize the content of a numerical data structure

seed <- 10
set.seed(seed = seed) # setting the seed of our random numbers

x <- seq(1:10)
y <- runif(10) # uniform distribution (n, min = 0, max = 1)
z <- rnorm(10) # normal distrubution

your_data <- data.frame(x, y, z)
your_data

# summary of x y z
summary_xyz <- summary(your_data)

a <- c(rep("a", 2), rep("b", 4), rep("c", 4))

# different result with characters and numerical values
summary_a <- summary(a)

# apply (DATA, MARGIN, FUN)
# return array or list obtained by appling a specific function to some data

sum_row <- apply(your_data, 1, sum) # rowWise sum of the elements of our data
sum_col <- apply(your_data, 2, sum) # columWise sum of the elements of our data

# other example but with max
max_row <- apply(your_data, 1, max)
max_col <- apply(your_data, 2, max)