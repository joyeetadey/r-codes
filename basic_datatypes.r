rm(list=ls())


#Assign a variable with an integer value
a <- 10L
a
is.integer(a)   #to check whether the value is integer or not


#character type
str <- "R programming"
s <- 'cse3505 -'

#some useful functions
paste(s,str)
sprintf("%s has scored %d marks","Sita",90)
substr(str,start=5,stop=10)
sub("R","C",str)
str

#complex type
cmp <- 21+10i
sqrt(-1)
sqrt(-1+0i)
sqrt(as.complex(-1))


#logical type
lg <- TRUE   #T
p=TRUE;q=FALSE
p&q;p|q;!p
a>5
a
#Obtain the class and type of the variable

class(a)
typeof(a)
class(str)
typeof(str)
class(cmp)
typeof(cmp)
class(lg)
typeof(lg)

#special number Inf representing infinity
1/0
log(0)  #find natural log. 

#you can represent base value as 2nd argument
log(10,2) #base 2
log(10,10)  #base 10
#log2(10)
#log10(10)
#NaN represents a undefined value (also indicates a missing value)
0/0



##create vectors
x <- 1:20    #always creates an integer vector

#class and length of a vector
class(x)
length(x)

#using c()
x <- c(0.1,0.2)  ##numeric vector
x <- c(TRUE,FALSE)  ##logical vector
x <- c(T,F)  ##logical vector
x <- c("A","B","C")  ##character vector
x <- c(1,2)  ##integer vector
x <- c(1+2i,3)  ##complex vector

#using vector()
x <- vector("numeric",length = 10)
x



#Implicit type coercion - mixed objects
y <- c(1.5,"a")    #character
y
y <- c(1.5,TRUE)   #numeric
y <- c(TRUE,"a")   #character  
y

#Explicit type coercion
x <- 2.5
class(x)
as.integer(x)

x <- 0:5
as.numeric(x)
as.logical(x)
as.character(x)
as.complex(x)

#Non-sensical coercion results in NAs
x <- c('a','b','c')
as.numeric(x)
as.logical(x)

#vector arithmetics
x <- c(1,3,5)
y <- c(2,4,6)
x+y
x-y
x*y
x/y
help(options)
options(digits=2)

#recycling rule
y <- c(4,5,6,7,8)
x+y

#create matrices
m <- matrix(nrow=3,ncol=2)
m
attributes(m)
dim(m)

m <- matrix(1:6,nrow=3,ncol=2)  #constructed column-wise
m

#constructing from vector
m <- 1:6
dim(m) <- c(3,2)
m

#constructing using column-binding
x <- 1:3
y <- 10:12
cbind(x,y)

#constructing using row-binding
rbind(x,y)

#matrix multiplication
x <- matrix(c(1,2,3,4),nrow=2,ncol=2)
y <- matrix(c(10,10,10,10),nrow=2,ncol=2)
x
y
x*y  #does element-wise multiplication
x%*%y  #does matrix multiplication  

#similarly, use x%/%y for matrix division. Otherwise, it does element-wise division

x
t(x)    #transpose of a matrix
solve(x)  #inverse of a matrix
det(x)    # determinant of a matrix

#creating a List
x <- list(1,'a',TRUE,1+3i,6.7,c(10,20,30))
x

#factors
x <- factor(c("male","female"))
x
table(x)
unclass(x)

#missing values
x <- c(1,2,NA,5,6)
is.na(x)
is.nan(x)
