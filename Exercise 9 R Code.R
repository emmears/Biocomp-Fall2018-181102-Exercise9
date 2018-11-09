#############EXERCISE 9 ##################

#1. Find some data on two variables that you would expect to be related to each other. 
#These data can come from your own research, your daily life, or the internet. 
#Enter those data into a text ???le or Excel and then save a text ???le, and 
#write a script that loads this text ???le and produces a scatter plot
#of those two variables that includes a trend line.
library(ggplot2)
library(grid)
library(gridExtra)
sibstress = read.csv(file="SiblingStress.csv",header=T,stringsAsFactors = F)
head(sibstress)
s=ggplot(data=sibstress,aes(x=Siblings,y=Stress))
s+geom_point()+coord_cartesian()+stat_smooth(method="lm")


#2. Given the data in "data.txt". Write a script that generates two ???gures that summarize the data.
#First, show a barplot of the means of the four populations.
data= read.table("data.txt",header=TRUE,sep=",",stringsAsFactors = T)
head(data)

i=ggplot(data=data)
iunlabled = i+geom_bar(aes(x=as.factor(region),y=observations), stat ="summary",fun.y="mean")
iunlabled+xlab("Observations")+ylab("Regions")


#Second, show a scatter plot of all of the observations. 
#You may want to "jitter" the points(geom_jitter()) to make it easier to see all of the observations
#within a population in your scatter plot.
j=ggplot(data=data,aes(x=observations, y=region))
j+geom_point(aes(color=as.factor(region)), position = "jitter")+theme_classic()+coord_cartesian()+xlab("Observations")+ylab("Frequency")


#Alternatively, you could also try setting the alpha argument in geom_scatterplot() to 0.1. 


#ANSWER THIS:  Do the bar and scatter plots tell you di???erent stories? Why?

  #The bar plot shows that the averages are very similar between the different regions. 
  #However, the scatter plots shows that there is a greater variation over which the observations exist for each population by region. 
  #Thus, the stories each plot tells are different, which shows why it is important to visualize your data in multiple ways for proper and thorough analysis. 
