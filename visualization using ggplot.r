rm(list=ls())
data("mtcars")

#install.packages("ggplot2")
library(ggplot2)
head(mtcars,2)
#scatter plot
ggplot(data=mtcars, mapping=aes(x=wt,y=mpg))+geom_point()


unique(mtcars$cyl)
cyl_factor <- factor(mtcars$cyl,levels = c(4,6,8),labels = c("4cyl","6cyl","8cyl"))

unique(mtcars$gear)
gear_factor <- factor(mtcars$gear,levels = c(3,4,5),labels = c("3 gears","4 gears", "5 gears"))

#scatter plot - multiple variables through color
ggplot(mtcars,aes(x=wt,y=mpg,color=gear_factor))+geom_point()

#scatter plot - multiple variables through size
ggplot(mtcars,aes(x=wt,y=mpg,size=qsec))+geom_point()

#scatter plot - multiple variables through both color and shape
ggplot(mtcars,aes(x=wt,y=mpg,shape=gear_factor))+geom_point(aes(color=cyl_factor,size=4))+geom_point(color="grey",size=1.5)

ggplot(mtcars,aes(x=wt,y=mpg,shape=gear_factor))+geom_point(aes(color=cyl_factor,size=4))+geom_point(color="grey",size=1.5)

#scatter plot- adding best fit line
ggplot(mtcars, aes(x=wt,y=mpg))+geom_point()+geom_smooth(method="lm")

###########bar plot  ###########
ggplot(mtcars, aes(x=gear_factor))+geom_bar() 
ggplot(mtcars, aes(x=gear_factor,fill=gear_factor,color="red"))+geom_bar() +ggtitle("frquency plot of gear")

#flipping the bar direction
ggplot(mtcars, aes(x=gear_factor))+geom_bar()+coord_flip()

#bar plot for 2 variables
ggplot(mtcars, aes(x=cyl_factor,fill=gear_factor))+geom_bar(position='stack')

####################  pie chart   ############
ggplot(mtcars, aes(x="",y=mpg,fill=cyl_factor))+geom_bar(width = 1,stat='identity')+coord_polar("y",start = 0)

####################  histogram   ###########
ggplot(mtcars,aes(x=hp))+geom_histogram()+labs(title = "Distribution of hp",y='frequency')

#setting bin size
ggplot(mtcars,aes(x=hp))+geom_histogram(bins = 3)+labs(title = "Distribution of hp",y='frequency')

#setting bin width
ggplot(mtcars,aes(x=hp))+geom_histogram(binwidth = 30)+labs(title = "Distribution of hp",y='frequency')

#with border and fill color
ggplot(mtcars,aes(x=hp))+geom_histogram(binwidth = 30,color='green',fill='yellow')+labs(title = "Distribution of hp",y='frequency')

#facets 
ggplot(mtcars,aes(x=hp))+geom_histogram(color="white",fill="blue")+labs(title = "Distribution of hp",y='frequency')+facet_wrap(cyl_factor,ncol=1)


################ Kernel density curve   ############
ggplot(mtcars, aes(x=hp))+geom_density()+labs(title="Distribution of hp",x="horse power",y='density')

#with fill color
ggplot(mtcars, aes(x=hp))+geom_density(fill='blue',color='red')+labs(title="Distribution of hp",x="horse power",y='density')


##############  Line plot ###############
library(dplyr)
d <- sample_n(mtcars,10)
ggplot(d,aes(x=wt,y=drat))+geom_line()
d

#with varied thickness and color points
ggplot(d,aes(x=wt,y=drat))+geom_line(aes(size=2,color='red'))+geom_point(aes(size=2,color='blue'))

################# box plot  ################
ggplot(mtcars, aes(x=mpg))+geom_boxplot()


#multiple box plots
ggplot(mtcars, aes(x=cyl_factor,y=mpg))+geom_boxplot()
