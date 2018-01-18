# Exercise 1: creating data frames

# Create a vector of the number of points the Seahawks scored in the first 4 games
# of the season (google "Seahawks" for the scores!)
number.of.points.scored <- c(40, 28, 35, 21)

# Create a vector of the number of points the Seahwaks have allowed to be scored
# against them in each of the first 4 games of the season
number.of.points.against <- c(25, 32, 14, 28)

# Combine your two vectors into a dataframe called `games`
games <- data.frame(number.of.points.scored, number.of.points.against, stringsAsFactors = FALSE)

# Create a new column "diff" that is the difference in points between the teams
# Hint: recall the syntax for assigning new elements (which in this case will be
# a vector) to a list!
games$diff <- c(games$number.of.points.scored - games$number.of.points.against)

# Create a new column "won" which is TRUE if the Seahawks won the game
games$won <- c(games$diff > 0)

# Create a vector of the opponent names corresponding to the games played
opponent <- c("Vikings", "Saints", "Steelers", "Broncos")

# Assign your dataframe rownames of their opponents
games$opponents <- opponent

# View your data frame to see how it has changed!
View(games)
