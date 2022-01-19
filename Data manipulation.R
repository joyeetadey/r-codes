#clear workspace
rm(list=ls())


loan <- read.csv("loans data.csv")
loan <- read.table("loans data.csv",header = TRUE,sep = ",")

dim(loan)
str(loan)
head(loan,3)
tail(loan,2)
summary(loan)
any(is.na(loan))
sum(is.na(loan))

loan_cln <- na.omit(loan)
nrow(loan)
nrow(loan_cln)

loan_cln2 <- loan[complete.cases(loan),]
nrow(loan_cln2)

#Loading the dplyr package
library(dplyr)

#loading data
data("mtcars")
cars <- mtcars

#dimension of the data
dim(cars)


#structure of the data
str(cars)

#is.na(cars) #NA or NaN 
#checking for missing values
any(is.na(cars))
sum(is.na(cars))
#################### Viewing data  ########################

#fetching top 6 rows
head(cars)

#fetching last 6 rows
tail(cars)

#viewing data
View(cars)

#summary
summary(cars)

cars

#tbl_df(cars)
as_tibble(cars)

glimpse(cars)

############       Subsetting Rows (Observations)   #################

#filtering based on single condition
filter(cars, mpg>25)

#filtering based on multiple condition
dplyr::filter(cars, mpg>25& hp >90)

#Remove duplicate rows
dplyr::distinct(cars)


#Randomly select fraction of rows
dplyr::sample_frac(cars,0.2)

#Randomly select no. of rows
dplyr::sample_n(cars,5)

slice_sample(cars,n=5)


temp <- dplyr::filter(cars,mpg>25)
dplyr::slice_sample(temp,n=2)

dplyr::cars %>%
  dplyr::filter(mpg>25) %>%
  dplyr::slice_sample(n=2)

cars %>%
  dplyr::select(mpg) %>%
  head(3)

library(dplyr)
result <- mtcars %>% 
  group_by(cyl) %>% 
  summarise(meanMPG = mean(mpg))

unique(cars$cyl)

table(cars$cyl)

cars %>%
  dplyr::group_by(cyl)%>%
  dplyr::slice_sample(n=2)

#select rows by position
dplyr::slice(cars,16:20)

############       Subsetting Columns (variables)   #################

#selecting single column
dplyr::select(cars,mpg)

cars %>%
  dplyr::select(mpg)%>%
  head(3)
  #slice_sample(n=3)

#selecting multiple columns
dplyr::select(cars,mpg,cyl,gear)
dplyr::select(cars,c("mpg","cyl","gear"))

names(cars)
#select all columns between a range of columns (inclusive)
dplyr::select(cars,hp:am)



#combining filter and select- using pipe operator
cars %>%
  filter(mpg>18)%>%
  dplyr::select(mpg,cyl)%>% head(3)

names(cars)
#selecting columns starting with 'd'
dplyr::select(cars,starts_with('d'))

#selecting columns ending with 't'
dplyr::select(cars,ends_with('t'))

#selecting columns containing 'g'
dplyr::select(cars,contains('g'))

#selecting columns matching regular expression
dplyr::select(cars,contains('y'))


############       Arranging data   #################

#arrange the data in ascending order of mpg
arrange(cars,mpg)

#arrange the data in descending order of mpg
arrange(cars,desc(mpg))

#arrange the data in order based on more than one column
arrange(cars, mpg,disp)

arrange(cars,mpg,desc(disp))


############       Making new variables   #################

#creating a new column
mutate(cars,newvar=disp-hp )

#combining functions
#create a new variable that sum up disp and hp and filter only
#the rows where mpg>25 & disp>90
#and select only mpg, disp, hp, newvar
cars %>%
  mutate(newvar2=disp+hp)%>%
  filter(mpg>25,disp>90)%>%
  dplyr::select(mpg,disp,hp,newvar2)%>%
  sample_n(2)


############       summarizing data   #################
#Always group_by is used along with summarise. It is applied on categorical value
cars %>%
  group_by(cyl) %>%
  summarize(cnt=n()) #count of unique cyl values

table(cars$cyl)

#computing max, min and standard dev
cars %>%
  group_by(cyl) %>%
  summarize(mx_mpg=max(mpg),mi_mpg=min(mpg),std_mpg=sd(mpg),mn=mean(mpg),md=median(mpg))


