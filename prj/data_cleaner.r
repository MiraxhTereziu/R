# import data csv file of the responses
my_data <-
    read.csv(
        ".\\data\\streaming_dataset_dirty.csv"
    )

# define ranges, where question starts and end
netflix_socio <- c(3:7)
prime_socio <- c(8:12)
both_socio <- c(13:17)

netflix_questions <- c(18:50)
prime_questions <- c(51:83)
both_questions <- c(84:149)

open_q <- c(30, 31, 40, 63, 64, 73, 77)

# save on file coloums names for using it later
# starting_col_names <- names(my_data)
# write.csv(starting_col_names, ".\\data\\col_names.csv")

# get coloums names from cvs file
starting_col_names <- read.csv(".\\data\\col_names.csv")
# data manipulation to for type matching
starting_col_names <- starting_col_names[, -c(1)]
# apply the new coloum names
colnames(my_data) <- starting_col_names

# separate dataset depending on platform
netflix <- subset(
    my_data,
    my_data$platform %in% c("Netflix")
)
prime <- subset(
    my_data,
    my_data$platform %in% c("Amazon Prime Video")
)
both <- subset(
    my_data,
    my_data$platform %in% c("Both platforms")
)

# delete not necessary coloums
netflix <- netflix[, -c(
    prime_socio,
    both_socio,
    both_questions
)]
# print(dim(netflix))

prime <- prime[, -c(
    netflix_socio,
    both_socio,
    both_questions
)]
# print(dim(prime))

both <- both[, -c(
    netflix_socio,
    prime_socio,
    netflix_questions,
    prime_questions,
    open_q
)]
# print(dim(both))

# get final name coloums
# final_col_names <- names(netflix)
# write.csv(final_col_names, ".\\data\\final_col_names.csv")

# apply coloums names required for joining the tables
# colnames(prime) <- final_col_names

# table join
# new_data <- rbind(both, netflix, prime)

both <- both[, -c(
    open_q
)]

# get coloums names from cvs file
final_col_names <- read.csv(".\\data\\final_col_names.csv")
print(final_col_names)
# data manipulation to for type matching
final_col_names <- final_col_names[, -c(1)]

colnames(both) <- final_col_names
new_data <- both

# deleting an entry of a very funny guy
new_data <- new_data[new_data$gender != "Ginofobico", ]

print(dim(my_data))
print(dim(new_data))
print("t")

id <- c(1:(length(new_data)+1))
new_data <- cbind(id, new_data)
# save cleand data on csv file
write.csv(new_data, ".\\data\\streaming_dataset_clean.csv")

# now the data is clean and beatiful, terrific!

print(mean(new_data$PV_USE16))