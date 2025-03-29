library(ggplot2)
#theme_set(theme_minimal())

#install.packages('ggthemes')
library(ggthemes)

pl <- ggplot(mtcars, aes(x=wt,y=mpg)) + geom_point()

print(pl + theme_wsj())