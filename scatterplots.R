library(ggplot2)
df <- mtcars

# DATA & AESTHETICS
pl <- ggplot(df, aes(x=wt,y=mpg))

# GEOMETRY
# print(pl + geom_point(aes(shape=factor(cyl), color=factor(cyl)), size=5))
# because cyl is not continueous , if we simply use aes=(size=cyl) ggplot will display
# as 2 3 4 5 6 7 8, instead in real life cylinder must be even (4, 6 , 8)
# so we need to use aes(size=factor(cyl))

# use hex as color
# pl2 <- pl + geom_point(size=5, color='#56ea29')
# print(pl2)

pl2 <- pl + geom_point(aes(color=hp), size=5)

# print(pl2)

# Add scale color gradient
pl3 <- pl2 + scale_color_gradient(low='blue', high='red')

print(pl3)
