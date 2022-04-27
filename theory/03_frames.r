#--------------frames--------------

# content of the data frame
rt <- (200:207)
gen <- c("M", "F", "M", "F", "M", "F", "M", "F")
eta <- (20:27)

# in simple words frames are simply fucking tables
your_data <- data.frame(rt, gen, eta)

# filtering of frames
your_data_filtered <- your_data[1:5, c(1:3)]

# logical operation appleid to our frames for filtering
your_data_male <-
    your_data[your_data$gen == "M", ]

# others examples
your_data_female_25 <-
    your_data[
        (your_data$gen == "F") &
            (your_data$eta >= 25),
    ]

your_data_male_25_b <-
    your_data[
        (your_data$gen == "M") &
            (your_data$eta >= 25),
        c(2:3) # here we only want colums number 2 and 3 (so gen and eta)
    ]