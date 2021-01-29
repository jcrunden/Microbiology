library(tidyverse)

#set working directory
setwd("Z:/Julia Crunden/Results/Plate Reader/Optimising Cys + Met concentrations for Met3p repressor strain/2020-10-23/Comparison of nitrogen source for Radicicol potency")

#read in the file
df <- read.csv("465 AS.txt", header=TRUE, sep="\t")

#This prints a line plot of df2 with OD against time and with each Sample name as a different name
ggplot(df, aes(x= time, y= Mean.OD)) +
geom_errorbar(df, mapping = aes(ymin=Mean.OD-SD,ymax=Mean.OD-SD)) +
geom_line(df, mapping = aes(y=Mean.OD)) +
#turns the x acis labels 90 degrees so they aren't overlapping
theme(axis.text.x = element_text(angle = 90, vjust = 0.5)) +
# changes the X axis scale. From 0 to 48 in increments of 12
scale_x_continuous(breaks = seq(0, 48, by = 12)) +
#labels the x axis 
labs(x = "Time (hours)", y = "OD")

#Saves a png file of the plot    
ggsave("465 AS mean  + SD.png", width = 10, height = 5, dpi = 600)

  