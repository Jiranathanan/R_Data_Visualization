library(ggplot2)
library(ggthemes)
#head(mpg)

# Barplot of car counts per manufacturer with color
# fill defined by cyl count
pl <- ggplot(mpg, aes(x=manufacturer)) 
pl2 <- pl + geom_bar(aes(fill=factor(cyl)))

print(pl2)
