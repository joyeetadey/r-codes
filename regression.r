rm(list=ls())
install.packages("datarium")
library(datarium)
data("marketing")
str(marketing)
head(marketing)

#suppose we want to predict future sales
#based on the advertising budget spent on youtube

#visualization
library(ggplot2)
par(mar=c(2,2,2,2))
ggplot(marketing,aes(x=youtube,y=sales))+geom_point()
ggplot(marketing,aes(x=youtube,y=sales))+geom_point()+geom_smooth()
ggplot(marketing,aes(x=youtube,y=sales))+geom_point()+geom_smooth(method='lm',se=FALSE)

#finding correlation
cor(marketing$youtube,marketing$sales)

#building a linear model
model <- lm(sales~youtube,data=marketing)
#model <- lm(sales~.,data=marketing)
model
#estimated regression line equation:sales = 8.44+0.048*youtube



#model summary
summary(model)
mean(marketing$sales)
#RSE
sigma(model)   #RSE/mean(marketing$sales)
sigma(model)*100/mean(marketing$sales)  #percentage error
#plot(model,1)


#confidence interval on the model parameters
confint(model)

#confidence interval on the expected outcome
head(marketing)
youtube=200
new_dt <- data.frame(youtube)
conf_int_pt <- predict(model,new_dt,level = .95,interval = "confidence")
conf_int_pt


#prediction interval on a particular outcome
pred_int_pt <- predict(model,new_dt,level = .95,interval = "prediction")
pred_int_pt


#########Diagnostics##########
#Evaluating the linearity assumption
plot(marketing$youtube,marketing$sales)
par(mar=c(2,2,2,2))


#Evaluating the residuals
plot(model,1)

model1 <- lm(log(sales)~youtube,data=marketing)
plot(model1,1)

#********************************************
install.packages('tidyverse')
install.packages('caret')
library(tidyverse)
library(caret)
library(MASS)
#loading Boston housing data in MASS for predicting median house value
data('Boston')
str(Boston)

#split the data into training and test data set
set.seed(123)
train_samples <- Boston$medv %>%
  createDataPartition(p=0.8,list=FALSE)
head(train_samples)
train <- Boston[train_samples,]
test <- Boston[-train_samples,]

#Building a regression model
model <- lm(medv~.,data=train)
summary(model)
#Make predictions
pred <- model %>%
  predict(test)

#model performance
RMSE <- RMSE(pred,test$medv)
RMSE

R2 <- R2(pred,test$medv)
R2

#Evaluating the normality assumption
hist(model$residuals)
qqnorm(model$residuals,ylab = "Residuals")
qqline(model$residuals)
