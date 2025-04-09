library(dplyr)
library(ggplot2)
#Reading Batting.csv
batting <- read.csv('Batting.csv')
#use head() to check the batting
print(head(batting))
#use str() to check the structure
#str(batting)

#call the head() of the first five rows of AB (At Bats) column
head(batting$AB)
#call the head of the doubles (X2B) Column
head(batting$X2B)

#Batting Average
batting$BA <- batting$H / batting$AB
# Check the last 5 entries of the BA column
tail(batting$BA, 5)

# On Base Percentage
batting$OBP <- (batting$H + batting$BB +batting$HBP) / (batting$AB + batting$BB + batting$HBP + batting$SF)

# Creating X1B (Singles)
batting$X1B <- batting$H - batting$X2B - batting$X3B - batting$HR 

# Creating Slugging Average (SLG)
batting$SLG <- ((1*batting$X1B)+(2*batting$X2B)+(3*batting$X3B)+(4*batting$HR)) / batting$AB

# Check the structure of your data frame using str()
str(batting)


# Merging Salary Data with Batting Data
# load the Salaries.csv file into a dataframe called sal using read.csv
sal <- read.csv('Salaries.csv')

#use summary to get a summary of the batting data frame and notice the minimum year in the yearID column.
#Our batting data goes back to 1871. Our salary data starts at 1985, meaning we need to remove the batting
# data that occured before 1985
summary(batting)

#remove batting data before 1985
# use subset() to reassign batting to  only contain data from 1985 and onwards
batting <- subset(batting, yearID >= 1985)

# use summary again and check yearID min should be 1985

# Use the merge() function to merge the batting and sal data frames by c('playerID', 'yearID'), call the new data frame combo
combo <- merge(batting, sal, by = c('playerID', 'yearID'))
# Use summary to check the data
summary(combo)



# Analyzing the lost players
# Oakland lost 3 keys players during the off-season. we'll want to get their stats to see what we have to replace.
# The players lost were: fist baseman 2000 AL MVP Jason Glambi (glambja01) to New York Yankees, outfielder Johnny Damon (damonjo01)
# to Boston Red Sox and infielder Rainer Gustavo "Ray" Olmedo (saenzol01)

# Use the subset() function to get a data frame called lost_players fromt he combo data frame consisting of those 3 players.
lost_players <-  subset(combo, playerID %in% c('giambja01', 'damonjo01', 'saenzol01'))
lost_players

# Since all these players were lost in after 2001 in the offseason, we only concern with the data form 2001
# use subset again to only grab the rows where the yearID was 2001
lost_players<- subset(lost_players, yearID == 2001)

# reduce the lost_players data frame to columns: playerID, H, X2B, X3B, HR, OBP, SLG, BA, AB
lost_players <- lost_players[, c('playerID', 'H', 'X2B', 'X3B', 'OBP','SLG', 'BA', 'AB')]
head(lost_players)

# final task - Find Replacement Players for the key three players we lost.
# Fist only grab available players from year 2001
avail.players <- filter(combo, yearID==2001)

# quick plot to see where should cut-off for salary in respect to OBP
ggplot(avail.players, aes(x=OBP,y=salary)) + geom_point()

# just eyeballing the number, no point in paying above 8milion and 
# there are a lot of players with OBP == 0
# let's get rid of them
avail.players <- filter(avail.players, salary < 8000000, OBP > 0)
# the total AB of lost players is 1469. This is about 1500
# meaning I should probably cut off avail.players at 1500/3= 500 AB
avail.players <- filter(avail.players, AB >= 500)

# sort by OBP
possible <- head(arrange(avail.players, desc(OBP)), 10)

# grab only columns we interested in
possible <- possible[, c('playerID', 'OBP', 'AB', 'salary')]

possible

# Can't choose giambja again, but the other looks good (2:4). let's choose them!
possible[2:4,]











