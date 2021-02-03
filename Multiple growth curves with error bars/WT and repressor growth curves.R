library(tidyverse)

#set working directory
setwd("Z:/Julia Crunden/Results/Plate Reader/Optimising Cys + Met concentrations for Met3p repressor strain/2020-11-01/Growth curves of WT and repressors")

#read in the file. Check.names allows a column name to start with a number. To name a df with a number, you need to use`` around it.
`465` <- read.csv("465 Mean + SD growth curve.txt", header=TRUE, sep="\t", check.names=FALSE)
`466` <- read.csv("466 Mean + SD growth curve.txt", header=TRUE, sep="\t", check.names=FALSE)
`1572` <- read.csv("1572 Mean + SD growth curve.txt", header=TRUE, sep="\t", check.names=FALSE)
`1573` <- read.csv("1573 Mean + SD growth curve.txt", header=TRUE, sep="\t", check.names=FALSE)

#Converts YSD column type from numeric to character
`465`$YSD <- as.character(`465`$YSD)
`466`$YSD <- as.character(`466`$YSD)
`1572`$YSD <- as.character(`1572`$YSD)
`1573`$YSD <- as.character(`1573`$YSD)

#This prints a line plot of df with OD against time and with SD error bars. Colour is set by the YSD number
plot <- ggplot(data = `465`, aes(x=Time, y=Mean_OD, colour = YSD)) +
  geom_errorbar(data=`465`, mapping=aes(ymin=Mean_OD-`465_SD`, ymax=Mean_OD+`465_SD`)) +
  geom_line(data=`465`, mapping = aes(y=Mean_OD)) +
  #turns the x axis labels 90 degrees so they aren't overlapping
  theme(axis.text.x = element_text(vjust = 0.5)) +
  # changes the X axis scale. From 0 to 48 in increments of 12
  scale_x_continuous(breaks = seq(0, 48, by = 12)) +
  #labels the x axis 
  labs(x = "Time (hours)", y = "OD (600nm)") +
  #Sets the x axis scale text and title text to size 12
  theme(axis.text = element_text(size=12), axis.title = element_text(size=12))
#Adds each new strain in a new layer
plot2 <- plot + 
  geom_errorbar(data=`466`, mapping=aes(ymin=Mean_OD-`466_SD`, ymax=Mean_OD+`466_SD`)) +
  geom_line(data=`466`, mapping = aes(y=Mean_OD))
plot3 <- plot2 + 
  geom_errorbar(data=`1572`, mapping=aes(ymin=Mean_OD-`1572_SD`, ymax=Mean_OD+`1572_SD`)) +
  geom_line(data=`1572`, mapping = aes(y=Mean_OD))
plot4 <- plot3 + 
  geom_errorbar(data=`1573`, mapping=aes(ymin=Mean_OD-`1573_SD`, ymax=Mean_OD+`1573_SD`)) +
  geom_line(data=`1573`, mapping = aes(y=Mean_OD))

print(plot4)

#Saves a png file of the plot    
ggsave("WT and Repressor mean  + SD.png", width = 10, height = 7.5, dpi = 600) 
