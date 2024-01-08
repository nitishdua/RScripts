library(ggridges)
library(ggplot2)
ggplot(Number_of_buddings, aes(x = Value, y = Strain, fill = Plasmid)) +
  geom_density_ridges(alpha=0.4, panel_scaling = TRUE, scale =1) +   
  scale_fill_manual(values = c("#FF0099", "#000000"))+
  theme_ridges() + 
  theme(legend.position = "none") +
  xlab("Mean form factor") +
  ylab("Frequency")
