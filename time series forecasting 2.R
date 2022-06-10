library(dplyr)
library(ggplot2)
library(ggcorrplot)
library(forecast)
library(tseries)

df <- read.table("C:/Users/Joyeeta/Desktop/sem6/da_lab/weatherdata.csv",header=TRUE,sep=",")
head(df,3)
min(df$Formatted.Date)
max(df$Formatted.Date)
df <- na.omit(df)
dim(df)
str(df)

corr <- cor(df[, c(4:9,11)])
corr
ggcorrplot(corr, hc.order = TRUE,lab = TRUE)

df$Formatted.Date <- as.POSIXct.Date(df$Formatted.Date)

train <- sample_n(df,500)
mreg <- lm(train$Temperature..C.~train$Apparent.Temperature..C.+train$Humidity)
mreg
summary(mreg)
plot(mreg,1)

# ARIMA model
data <- ts(df$Temperature..C., start=as.Date("2016-01-01"), end=as.Date("2016-12-31"), frequency=24)
head(data)
plot(data)
adf.test(data)

model=auto.arima(data,ic="aic",trace=TRUE)
accuracy(model)

resultdf=forecast(model,level=c(50),h=24)
resultdf

plot(resultdf)




