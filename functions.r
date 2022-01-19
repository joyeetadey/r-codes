#function name <- function(arg1,arg2,..argn){
#}


cubeseq <- function(n){
  for(i in 1:n){
    print(i^3)
  }
}
cubeseq(3)

f <- function(a, b) {
  print(a)
  print(b)
}
f(2,3)

# lexical scoping
make.power <- function(n) {
  pow <- function(x) {
    x^n
  }
  pow
}
cube <- make.power(3)
cube(3)
square <- make.power(2)
square(4)

#dynamic scoping
y <- 10
f <- function(x) {
  y <- 2
  y^2 + g(x)
}
g <- function(x) {
  x*y
}
f(3)

f1 <- function(a,b){
  print(a)
  print(b)
  a^b
}

f1(2,3)  #function call with positional arguments
f1(2)   #lazy evaluation
f1(b=2,a=3)  #function call with name arguments

#function and default arguments
f1 <- function(a,b=2){
  a^b
}
f1(2)
f1(2,3)


name <- c("Anu","Banu","Ravi")
sub1 <- c(78,80,85)
sub2 <- c(40,55,60)
df1 <- data.frame(name,sub1,sub2)

library(dplyr)

update_df <- function(df){
  df <- df%>%
    mutate(result=ifelse(sub1>=50 & sub2>=50,"pass","fail"))
  return(df)
  
}
df1 <- update_df(df1)
df1

sqrt(4)


x <- list(a = 1:5, b = rnorm(10))
lapply(x, mean)

rnorm(10)

x <- list(a = 1:4, b = rnorm(10), c = rnorm(20, 1), d = rnorm(100, 5))
lapply(x, mean)

x <- 1:4
lapply(x, runif)

x <- list(a = matrix(1:4, 2, 2), b = matrix(1:6, 3, 2))
x

lapply(x, function(elt) elt[,1])

x <- matrix(10:20,4)
x
apply(x, 2, mean)

apply(x, 1, sum)

rowSums = apply(x, 1, sum)
rowSums

x <- matrix(rnorm(200), 20, 10)
apply(x, 1, quantile, probs = c(0.25, 0.75))


library(datasets)
head(airquality)

