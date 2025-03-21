days <- c('Mon', 'Tue', 'Wed', 'Thur', 'Fri')
temp <- c(22.2, 43.0, 35.1, 51.8, 19.5)
rain <- c(T,T,F,F,T)

df <- data.frame(days, temp, rain)
df

str(df)
summary(df)
