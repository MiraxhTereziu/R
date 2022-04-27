#--------------factor--------------

a <- c("a", "b", "c", "d", "e")
a <- as.factor(a)

print(a)

v <- c(1:10)
v <- as.factor(v)

print(v)

grade <- c("bad", "good", "meh", "meh", "good", "bad")
grade <- factor(
    grade,
    levels = c("bad", "meh", "good"),
    ordered = TRUE
)

print(grade)

t <-
    factor(
        c(
            rep("a", 12),
            rep("b", 3),
            rep("a", 5),
            rep("c", 2)
        ),
        levels = c("a", "b", "c"), #actually not necessary
        ordered = TRUE
    )

print(t)

set.seed(100)

y <- rnorm(20)
print(y)

# some random functions
print(quantile(y, 0.22))
print(range(y))

