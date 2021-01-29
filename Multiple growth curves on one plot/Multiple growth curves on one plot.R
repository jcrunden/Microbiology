library(tidyverse)

#set working directory
setwd("Y:/Julia Crunden/Results/Plate Reader/Optimising Cys + Met concentrations for Met3p repressor strain/2020-10-23/Comparison of nitrogen source for Radicicol potency")

#read in the file
df <- read.csv("radicicol potency with Am sulf or MSG.txt", header=TRUE, sep="\t")

#This uses tidyr to rearrange the data. 
#Selects the time in seconds which start with X, disregards the X and makes it a column named "time"
#Makes column named OD
#Changes the type of data that the time is, from character to numeric
df2 <- pivot_longer(df, starts_with("X"), names_to = "time", names_prefix = ("X"), values_to = "OD") 
df2$time <- as.numeric(df2$time)
df2
  
#This prints a line plot of df2 with OD against time and with each Sample name as a different name
ggplot(df2, aes(x= time, y= OD, group = Sample)) +
#Sets colour of line to red
geom_line(aes(colour = Sample)) +
#removes legend
theme_light() +
#turns the x acis labels 90 degrees so they aren't overlapping
theme(axis.text.x = element_text(angle = 90, vjust = 0.5)) +
# changes the X axis scale. From 0 to 48 in increments of 12
scale_x_continuous(breaks = seq(0, 48, by = 12)) +
#labels the x axis 
labs(x = "Time (hours)")

#Saves a png file of the plot    
ggsave("Cys and met data.png", width = 10, height = 5, dpi = 600)

  