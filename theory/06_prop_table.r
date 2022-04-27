#--------------prop table--------------

#TODO: Pay attention to the lecture
data_sw <- read.csv2("C:\\Users\\mirax\\OneDrive\\Desktop\\R\\data\\DATASW.csv")

# gives the value of how many females/male succeeded and failed the task
print(table(data_sw$Gender, data_sw$SuccT1t1))

# gives the value of how many females/male
# succeeded and failed the task
print(prop.table(table(data_sw$Gender, data_sw$SuccT1t1)))

# probability of a failure or success based on the gender
print(prop.table(table(data_sw$Gender, data_sw$SuccT1t1), 1)) # P(S11|G)

# probability of female or male based on the success or failure of the task
print(prop.table(table(data_sw$Gender, data_sw$SuccT1t1), 2)) # P(G|S11)