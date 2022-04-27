#--------------exercise1--------------

#--------------1.1--------------
# Construct a data frame using the variables represented in the table

gender <- c(rep("M", 5), rep("F", 5))
smartph_uh <- c(5, 3, 7, 3.5, 4.2, 6.4, 2.5, 1, 8.5, 8)
commuting_h <- c(0.5, 2, 1.5, 1.1, 3.2, 2.2, 0, 2, 1.8, 3.1)
vechile <- c(
    "bus",
    "train",
    "car",
    "car",
    "train",
    "car",
    "none",
    "bus",
    "car",
    "car"
)

working_data <- data.frame(gender, smartph_uh, commuting_h, vechile)

print("1.1---------------------------------")
print(working_data)

#--------------1.2--------------
# Construct two new dataframes DAT1M and DATA1F containing the data profiles
# associated with (resp.) the male group and female group in the original DATA1.

data_female <- working_data[
    working_data$gender == "F",
]

data_male <- working_data[
    working_data$gender == "M",
]

print("1.2---------------------------------")
print(data_female)
print(data_male)

#--------------1.3--------------
# Select all the data profiles in DATA1 associated with individuals using a
# smartphone for at least 4h per day and using a car for commuting
# [note: you are required to use relational/logical operators]

data_13 <- working_data[
    (working_data$smartph_uh >= 4.0) &
        (working_data$vechile == "car"),
]

print("1.3---------------------------------")
print(data_13)

#--------------1.4--------------
# Select all the data profiles in DATA1 associated to
# either those individuals #using a smartphone for at
# least 3h or those commuting for a minimum of 2h per day.

data_14 <- working_data[
    xor(
        (working_data$smartph_uh >= 3.0),
        (working_data$commuting_h >= 2.0)
    ),
]

print("1.4---------------------------------")
print(data_14)

#--------------1.5--------------
# Select all the data profiles in DATA1 associated to either
# those individuals using a smartphone for at least 3h or
# those commuting by car for a minimum of 2h per day.

data_15 <- working_data[
    xor(
        (working_data$smartph_uh >= 3.0),
        (working_data$commuting_h >= 2.0 & working_data$vechile == "car")
    ),
]


print("1.5---------------------------------")
print(data_15)

#--------------1.6--------------
# Add a new column, named ratio, to the dataframe DATA1. ratio will contain for
# each individual the ratio between the corresponding smartphUH and commutingH
# values [hint: there are several ways to do this, one way requires the usage
# of the function cbind()].

ratio <-
    (working_data$smartph_uh) /
        (working_data$commuting_h)

working_data <- cbind(working_data, ratio)

print("1.6---------------------------------")
print(working_data)

#--------------1.7--------------
# Construct an object list containing DATA1, DATA1M, and DATA1F as its elements.
final_list <- list(
    original_data = working_data,
    data_male = data_male,
    data_female = data_female
)

print("1.7---------------------------------")
print(final_list)