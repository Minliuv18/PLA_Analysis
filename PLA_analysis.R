####Boxplot for PLA####

### Modify the orginal data####
# REWRITE the data file with only four coloumn, 
  # 1st for number(how many dots in one cell; numeric)
  # 2nd for sample(CDD1 : CDD7; factor)
  # 3rd for x-ray treatment (0,2,8; factor)
  # 4th for group (paste of sample and group, such as CDD1_0, CDD7_8; factor)

###Set work directory####
setwd("/home/mingzhi/Desktop/PLA")
list.files()
d <- read.csv("DATA_BY_ML.csv", header = TRUE, sep = ",", dec = ".")
attach(d)
head(d)
names(d)


###Use base R package to draw a boxplot with dots####
plot(number ~ group, lwd = 2)
stripchart(number ~ group, vertical = TRUE, method = "jitter", add = TRUE, pch = 20, col = "blue")


###Use ggplot2 to draw a boxplot with dots####
library(ggplot2)
colourCount = length(unique(group))
getPalette = colorRampPalette(brewer.pal(9, "Set1"))

ggplot(d, aes(x = group, y = number, color = factor(x.ray),fill = sample)) +
  #scale_fill_manual(values = getPalette(colourCount)) +
  #scale_fill_brewer(palette = "Dark2") +
  scale_fill_manual(values = c("#8dd3c7","#ffffb3","#bebada","#fb8072","#80b1d3")) +
  scale_color_manual(values = c("#e41a1c", "#377eb8","#4daf4a")) +
   geom_boxplot(outlier.shape = NA) +
  ylim(NA,20) +
  geom_jitter(position = position_jitter(width = 0.3, height = 0.2), shape = 16, cex = 0.5) +
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


###Use ggplot2 to draw a violin plot####
ggplot(d, aes(x = group, y = number, fill = sample, color = factor(x.ray))) + 
  scale_fill_manual(values = c("#8dd3c7","#ffffb3","#bebada","#fb8072","#80b1d3")) +
  scale_color_manual(values = c("#e41a1c", "#377eb8","#4daf4a")) + # could be palette or scale_fill-grey() or fill_manual
  geom_violin(trim = TRUE) + # trim the tail or not, default is TRUE
  geom_boxplot(width = 0.1) +#, fill = "white") 
  labs(title = "Figure of dots in cell by different treatment",
       x = " Treatment(Sample + X-ray)", 
       y = " Number of Dots",
       fill = "Samples",
       color= "X-ray") +
  theme(plot.title = element_text(hjust = 0.5, size = 20, face = "bold"),
        axis.title.x = element_text(hjust = 0.5, size = 15),
        axis.title.y = element_text(hjust = 0.5, size = 15),
        axis.text.x = element_text(size = 10),
        axis.text.y = element_text(size = 10),
        legend.text = element_text(size = 8),
        legend.position = "right", 
        legend.margin = margin(0.1, 0.1, 0.1, 0.1, "cm"),
        legend.box.margin = margin(0.5,0.5,0.5,0.5,"cm")) 

###Print Figures####
png(filename = "PLA_box.png", units = "in", 
    width = 12, height = 10, res = 300)


ggplot(d, aes(x = group, y = number, color = factor(x.ray),fill = sample)) +
  scale_fill_manual(values = c("#8dd3c7","#ffffb3","#bebada","#fb8072","#80b1d3")) +
  scale_color_manual(values = c("#e41a1c", "#377eb8","#4daf4a")) +
  geom_boxplot(outlier.shape = NA) +
  ylim(NA,20) +
  geom_jitter(position = position_jitter(width = 0.3, height = 0.2), shape = 16, cex = 0.5) +
  labs(title = "Figure of dots in cell by different treatment",
       x = " Treatment(Sample + X-ray)", 
       y = " Number of Dots",
       fill = "Samples",
       color= "X-ray") +
  theme(plot.title = element_text(hjust = 0.5, size = 20, face = "bold"),
        axis.title.x = element_text(hjust = 0.5, size = 15),
        axis.title.y = element_text(hjust = 0.5, size = 15),
        axis.text.x = element_text(size = 10),
        axis.text.y = element_text(size = 10),
        legend.text = element_text(size = 8),
        legend.position = "right", 
        legend.margin = margin(0.1, 0.1, 0.1, 0.1, "cm"),
        legend.box.margin = margin(0.5,0.5,0.5,0.5,"cm")) 
dev.off()

png(filename = "PLA_violin.png", units = "in", 
    width = 12, height = 10, res = 300)

ggplot(d, aes(x = group, y = number, fill = sample, color = factor(x.ray))) + 
  scale_fill_manual(values = c("#8dd3c7","#ffffb3","#bebada","#fb8072","#80b1d3")) +
  scale_color_manual(values = c("#e41a1c", "#377eb8","#4daf4a")) + # could be palette or scale_fill-grey() or fill_manual
  geom_violin(trim = TRUE) + # trim the tail or not, default is TRUE
  geom_boxplot(width = 0.1) +#, fill = "white") 
  labs(title = "Figure of dots in cell by different treatment",
       x = " Treatment(Sample + X-ray)", 
       y = " Number of Dots",
       fill = "Samples",
       color= "X-ray") +
  theme(plot.title = element_text(hjust = 0.5, size = 20, face = "bold"),
        axis.title.x = element_text(hjust = 0.5, size = 15),
        axis.title.y = element_text(hjust = 0.5, size = 15),
        axis.text.x = element_text(size = 10),
        axis.text.y = element_text(size = 10),
        legend.text = element_text(size = 8),
        legend.position = "right", 
        legend.margin = margin(0.1, 0.1, 0.1, 0.1, "cm"),
        legend.box.margin = margin(0.5,0.5,0.5,0.5,"cm")) 

dev.off()
