rm(list=ls())
library(help=graphics)
data("airquality")
str(airquality)

#to set the margin
par(mar=c(2,2,2,2))  

#1D scatter plot
plot(airquality$Ozone)

#2D scatter plot
plot(airquality$Ozone,airquality$Wind)

?plot

#type argument in plot
plot(airquality$Ozone,type="b")

#title and axis labels arguments
plot(airquality$Ozone,main = "ozone levels",xlab = "index",ylab = "ozone")
par(mar=c(4,4,2,1)+0.1)


#bar plot
barplot(airquality$Ozone,main = "ozone levels", ylab = "ozone values")

#horiz parameter in bar plot
barplot(airquality$Ozone,main = "ozone levels", xlab = "ozone values",horiz = TRUE)

#histogram
hist(airquality$Solar.R)


#boxplot
summary(airquality$Ozone)
boxplot(airquality$Ozone)

#multiple boxplot
boxplot(airquality[,1:4],main="multiple box plots")


#pie chart
unique(airquality$Wind)
table(airquality$Wind)

wind_freq <- table(airquality$Wind)
wind_above8 <- wind_freq>8
wind_freq
wind_above8
wind_above8data <- wind_freq[wind_above8]
wind_above8data
table(wind_above8)
pie(wind_above8data,radius=5)


#grid of charts
par(mfrow=c(2,3),mar=c(2,5,2,1),las=0, bty="n")
plot(airquality$Ozone)
plot(airquality$Ozone,airquality$Wind)
plot(airquality$Ozone,type ='l')
barplot(airquality$Ozone, main = 'Ozone levels', ylab = 'ozone value')
hist(airquality$Solar.R)
boxplot(airquality$Ozone)


#lattice graph
library(lattice)

#density plot
densityplot(airquality$Ozone)

#scatter plot matrix
splom(airquality[c(1,3,4)])


#scatter plot depicting the combination of 2 variables
data("mtcars")
df <- mtcars
str(df)

unique(df$cyl)
cyl_factor <- factor(df$cyl,levels = c(4,6,8),labels = c("4cyl","6cyl","8cyl"))

unique(df$gear)
gear_factor <- factor(df$gear,levels = c(3,4,5),labels = c("3 gears","4 gears", "5 gears"))

xyplot(df$mpg~df$wt|cyl_factor*gear_factor,main="scatter plots: Cylinders and Gears",xlab = "weight of car",ylab = "miles per gallon")


freq_gear <- table(gear_factor)
barplot(freq_gear,col=c("red","green","blue"))
pie(freq_gear,labels=c("3 gears","4 gears", "5 gears"),col=c("red","green","blue"),radius=5)
