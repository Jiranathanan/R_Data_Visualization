#install.packages('data.table')
library(ggplot2)
library(data.table)
df <- fread('c:/Code/R/ggplot2/project/Economist_Assignment_Data.csv', drop=1)
#print(head(df))

#pl <- ggplot(df, aes(x=CPI,y=HDI)) + geom_point(aes(color=factor(Region)))
pl <- ggplot(df, aes(x=CPI,y=HDI,color=Region)) + geom_point(size=4,shape=1)
pl2 <- pl + geom_smooth()

print(pl2)