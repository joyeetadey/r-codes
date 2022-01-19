rm(list=ls())

#creating array from vectors
v1 <- c(1,2,3)
v2 <- c(4,5,6,7,8,9)

A1 <- array(c(v1,v2),dim = c(3,3,2))
A1


#naming columns and rows
rname <- c("r1","r2","r3")
cname <- c("c1","c2","c3")
mname <- c("mat1","mat2")
A1 <- array(c(v1,v2),dim = c(3,3,2),dimnames = list(rname,cname,mname))
A1


#printing the second row of second matrix
A1[2,,2]

#printing the second column of first matrix
A1[,2,1]

#printing the element in the 2nd row and 3rd column of second matrix
A1[2,3,2]


#printing the second matrix
A1[,,2]


#Manipulating array elements
M1 <- A1[,,1]
M2 <- A1[,,2]
M3 <- M1+M2
M3

v1 <- c(1,2,3)
v2 <- c(10,20,30)
v3 <- c(100,200,300)

m <- rbind(v1,v2,v3)
m

m1 <- matrix(c(v1, v2, v3), byrow = TRUE,nrow = 3)
m1

m1[,c(1,3)]
typeof(m1)

m2 <- matrix(c(v1,v2,v3),nrow = 3)
m2

df <- data.frame(school = c("SCOPE","SENSE","SCOPE","SELECT"),
                 name = c("Joyeeta","Harsh","Shopto","Reba"),
                 gender = c("F","M","Male","female"),
                 cgpa = c(9.8,9.1,8.44,7.65))
df

df1 <- df$cgpa[df$cgpa>9.0]
df1

df2 <- df$cgpa[df$cgpa<=9.0]
df2

boolv <- df$cgpa>9.0
boolv
df1 <- df[boolv,]

temp1 <- df1%>%
  mutate (result = "pass")

temp1

boolv <- df$cgpa<=9.0
boolv
df2 <- df[boolv,]

temp2 <- df2%>%
  mutate (result = "fail")

temp2

rbind(temp1,temp2)

boolv <- factor(levels = c(TRUE,FALSE),labels = c("P","F"))
boolv

unclass(boolv)

df%>%
 mutate(res = boolv)





df%>%
  mutate(gender = gsub("female|Female","F",gender)) %>%
  mutate(gender = gsub("male|Male","M",gender))

df[,c(1,3)]
df$school
df$gender


library(dplyr)
df%>%
  mutate(updatedCGPA=cgpa+0.2) %>%
  arrange(desc(cgpa))


df%>%
  group_by(gender)%>%
  summarise(avg=mean(cgpa))

df$name
df$cgpa

df%>%
  count(school)

v <- c(97,112,120,122,123,125,127,129,131,136,140,141,142,144,153)
v

iqr <- IQR(v)
iqr
library(ggplot2)
ggplot(v,aes(x=v))+geom_boxplot()



M1
#Aggregation on array elements
apply(M1,1,sum)   #1- along row
apply(M2,2,sum)   #2 -along column
A1
apply(A1,1,sum)
apply(A1,2,mean)
