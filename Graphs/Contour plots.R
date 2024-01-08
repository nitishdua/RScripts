library(tidyverse)
ggplot(FF_vs_Count, aes(x=FF_vs_Count$`EV 0...14`, y=FF_vs_Count$`EV 0...1`) ) + geom_point()

ggplot(FF_vs_Count, aes(x=`EV 0...14`, y=`EV 0...1`) ) +
  geom_bin2d() +
  theme_bw()

ggplot(FF_vs_Count, aes(x=FF_vs_Count$`T 0...19`, y=FF_vs_Count$`T 0...6`) +
  stat_density_2d(aes(fill = ..level..), geom = "polygon") + xlim(0,6)

  ggplot(FF_vs_Count, aes(x=FF_vs_Count$`EV 8...18`, y=FF_vs_Count$`EV 8...5`)) +
    stat_density_2d(aes(fill = ..level..), geom = "polygon") + ylim(0,6)