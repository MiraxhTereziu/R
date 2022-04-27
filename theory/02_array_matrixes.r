#--------------Example of matrixes--------------

# default colomwise
m1 <- matrix((1:6), 2, 3)

# but we can set rowwise fill
m2 <- matrix((1:6), 2, 3, byrow = TRUE)

# print of the 2 matrixes
print("Our two basic matrixes")
m1
m2

print("Subsection of matrix")
m1[c(1, 2), 2]

# sum of the 2 matriexes and print
sum_matrix <- m1 + m2
print("Sum matrix between m1 and m2")
sum_matrix

# subtraction of the 2 matriexes and print
sub_matrix <- m1 - m2
print("Sub matrix between m1 and m2")
sub_matrix

a <- 10
# sum unique value to matrix and print
sum_unique <- m1 + a
print("Sum of the variable a applied to the matrix")
sum_unique

# multiply unique value to matrix and print
multi_unique <- m1 * a
print("Multiplication of the variable a applied to the matrix")
multi_unique

#--------------Example of lists--------------

# creation of the list example
string_array <- c("ciao", "come", "stai")
boolean_array <- c(TRUE, FALSE, TRUE)
numeric_array <- (1:3)

list_example <- list(
    string = string_array,
    boolean = boolean_array,
    numeric = numeric_array
)

# operation with the list
print("List example")
list_example

print("Subcomponents of the list")
# by varibable name
list_example$string

# by index
list_example[[1]]

print("Appling a unique value to a subpartition of the list")
m3 <- a * list_example$numeric
m3