library(tidyverse)
library(ggplot2)

ggplot(FF_vs_Count, aes(x=FF_vs_Count$`T 0...19`, y=FF_vs_Count$`T 0...6`)) +
  stat_density_2d(aes(fill = ..density..), geom = "raster", contour = FALSE) +
  scale_fill_distiller(palette= 4, direction=1, limits= c(0,0.12)) +
  scale_x_continuous(expand = c(0, 0)) +
  scale_y_continuous(expand = c(0, 0)) +
  xlim(0,7.5) +
  ylim(0,7.5) +
  xlab("Number of mitochondria") +
  ylab("Mean form factor") 