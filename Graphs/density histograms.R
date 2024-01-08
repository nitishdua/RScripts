ggplot(Book1) + geom_density(aes(x = Book1$`values 2`, color = Book1$`time 2`), alpha = 0.3, size = 2) +
  xlab("Form factor per mito") +
  ylab("Frequency") +
  xlim(0,10) +
  ylim (0,1) 
  
 