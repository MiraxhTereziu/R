#--------------Lab3--------------

#--------------2.1--------------
# Load the data file DATASW.csv in the R package (or R Studio)
# and assign it to a data frame called D

data_sw <- read.csv2("C:\\Users\\mirax\\OneDrive\\Desktop\\R\\data\\DATASW.csv")

#--------------2.2--------------
# Construct the histograms for the six Time on Task variables.
# For each histogram set the caption for the horizontal axis
# with the corresponding name of the variable and provide a
# main title the graphical representation. Repeats the exercise,
# this time by showing the six histograms directly into a single
# graphic window (hint: use the par(mfrow=c(n,m)) function to
# allocate the graphical representations in a n by m grid)

# get colums name
c_names <- names(data_sw)

windows() # open new window
par(mfrow = c(2, 3)) # divide it in a grid 2x3

# for loop to generate the six histograms
for (i in 11:16) {
    hist(
        x = data_sw[, i],
        xlab = "Empirical distribution",
        main = c_names[i]
    )
}

#--------------2.3--------------
# For each of the six Time on Task variables compute the sample
# mean and the sample variance.

for (i in 11:16) {
    print(c_names[i])
    print(mean(data_sw[, i]))
    print(var(data_sw[, i]))
}

#--------------2.4--------------
# For each of the six Time on Task variable construct a boxplot
# graphical representation containing two separate boxplots, one
# or each time occasion (t1 and t2).

windows() # open new window
par(mfrow = c(1, 3)) # divide it in a grid 2x3

for (i in 11:13) {
    boxplot(
        data_sw[, i],
        data_sw[, i + 3],
        names = c(c_names[i], c_names[i + 3]),
        main = "Boxplot"
    )
}

#--------------2.5--------------
# Construct a boxplot graphical representation containing two different
# boxplots for the age variable, one for the male group and the other
# for the female group. Provide also the captions for the two boxplots
# and a main title for the graphical representation. Comments the results.

windows()
boxplot(
    data_sw$Age[data_sw$Gender == "f"],
    data_sw$Age[data_sw$Gender == "m"],
    names = c("female", "male"),
    ylab = "Age in years",
    xlab = "Gender",
    main = "Age distributuon female vs male"
)

#--------------2.6--------------
# Construct a boxplot graphical representation containing two different
# boxplots for the average Time on Task 1: one for the individuals
# practicing one sport activity and the other for the individuals
# practicing at least two sport activities. Note: the average Time on
# Task 1 variable represents for each individual the average time between
# the two time occasions: t1 and t2.


data_sw$tt1_avg <- (data_sw$TT1t1 + data_sw$TT1t2) / 2

windows()
boxplot(
    data_sw$tt1_avg[data_sw$Nsports == 1],
    data_sw$tt1_avg[data_sw$Nsports >= 2],
    names = c("1 sport", "2 or more sports"),
    ylab = "TT1 avg time",
    xlab = "Number of sports",
    main = "TT1 avg time difference depending on number of sports"
)