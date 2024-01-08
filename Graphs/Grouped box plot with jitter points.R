ggplot(Combined_duration, aes(x=Strain, y=Length, fill=Value)) +  
  geom_boxplot(outlier.shape = NA)+ 
  geom_point(position = position_jitterdodge(jitter.width = 0.35, dodge.width = 0.8, jitter.height=0.2), alpha=0.3) 