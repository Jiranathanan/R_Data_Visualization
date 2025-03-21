days <- c('Mon', 'Tue', 'Wed', 'Thur', 'Fri')
temp <- c(22.2, 43.0, 35.1, 51.8, 19.5)
rain <- c(T,T,F,F,T)

df <- data.frame(days, temp, rain)
df

str(df)
summary(df)

# Indexing and Selection
# Select first column or days column
df[,1]

# Select value of vector in rain column
df[,'rain']
# equivalent of df$rain or df[['rain]] with double brackets [[]]

# Select Dataframe with only rain column
df['rain']

# Select rows 1 to 3 with columns days and rain
df[1:3, c('days', 'rain')]

# Subseting
# return only rows that rain (rain == TRUE)
subset(df, subset = rain==T)

# return only rows that temp over 23
subset(df, subset = temp > 23)

# Sorting
sorted.temp <- order(df['temp'])
sorted.temp
# 5 1 3 2 4
df[sorted.temp,]

# descending
desc.temp <- order(-df['temp'])
desc.temp
# 4 2 3 1 5
df[desc.temp,]
