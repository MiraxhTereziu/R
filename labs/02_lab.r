#--------------Lab2--------------

#--------------1.1--------------
# Use a spreadsheet software (e.g., Excel, Calc) to construct the tabular
# representation reported above. Next save it as a .csv file, and finally
# load it in the R environment. Hint: while constructing the tabular
# representation in the spreadsheet software use the first row of the
# spreadsheet to report the names of the variables.

data_sp <-
    read.csv(
        "C:\\Users\\mirax\\OneDrive\\Desktop\\R\\data\\SmartphoneDATA.csv"
    )

print("1.1---------------------------------")
print(data_sp)

#--------------1.2--------------
# Assign to the variables Build, Display, and PressDispl a factorial
# (categorical) representation by using the appropriate R function.

data_sp$Build <- as.factor(data_sp$Build)
data_sp$DisplT <- as.factor(data_sp$DisplT)
data_sp$PressS <- as.factor(data_sp$PressS)

print("1.2---------------------------------")
print(data_sp$Build)
print(data_sp$DisplT)
print(data_sp$PressS)

#--------------1.3--------------
# Assign to the variables RAM and Attractiveness an ordinal
# representation using the appropriate R function.

data_sp$RAMGB <- factor(
    data_sp$RAMGB,
    ordered = TRUE
)

data_sp$Attract <- factor(
    data_sp$Attract,
    levels = c("Poor", "Mod", "Suff", "Appr", "High"),
    ordered = TRUE
)

print("1.3---------------------------------")
print(data_sp$RAMGB)
print(data_sp$Attract)

#--------------1.4--------------
# Construct and show the values of the contingency table obtained
# on the basis of the categorical variables Build (represented in
# the rows of the table) and Display (represented in the columns
# of the table). By using the same contingency table derive a)
# the corresponding proportion table b) the observed conditional
# probability table P(Build|Display).

tbd <- table(data_sp$Build, data_sp$DisplT)

print("1.4---------------------------------")
print(prop.table(tbd, 2))

#--------------1.5--------------
# Summarize the content of the sub-dataframe composed by the
# quantitative variables Length, Width, and Weight.

dimensions <- data.frame(
    data_sp$Length,
    data_sp$Width,
    data_sp$Weight
)

print("1.5---------------------------------")
print(summary(dimensions))

#--------------1.6--------------
# Compute the correlation values between
# a) Length and Width
# b) Length and Weight
# c) Width and Weight

correlation_a <- cor(data_sp$Length, data_sp$Width)
correlation_b <- cor(data_sp$Length, data_sp$Weight)
correlation_c <- cor(data_sp$Width, data_sp$Weight)

print("1.6---------------------------------")
print(correlation_a)
print(correlation_b)
print(correlation_c)

windows()
plot(data_sp$Length, data_sp$Width)

windows()
plot(data_sp$Length, data_sp$Weight)

windows()
plot(data_sp$Width, data_sp$Weight)

#--------------1.7--------------
# Derive the ranges for each quantitative variable (Length, Width, and Weight)
# by considering only those smartphones that are aluminum-based.

dimension_ranges <- data.frame(
    range(
        data_sp$Length[data_sp$Build == "A"]
    ),
    range(
        data_sp$Width[data_sp$Build == "A"]
    ),
    range(
        data_sp$Weight[data_sp$Build == "A"]
    )
)

print("1.7---------------------------------")
print(dimension_ranges)