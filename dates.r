rm(list=ls())

#To create date / To represent date
d <- date()
d 
class(d)

#as.Date(d)
#to convert date string to date class
d <- as.Date("2021-8-25")  #default format -year-month-day
class(d)
as.Date("2021-8-25 10:44:22")
as.Date("2021-8-25 21:15")


#to see the internal representation 
unclass(d)

#to represent both date and time
as.POSIXct("2021-8-25")
pd <- as.POSIXct("2021-8-25 21:15")
pd
class(pd)
unclass(pd)

pd <- as.POSIXlt("2021-8-25")
pd
class(pd)

#getting meta using unclass()
unclass(pd)
names(unclass(pd))

pd <- as.POSIXlt("2021-8-25 21:15:30")
pd$sec
pd$hour
pd$min
pd$mday
pd$year
unlist(pd)

#if format is different
as.Date("25/8/2021",format="%d/%m/%Y")
date()
as.Date("August 25,2021",format="%B %d,%Y")
as.Date("25Aug21",format="%d%b%y")

#class
class(as.Date("2021-8-25 21:15"))
class(as.POSIXct("2021-8-25 21:15"))
class(as.POSIXlt("2021-8-25 21:15"))


#Getting date, time and zone
p <- Sys.Date()  #only current date
class(p)
Sys.time()  #current date, time and timezone
Sys.timezone()

#difference in dates
Sys.Date()-as.Date("1979-03-21")
difftime(Sys.Date(),as.Date("1979-03-21"),units = "weeks")


#getting weekdays and basic arithmetic
d <- as.Date("2021-8-25")
d
#to find weekday of the date
weekdays(d)

#add or subtract to create new date(s)
d+1
d+1:5
weekdays(d+1:5)

#check for seq and rep
#using sequence
d
dt <- seq(d,by="2 months",length.out = 6)
dt

#getting month and quarter
months(d)
months(dt)
quarters(dt)

#lubridate::today() #lubridate package
#ISOdate(2021,8,25)

?strftime
help("strftime")

datestring<-"August 25, 2021 04:20"
convertedForm<-strptime(datestring,"%B %d, %Y %H:%M")
class(convertedForm)
convertedForm

x <- as.Date("2020-01-01")
y <- strptime("25 Aug 2020 09:00:00", "%d %b %Y %H:%M:%S")
x-y

class(x)
class(y)

x <- as.POSIXlt(x)
x-y

#different time zones
x <- as.POSIXct("2021-08-25 08:00:00")
x

xgmt<-as.POSIXct("2021-08-25 08:00:00", tz="GMT")
xgmt

xgmt-x



