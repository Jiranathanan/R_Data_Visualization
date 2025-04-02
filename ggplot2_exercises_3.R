library(ggplot2)
library(ggthemes)

pl <- ggplot(txhousing, aes(x=sales,y=volume))
pl2 <- pl + geom_point(color='blue',alpha=0.3)
pl3 <- pl2 + geom_smooth(color='red')

print(pl3)