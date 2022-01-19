# if condition
x <- 10
if(x>5){
  print(paste(x,"is greater than 5"))
}
# if(cond){
  #body
#}

#if-else condition
if(x>100){
  print(paste(x,"is greater than 100"))
}else{
  print(paste(x,"is not greater than 100"))
}

if(x>100){
  y <- 1
}else{
  y <- 0
}
y

#---------OR----------

y <- if(x>1){
  1
}else{
  0
}
y

#ifelse (cond, stmt-yes,stmt-no)
ifelse(x<5,paste(x,"is greater than 5"),paste(x,"is not greater than 5"))

#if-else if
if(x<0){
  print(paste(x,"is a -ve integer"))
}else if(x>0){
  print(paste(x,"is a +ve integer"))
}else{
  print(paste(x,"is zero"))
}

#switch
x <- 3
switch(x,
       "1"="hello",
       "2"="to",
       "3"="Joyeeta's",
       "4"="world")
#----------- OR -------------

switch(x,
       "hello",
       "hii",
       "howdy",
       "bonjour",
       "go away")

## for loop
v <- 10:15
v

#########
length(v)
seq(length(v))
#########

# using indexes
for (i in seq(length(v))){
  print(v[i]*2)
}

#for each loop
for(i in v){
  print(i)
}

m <- matrix(1:6,2) #values, numrows
m

for(i in seq(nrow(m))){
  print('rows',i)
  for(j in seq(ncol(m))){
    print(m[i,j])
  }
}

# while statement
i <- 1 # loop variable initialization
while(i<5){ # condition for loop variable
  print(i*2)
  i=i+1 # update loop variable
}

#break - forced termination of loop
v <- 10:15
for(i in v){
  print(i)
  if(i==12){
    print("found")
    break
  }
}

#next - equivalent to continue
for(i in v){
  if(i==12){
    print("next")
    next #skip this statement in this body and continue the loop
  }
  print(i)
}

# repeat - repeat the body till break is used
i=1
repeat{
  print(v[i])
  if(v[i]==12){
    print("found")
    break
  }
  i=i+1
}

# ifelse in dataframe
number <- c(-1,-2,0,1,2)
df1 <- data.frame(number)
df1

library(dplyr)
df1 <- df1 %>%
  mutate(category=ifelse(df1$number>=0,"+ve","-ve"))

df1

# nested ifelse in dataframe
df1 %>%
  mutate(category=ifelse(number < 0,"-ve",ifelse(number==0,"zero","+ve")))

name <-  c("Joyeeta","Shopto","Reba","Bablu")
sub1 <- c(98,78,45,67)
sub2 <- c(100,54,49,35)
df2 <- data.frame(Names=name,Maths=sub1,English=sub2)
df2

total <- df2$Maths +df2$English
total
df2 <- cbind(df2,total)

avg <- total/2
df2 <- cbind(df2,avg)

df2

df2 <- df2 %>%
  mutate(grades_Maths = ifelse(avg>90,"A",ifelse(avg>70,"B",ifelse(avg>50,"C","Fail"))))

#### OR ######

df2%>%
  mutate(grade=ifelse(avg %in% 90:100,"S",
                      ifelse(avg %in% 80:89, "A",
                             ifelse(avg %in% 70:79,"B",
                                    ifelse(avg %in% 60:69, "C",
                                           ifelse(avg %in% 50:59, "D","E"))))))

