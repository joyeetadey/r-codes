rm(list=ls())

data <- mtcars
head(data,3)
dim(data)

library(dplyr)
train = sample_n(data,15)
set.seed(123)
train_ind <- sample(seq_len(nrow(data)), 15)
train <- data[train_ind,]
test <- data[-train_ind,]

x = train$wt
y = train$mpg
plot(x,y,main='scatter plot',col='red')

lmodel <- lm(y~x)
abline(lmodel,col='red')

summary(lmodel)

result <- predict(lmodel,test)
head(result,3)




df <- read.table("C:/Users/Joyeeta/Desktop/sem6/da_lab/data.csv",header=TRUE,sep=",")
head(df,3)

train <-  sample_n(df,200)
head(test,3)
x = train$Height
y = train$Weight
plot(x,y,main='scatter plot')
cor.test(x,y)
lmodel <- lm(y~x)
abline(lmodel,col='red')
summary(lmodel)

test <- sample_n(df,10)
result <- predict(lmodel,test)
head(result,3)