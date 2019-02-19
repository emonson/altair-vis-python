library(ggplot2)

troops <- read.table("minard-troops.txt", header=T)
cities <- read.table("minard-cities.txt", header=T)

plot_troops <- ggplot(troops, aes(long, lat)) +
  geom_path(aes(size = survivors, colour = direction, group = group))
  
plot_both <- troops_plot + 
  geom_text(aes(label = city), size = 4, data = cities)
  
plot_polished <- both + 
  scale_size(to = c(1, 12), 
    breaks = c(1, 2, 3) * 10^5, labels = comma(c(1, 2, 3) * 10^5)) + 
  scale_colour_manual(values = c("grey50","red")) +
  xlab(NULL) + 
  ylab(NULL)

ggsave(plot_troops, file = "minard-troops.pdf", width=12, height=3)
ggsave(plot_both, file = "minard-both.pdf", width=12, height=3)
ggsave(plot_polished, file = "minard-polished.pdf", width=12, height=3)
