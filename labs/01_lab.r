#--------------Lab1--------------

#--------------1.1--------------
# Load the data file DATASW.csv in the R package
# and assign it to a data frame called DATA.

data_sw <- read.csv2("C:\\Users\\mirax\\OneDrive\\Desktop\\R\\data\\DATASW.csv")

#--------------1.2--------------
# Use the summary function to describe the content of the time on task variables

summarytt <- summary(data_sw[, 11:16])
print("1.2---------------------------------")
print(summarytt)

#--------------1.3--------------
# Compute the proportion of successes in task 2 at time 1 for the female group
# and compare it with the corresponding one of the male group (here provide a
# basic comparison by simply showing the two computed proportions).

rate_succt2t1_female <-
    sum(data_sw$SuccT2t1[data_sw$Gender == "f"]) /
        length(data_sw$SuccT2t1[data_sw$Gender == "f"])

rate_succt2t1_male <-
    sum(data_sw$SuccT2t1[data_sw$Gender == "m"]) /
        length(data_sw$SuccT2t1[data_sw$Gender == "m"])

print("1.3---------------------------------")
print(rate_succt2t1_female)
print(rate_succt2t1_male)
print(rate_succt2t1_female / rate_succt2t1_male)

#--------------1.4--------------
# DONE BY ME NEED APPROVAL
# Provide the summary statistics for the time on task variables by limiting
# the sample to the female group only.

summarytt_female <- summary(data_sw[data_sw$Gender == "f", 11:16])

print("1.4---------------------------------")
print(summarytt_female)

#--------------1.5--------------
# Repeat Ex. 1.4 this time considering the subgroup of participants composed
# by females who are practicing at least two different sports.

summarytt_female_sport2 <-
    summary(
        data_sw[
            (data_sw$Gender == "f" & data_sw$Nsports >= 2), 11:16
        ]
    )

print("1.5---------------------------------")
print(summarytt_female_sport2)

#--------------1.6--------------
# Compute the average sum of successes across the three tasks for the male
# group (hint: use the apply function).

male_succ_rate <-
    apply(
        data_sw[
            data_sw$Gender == "m", 4:9
        ], 1, sum
    ) / 6

print("1.6---------------------------------")
print(male_succ_rate)

#--------------1.7--------------
# Compute the average sum of successes across the three tasks for the male
# group with age greater than 30.

# my janky solution
male_succ_rate_over30_svalue <-
    apply(
        data_sw[
            data_sw$Gender == "m" &
                data_sw$Age > 30,
            4:9
        ], 1, sum
    )

male_succ_rate_over30 <-
    Reduce("+", male_succ_rate_over30_svalue) /
        length(male_succ_rate_over30_svalue)

# professors solution 
mean(apply(data_sw[data_sw$Gender == "m" & data_sw$Age > 30, 4:9], 1, sum))

print("1.7---------------------------------")
print(male_succ_rate_over30)

#--------------1.8--------------
# Compute for each individual the sum of the two easy of use items.

print(dim(data_sw))

easy_use_sum <-
    apply(
        data_sw[19:20], 1, sum
    )

print("1.8---------------------------------")
print(easy_use_sum)

#--------------1.9--------------
# Verify (in a purely descriptive way – no statistical inference is required)
# if the average value of time on task for task 1 at time 1 is larger for
# unsuccessful results as compared to successful ones.

# my janky solution
tt1_good_avg <-
    apply(
        data_sw[
            data_sw$SuccT1t1 == 1,
            11,
            drop = FALSE
        ], 2, sum
    ) / length(
        data_sw$TT1t1[
            data_sw$SuccT1t1 == 1
        ]
    )

tt1_bad_avg <-
    apply(data_sw[
        data_sw$SuccT1t1 == 0,
        11,
        drop = FALSE
    ], 2, sum) / length(
        data_sw$TT1t1[
            data_sw$SuccT1t1 == 0
        ]
    )

# professors solution
mean(data_sw$TT1t1[data_sw$SuccT1t1 == 0]) >
    mean(data_sw$TT1t1[data_sw$SuccT1t1 == 1])

print("1.9---------------------------------")
print(tt1_good_avg)
print(tt1_bad_avg)

#--------------1.10--------------
# Compute the average value of task time for task 3 at time 2 for the subgroup
# of individuals who either would recommend the sport watch to a friend or are
# very satisfied with it (level of satisfaction greater than 3).

# my janky solution
task_time_sat <-
    mean(
        apply(data_sw[
            xor(
                (data_sw$Sat1 > 3),
                (data_sw$Sat2 == 1)
            ),
            16,
            drop = FALSE
        ], 1, sum)
    )

# professors solution
mean(
    data_sw$TT3t2[
        xor(
            (data_sw$Sat1 > 3),
            (data_sw$Sat2 == 1)
        )
    ]
)

# NB: with the professors default data the result is NaN but the code is okay

print("1.10----------------------------------")
print(task_time_sat)