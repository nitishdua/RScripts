
library(ggplot2)
library(ggforce)
library(ggdist)
library(gghalves)

theme_set(theme_light(base_size = 11))

ggplot(Book1, aes(Strain, Value)) + 
  ggdist::stat_halfeye(adjust = .5, width = .4, .width = 0, justification = -.4, point_color = NA, slab_fill = '#FF0066' , slab_alpha = .4) + 
  geom_boxplot(width = .3, outlier.shape = NA, fatten = 1, lwd =0.5) + 
  geom_jitter(width = .15, alpha = .2, colour = '#FF0066',size = 0.5) +
  ylim(0,7000)+
  theme_bw() +
  theme_classic()


