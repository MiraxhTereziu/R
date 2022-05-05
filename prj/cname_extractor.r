my_data <-
    read.csv(
        ".\\data\\new_c_names.csv"
    )

final_col_names <- names(my_data)
write.csv(final_col_names, ".\\data\\final_col_names.csv")
