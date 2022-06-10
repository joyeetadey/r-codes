 rm(list=ls())
setwd("C:/Users/Joyeeta/Desktop/sem6/da_lab")
data2<-read.csv("USArrests.csv")
head(data2,5)
data2<-data2[,-1]
df1<-scale(data2)

fit1<-kmeans(df1,centers=2)
fit1$cluster
fit1$size
fit1$withinss 
fit1$tot.withinss 
Kmax<-15 
wcss<-rep(NA,Kmax) 
nClust<- list() 

for(i in 1:Kmax){ 
  fit<-kmeans(df1,i) 
  wcss[i]<-fit$tot.withinss 
  nClust[[i]]<-fit$size 
  } 
plot(1:Kmax,wcss,type="b",pch=19) 
fit<-kmeans(df1,centers=4) 
fit$cluster 
fit$size 
fit$center 

library(factoextra) 
fviz_nbclust(df1, kmeans, method = "wss") 
fviz_cluster(fit, data2) 

library(cluster) 
fitm <- pam(df1, 4, metric = "manhattan") 
fitm 
fitm$medoids 
fviz_cluster(fitm, data2)