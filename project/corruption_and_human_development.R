#install.packages('data.table')
library(ggplot2)
library(ggthemes)
library(data.table)
df <- fread('c:/Code/R/ggplot2/project/Economist_Assignment_Data.csv', drop=1)
#print(head(df))

#pl <- ggplot(df, aes(x=CPI,y=HDI)) + geom_point(aes(color=factor(Region)))
pl <- ggplot(df, aes(x=CPI,y=HDI,color=Region)) + geom_point(size=4,shape=1)
pl2 <- pl + geom_smooth(aes(group=1), method='lm',formula=y~log(x),se=F,color='red')

pointsToLabel <- c("Russia", "Venezuela", "Iraq", "Myanmar", "Sudan", 
                   "Afghanistan", "Congo", "Greece", "Argentina", "Brazil",
                   "Botswana", "Cape Verde", "Bhutan", "Rwanda", "France",
                   "United States", "Germany", "Britain", "Barbados", "Norway", "Japan",
                   "New Zealand", "Singapore"
                   )

pl3 <- pl2 + geom_text(aes(label=Country), color='gray20',
                       data=subset(df, Country %in% pointsToLabel), check_overlap = T)

#print(pl3 + theme_economist_white())
# require install.packages('dplyr') to use theme_economist_white()

# fix X to start from 1 to 10
pl4 <- pl3 + scale_x_continuous(limits = c(.9, 10.5),breaks=1:10)
print(pl4 + theme_economist_white())





