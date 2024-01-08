library(ggplot2)
library(ggrepel)

HvsD$diffexpressed <- "NO"
HvsD$diffexpressed[HvsD$logFC > 0.5 & HvsD$log10pvalue >1] <- "UP"
HvsD$diffexpressed[HvsD$logFC < -0.5 & HvsD$log10pvalue >1] <- "DOWN"
HvsD$delabel <- NA
HvsD$delabel[HvsD$diffexpressed != "NO"] <- HvsD$Labels[HvsD$diffexpressed != "NO"]
p <- ggplot(data=HvsD, aes(x=HvsD$logFC, y=HvsD$log10pvalue, col=HvsD$diffexpressed, label=HvsD$delabel)) +
  geom_point() + 
  theme_minimal() +
  geom_text_repel()
p2 <- p + geom_vline(xintercept=c(-0.5, 0.5), col="red") +
  geom_hline(yintercept=1, col="red")+ xlim(-15,15)+ylim(0,10)
p3 <- p2 + scale_color_manual(values=c("#00CCCC", "black", "#FF00FF"))
p4 <- p3 + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), axis.line = element_line(colour = "black"))

