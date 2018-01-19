# Exercise 2: working with data frames

# Create a vector of 100 employees ("Employee 1", "Employee 2", ... "Employee 100")
# Hint: use the `paste()` function and vector recycling
employees <- c(paste("Employee", c(1:100)))

# Create a vector of 100 random salaries for the year 2016
# Use the `runif()` function to pick random numbers between 40000 and 50000
salaries.2016 <- runif(100, min = 40000, max = 50000)

# Create a vector of 100 salaries in 2017 that have changed from 2016
# Use `runif()` to add a random number between -5000 and 10000 to each of 2016's
# salaries (the negative number means that a salary may have decreased!)
salaries.2017 <- '+'(salaries.2016, runif(100, min = -5000, max = 10000))

# Create a data frame 'salaries' by combining the 3 vectors you just made
# Remember to set `stringsAsFactors=FALSE`!
salaries <- data.frame(employees, salaries.2016, salaries.2017, stringsAsFactors = FALSE)

# Create a column 'change' that stores each person's change in salary between
# 2016 and 2017
salaries$change <- salaries$salaries.2017 - salaries$salaries.2016

# Create a column 'got.raise' that is TRUE if the person got a raise (their
# salary went up)
salaries$got.raise <- c(salaries$change > 0)


### Retrieve values from your data frame to answer the following questions
### Note that you should get the value as specific as possible (e.g., a single
### cell rather than the whole row!)

# What was the 2017 salary of employee 57
salaries[57, "salaries.2017"]

# How many employees got a raise?
raises <- salaries[, "got.raise"]
length(raises[raises])

# What was the dollar value of the highest raise?
print(max(salaries$change))

# What was the "name" of the employee who received the highest raise?
salaries[salaries$change == max(salaries$change), "employees"]

# What was the largest decrease in salaries between the two years?
min(salaries$change)

# What was the name of the employee who recieved largest decrease in salary?
salaries[salaries$change == min(salaries$change), "employees"]

# What was the average salary change?
mean(salaries$change)

# For people who did not get a raise, how much money did they lose on average?
negative.salaries <- salaries[ , "change"]
negative.salaries <- negative.salaries[negative.salaries < 0]
mean(negative.salaries)

## Consider: do the above averages match what you expected them to be based on 
## how you generated the salaries?
# yes

# Write a .csv file of your salary data to your working directory
write.csv(salaries, 'salaries.csv')
