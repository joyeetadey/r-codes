gdp <- read.table("C:/Users/Joyeeta/Desktop/sem6/da_lab/gdp.csv",header=TRUE,sep=",")
head(gdp,3)

library(forecast)
library(tseries)

gdpts <- ts(gdp$GDP_gr,start=min(gdp$Year),end=max(gdp$Year),frequency = 1)
gdpts
class(gdpts)
plot(gdpts)
acf(gdpts)
pacf(gdpts)
adf.test(gdpts)
gdpmodel=auto.arima(gdpts,ic="aic",trace=TRUE)

gdpdf=forecast(gdpmodel,level=c(95),h=20)
gdpdf

plot(gdpdf)

Box.test(gdpdf$resid, lag=5, type= "Ljung-Box")
Box.test(gdpdf$resid, lag=15, type= "Ljung-Box")
Box.test(gdpdf$resid, lag=25, type= "Ljung-Box")

accuracy(gdpmodel)


gold <- read.table("C:/Users/Joyeeta/Desktop/sem6/da_lab/gold.csv",header=TRUE,sep=",")
head(gold,3)

goldpts <- ts(gold$Price,start=min(gold$Month),end=max(gold$Month),frequency = 1)
class(goldpts)
plot(goldpts)
acf(goldpts)
pacf(goldpts)
adf.test(goldpts)

goldmodel=auto.arima(goldpts,ic="aic",trace=TRUE)

golddf=forecast(goldmodel,level=c(95),h=15)
golddf

plot(golddf)

accuracy(goldmodel)