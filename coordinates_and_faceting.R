library(ggplot2)

pl <- ggplot(mpg, aes(x=displ, y=hwy)) + geom_point()

#pl2 <- pl + coord_cartesian(xlim=c(1,4), ylim=c(15,30))

#pl2 <- pl + coord_fixed(ratio = 1/3)

#facet grid
pl2 <- pl + facet_grid(drv ~ .)
#pl2 <- pl + facet_grid(cyl ~ drv)
#pl2 <- pl + facet_grid(. ~ drv)
print(pl2)