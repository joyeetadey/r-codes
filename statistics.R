#reference-http://www.r-tutor.com/elementary-statistics
rm(list=ls())
#Statistics on qualitative data
library(MASS)
head(painters)
str(painters)

#apply the table function to compute the frequency distribution of a variable
sch_freq=table(painters$School)
sch_freq
sort(sch_freq,decreasing = TRUE)   #mode

str(painters)

cbind(sch_freq)

#relative frequency=frequency/samplesize
samplesize=nrow(painters)
sch_relfreq=sch_freq/samplesize
sch_relfreq

cbind(sch_relfreq)

#to find the mean composition of a school
sch=painters$School
c_sch=sch=="C"
head(sch)  
head(c_sch)
c_painters=painters[c_sch,]
head(c_painters)
str(c_painters)

mean(c_painters$Composition)

#using dplyr package
library(dplyr)
painters %>%
  filter(School=='C')%>%
  summarize(mn=mean(Composition))


old=options(digits=2)
#use tapply to find mean composition of all schools at once
mean_comp=tapply(painters$Composition,painters$School,mean)
mean_comp

#using dplyr package
painters %>%
  group_by(School)%>%
  summarize(mn=mean(Composition))


#finding which school has the maximum mean composition
max(mean_comp)
which.max(mean_comp)

#using dplyr package
painters %>%
          group_by(School)%>%
          summarise(mn=mean(Composition))%>%
          arrange(desc(mn))%>%
          head(1)



#Find the percentage of painters whose color score is equal to or above 14.
str(painters)
cl_score=painters$Colour>=14
head(cl_score)

tot=nrow(painters)
painter_clscore=painters[cl_score,]  #boolean indexing
sz=nrow(painter_clscore)
per_painter=(sz/tot)*100
per_painter

#using dplyr package
c14 <- painters %>%
  filter(Colour>=14)
c14perr <- nrow(c14)/nrow(painters)*100  
c14perr


#Statistics on quantitative data
head(faithful)

#find the range of values in eruptions
duration=faithful$eruptions
range(duration)

#create a sequence of equal distance break points
breaks=seq(1.5,5.5,by=0.5)
breaks

#Classify the eruption durations according to the half-unit-length sub-intervals with cut.
duration_cut=cut(duration,breaks,right=FALSE)
duration_cut
head(duration,2)

duration_freq=table(duration_cut)
duration_freq
max(duration_freq)
which.max(duration_freq)

#par(mar=c(2,2,2,2))
#hist(duration,right=FALSE)

#compute relative frequency
duration_relfreq=duration_freq/nrow(faithful)
duration_relfreq
cbind(duration_freq,duration_relfreq)

#compute cumulative frequency
duration_cumfreq=cumsum(duration_freq)
cbind(duration_cumfreq)

#compute cumulative relative frequency
duration_cumrel_freq=duration_cumfreq/nrow(faithful)
cbind(duration_cumfreq,duration_cumrel_freq)

#statistics for numerical variable - Descriptive statistics
#central tendency,  measure of spread
mean_erup=mean(duration)
mean_erup

med_erup=median(duration)
med_erup

quantile_erup=quantile(duration)
quantile_erup

percentile_erup=quantile(duration, c(.32,.57,.98))
percentile_erup

rangediff_erup=max(duration)-min(duration)
rangediff_erup

IQR_erup=IQR(duration)  #Q3-Q1
IQR_erup

par(mar=c(2,2,2,2))
boxplot(duration,horizontal=TRUE)

var_erup=var(duration)
var_erup

sd_erup=sd(duration)
sd_erup

waiting=faithful$waiting
cov(duration,waiting)

cor(duration,waiting)
erup.lm <- lm(eruptions ~ waiting, data=faithful)
resid <- rstandard(erup.lm)
#resid
par("mar")
par(mar=c(1,1,1,1))
qqnorm(resid,main='Eruptions',xlab="normal score",ylab="std. residuals")
qqline(resid)


library(e1071)
moment(duration,order=3, center=TRUE)
skewness(duration)
kurtosis(duration)


#descriptive statistics
summary(painters)

#descriptive statistics by group
by(painters,painters$School,summary)

