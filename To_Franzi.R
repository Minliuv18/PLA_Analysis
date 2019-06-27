###Use ggplot2 to draw a boxplot with dots####
library(ggplot2)
colourCount = length(unique(group))
getPalette = colorRampPalette(brewer.pal(9, "Set1"))

ggplot(d, aes(x = sample, y = number, color = factor(x.ray),fill = sample)) +
  scale_fill_manual(values = c("#8dd3c7","#ffffb3","#bebada","#fb8072","#80b1d3")) +
  scale_color_manual(values = c("#e41a1c", "#377eb8","#4daf4a")) +
  geom_boxplot(outlier.shape = NA) +
  ylim(NA,20) +
  geom_point(position=position_jitterdodge(jitter.height = 0.5,dodge.width = 0.75), alpha=0.25) +
  labs(title = "Figure of dots in cell by different treatment",
       x = " Treatment(Sample + X-ray)", 
       y = " Number of Dots",
       fill = "Samples",
       color= "X-ray") +
  theme(plot.title = element_text(hjust = 0.5, size = 20, face = "bold"),
        axis.title.x = element_text(hjust = 0.5, size = 15),
        axis.title.y = element_text(hjust = 0.5, size = 15),
        axis.text.x = element_text(size = 5),
        axis.text.y = element_text(size = 10),
        legend.text = element_text(size = 8),
        legend.position = "right", 
        legend.margin = margin(0.1, 0.1, 0.1, 0.1, "cm"),
        legend.box.margin = margin(0.5,0.5,0.5,0.5,"cm"))