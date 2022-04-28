#install.packages("plotly")
library(plotly)
library(ggplot2)


# load data
my_data <-
    read.csv(
        ".\\data\\streaming_dataset_clean.csv"
    )

age <- table(my_data$age)
gender <- table(my_data$gender)
occupation <- table(my_data$occupation)
live <- table(my_data$live)
living_situation <- table(my_data$living_situation)


windows()
par(mfrow = c(2, 2)) # divide it in a grid 2x3
pie(age, main = "Age")
pie(gender, main = "Gender")
pie(living_situation, main = "living situation")
# pie(occupation, main = "Occupation") #data needs to be cleaned 
# pie(live, main = "Live") #data needs to be cleaned 