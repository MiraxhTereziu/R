#--------------SUS--------------

# 1 - For odd-numbered questions, subtract 1 from the response
# 2 - For even-numbered questions, subtract the response from 5
# 3 - Sum up the values and multiply this by 2.5

#--------------Data import--------------
my_data <-
    read.csv("C:\\Users\\mirax\\OneDrive\\Desktop\\R\\data\\sus_test.csv")

#--------------SUS calculation--------------

odd <- function(x) x - 1
even <- function(x) 5 - x

# apply different operations to odd and even colums
evens <- apply(my_data[c(1, 3, 5, 7, 9)], 2, odd)
odds <- apply(my_data[c(2, 4, 6, 8, 10)], 2, even)

# merge odd and even colums back togheter
sus <- cbind(evens, odds)

# reoder coulms (not actually necessary)
sus <- sus[, c(1, 6, 2, 7, 3, 8, 4, 9, 5, 10)]

# basic sum of each row
raw_sum <- apply(sus, 1, sum)

# multiplier for converting in 0 to 100 scale
multiplier <- 2.5
sus_sum100 <- raw_sum * multiplier

# mean of sum
sus_mean100 <- mean(sus_sum100)

# standard deviation
sus_sd100 <- sd(sus_sum100)

# printout final sus values with also sd
print("SUS")
print(sprintf("Mean: %.2f SD : %.2f", sus_mean100, sus_sd100))

boxplot(sus_sum100)