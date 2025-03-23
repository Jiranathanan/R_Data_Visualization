library(ggplot2)
df <- mtcars

pl <- ggplot(df, aes(x=factor(cyl),y=mpg))
# x or cyl can't be continuous, so we need to factor() it

# print(pl + geom_boxplot())
# print(pl + geom_boxplot() + coord_flip())
# print(pl + geom_boxplot(fill='blue') )
# print(pl + geom_boxplot(aes(fill=factor(cyl))))
print(pl + geom_boxplot(aes(fill=factor(cyl))) + theme_dark())
