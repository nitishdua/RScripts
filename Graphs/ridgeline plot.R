library(ggridges)
library(ggplot2)
ggplot(Book, aes(x = df$`Values (1)`, y = df$`Time (1)`, fill = df$`Time (1)`)) +
  geom_density_ridges() +   
  theme_ridges() + 
  theme(legend.position = "none") +
  xlab("Mean form factor") +
  ylab("Frequency") +
  xlim(0,5)


ggplot(Book4, aes(y=Book4$Strain, x=Book4$Values,  fill=Values)) +
  geom_density_ridges(alpha=0.6, stat="binline", bins=10, color = "white", fill = "9") +
   theme_ridges() +
  theme(
    legend.position="none",
    panel.spacing = unit(1, "lines"),
    strip.text.x = element_text(size = 8)
    ) +
  xlab("Length") +
  ylab("Assigned Probability (%)")