#Bootcamp Code

library(ape)
library(geiger)
library(ggplot2)

###
#4 Interactive Calculations
2+2

a <- 2+2
a

a <- 2+2; a

a <- 3*(4+5)
a

a <- 2+2
2+2 -> a
a = 2+2
a

x <- 5
y <- 2
z1 <- x*y
z2 <- x/y
z3 <- x^y
z1;z2;z3

z3 <- 2*x^y
z3

A<-3
C<-(A+2*sqrt(A))/(A+5*sqrt(A)); C

C<- A+2*sqrt(A)/A+5*sqrt(A)
C

C <- A + 2*(sqrt(A)/A) + 5*sqrt(A)
C

b <- 12-4/2^3
b

b <- (12-4)/2^3
b

b <- -1^2
b

b <- (-1)^2
b

b <- 12 - (4/(2^3))
b

b <- 12 - 4/(2^3)
b

#4.0.0.0.1 Exercise
# 1
(2^7)/(2^7-1)

#2
(1-(1/(2^7)))^-1

#3
1+0.2

#4
1+0.2+((0.2^2)/2)

#5
1+0.2+(((0.2)^2)/2)+(((0.2)^3)/6)

#6
exp(0.2)

#7
x1 <- 1
x2 <- 2
x <- x1
(1/sqrt(2*pi))*exp((-x^2)/2)

x <- x2
(1/sqrt(2*pi))*exp((-x^2)/2)

dnorm(x=c(1,2))

###
#5 The help system
?foo
help(foo)

??sin
help.search("sin")
RSiteSearch("sin")

?Arithmetic
?log
?sin
?Special

###
#6 A first interactive session
#6.1
###
Light <- c(20,20,20,20,21,24,44,60,90,94,101)
rmax <- c(1.73,1.65,2.02,1.89,2.61,1.36,2.37,2.08,2.69,2.32,3.67)

Light <- 20,20,20,20,21,24,44,60,90,94,101

hist(rmax)

mean(rmax)
exp(mean(log(rmax)))
1/mean(1/rmax)
median(rmax)
min(rmax)
max(rmax)
range(rmax)
sd(rmax)
var(rmax)
quantile(rmax,1)
ecdf(rmax)

plot(rmax~Light)

###
#6.2
###
fit <- lm(rmax~Light)
summary(fit)

abline(fit)

coef(fit)
fitted(fit)
effects(fit)
vcov(fit)
anova(fit)

###
#8
###
install.packages("ggplot2")
install.packages(c("plyr","reshape2"))

install.packages("ggplot2",repos=NULL)

###
#9.1-9.3
###
x <- c(1,3,5,7,9,11)
y <- c(6.5,4.3,9.1,-8.5,0,3.6)
z <- c("dog","cat","dormouse","chinchilla")
w <- c(a=4,b=5.5,c=8.8)

length(x)
mode(y)
mode(z)
names(w)

x<-x+1
xx <- sqrt(x)
x;xx

x+y

#9.1.0.0.1 Exercise
x
y
x%%y
x%/%y
#% results in the residual being stored or passed

###
#9.1.1
###
x <- c(1,2,3)
y <- c(10,20,30,40,50,60)
x+y
y-x

#9.1.1.0.1 Exercise
#An error message is returned.
k <- c(1,2)
x+k

###
#9.1.2
###
1:8
x <- seq(1,8,2);x

x <- seq(1,8);x

#9.1.2.0.1 Exercise
v <- seq(1,13,4);v

#9.1.2.0.2 Exercise
#The sequence is output or stored in reverse.
v <- seq(3,1); v

rep(3,5)
rep(1:3,3)
rep(1:3,each=3)
rep(c(3,4),c(2,5))

z <- c(1,3,5,7,9,11); z[3]
v <- z[c(2,3,4,5)];v
v <- z[2:5]; v

#9.1.3.0.1 Exercise
#The returned values (1,3,5) from the sequence will act as 
#a index calls for the values stored 
#in z.
v <- z[seq(1,5,2)];v
       

v <- z[c(1,2,5)]; v
z[1] <- 12
z[c(1,3,5)] <- c(22,33,44)

w
w["a"]
w[c("c","b")]
w["b"] <- 0
w

#9.1.3.0.2 Exercise
n <- z[c(2,1,3)];n

#9.1.3.0.3 Exercise
#The vector will be extended to the length of the designated index value 
#with interim value being set to NA.
z[9] <- 11

#9.1.3.0.4 Exercise
x <- 1:10
y <- ((x-1)/(x+1));y
plot(x~y)
lines(x,y)

#9.1.3.0.5 Warning: unavoidable imprecision
x <- 1.999999; x; x-2
x <- 1.9999999999999; x; x-2
x <- 1.99999999999999999; x; x-2
###########################

#9.1.3.0.6 Exercise
r <- 0.5
n <- 10
G <- vector(mode="numeric",length = n+1)
G[1] <- 1

for(m in 1:n)
{G[m+1] <- r^m
}
1/(1-r)
sum(G)

r <- 0.5
n <- 50
G <- vector(mode="numeric",length = n+1)
G[1] <- 1

for(m in 1:n)
{G[m+1] <- r^m
}
1/(1-r)
sum(G)

###
#9.1.4 Logical operations
###
a <- 1; b <- 3; 
c <- a < b
d <- (a > b)
c; d

x <- 1:5; b <- (x<=3); b

a=1:3
b=2:4
a==b

a=b
a==b

a <- c(1,2,3,4)
b <- c(1,1,5,5)
(a<b) | (a>3)

(a<b) || (a>3)

#9.1.5.More on vector indexing
lowLight <- Light[Light<50]
lowLightrmax <- rmax[Light<50]
lowLight
lowLightrmax

#9.1.5.0.1 Excercise
#"Light" would be reassigned with only those values that were less than 50.
#This would be problematic as other portions of the code may break due to 
#being incomplete.  For example, the vectors of Light and rmax would no longer
#have the same number of entries leading to errors when lowLightrmax is assigned.
Light2<-Light[Light<50]

Light[Light<50 | rmax <= 2.0]
rmax[Light<50 | rmax <= 2.0]

#9.1.5.0.2 Exercise
n <- 20
randvec <- runif(n)
mean(randvec)
rvecMean <- randvec[randvec<mean(randvec)]

#9.1.5.0.3 Exercise
rvecIndex <- which(randvec<mean(randvec))


x <- c(first=7,second=5,third=2)
names(x)
x["first"]
x[c("third","first")]
x[c('second','first')] <- c(8,9); x

#9.1.5.0.4 Exercise
n<-10
randNum <- runif(n)
#1st option
randOdd1 <- randNum[seq(1,n,2)]
#2nd option
randOdd2 <- randNum[((1:n)%%2)!=0]

###
#9.2 Matrices and arrays
#9.2.1 Creating matrices
X <- matrix(c(1,2,3,4,5,6),nrow=2,ncol=3); X
A <- matrix(1:9,nrow=3,ncol=3,byrow=TRUE); A
matrix(1,nrow=50,ncol=50)

#9.2.1.0.1 Exercise
v <- c(1,1,1,1,2,2,2,2)
X <- matrix(v,nrow=2,ncol=4)
sum

#9.2.1.0.2 Exercise
gausNorm <- rnorm(35,mean=1,sd=2)
gausMatrix <- matrix(gausNorm,nrow=5,ncol=7)

diag(1,5)
A <- matrix(0,3,4)
data.entry(A)

#9.2.2 Creating matrices
C <- cbind(1:3,4:6,5:7); C
D <- rbind(1:3,4:6); D

#9.2.2.0.1 Exercise
rbind(C,D)
cbind(C,C)
cbind(C,D)
#"cbind(C,D)" fails since there are unequal numbers of rows between the two
#matrices.

#9.2.3 Matrix indexing
A[2,2:3];
B <- A[2:3,1:2]; B
first.row <- A[1,]; first.row
second.column <- A[,2]; second.column;
A[1,1] <- 12; A
A[1,] <- c(2,4,5); A
which(A>=8,arr.ind=TRUE)

#9.3 Arrays
X <- array(1:24,dim=c(3,4,2)); X
y <- 1:5; y
z <- array(1:5,dim=5); z
y==z
identical(y,z)
dim(y); dim(z)

#9.3.0.0.1 Exercise
x <- seq(1,27)
dim(x) <- c(3,9)
is.array(x)
is.matrix(x)

#Setting the dimensions transitions to object form being a vector to that of a
#array and/or matrix.

###
#9.6 Data frames
data.url <- "http://kingaa.github.io/R_Tutorial/ChlorellaGrowth.csv"
dat <- read.csv(data.url,comment.char='#')
dat

#9.6.0.0.1 Exercise
hur.url <- "http://kingaa.github.io/R_Tutorial/hurricanes.csv"
datHur <- read.csv(hur.url,comment.char='#')
datHur
str(datHur)

###
#11 Scripts and data files
course.url <- "http://kingaa.github.io/R_Tutorial/"
download.file(paste0(course.url,"Intro1.R"),destfile="Intro1.R",mode="w")
source("Intro1.R")
download.file(paste0(course.url,"Intro2.R"),destfile="Intro2.R",mode="w")
download.file(paste0(course.url,"ChlorellaGrowth.csv"),destfile="ChlorellaGrowth.csv",mode="w")
X <- read.csv("ChlorellaGrowth.csv",comment.char='#')
Light <- X[,1]
rmax <- X[,2]

#11.0.0.0.1 Exercise
download.file(paste0(course.url,"Intro2.R"),destfile="Intro2_1.R",mode="w")
download.file(paste0(course.url,"ChlorellaGrowth.csv"),destfile="ChlorellaGrowth.csv",mode="w")
X <- read.csv("ChlorellaGrowth.csv",comment.char='#')

Light <- X[,1]
rmax <- X[,2]

LogLight=log(Light)
fitRmax <- lm(rmax~LogLight)
summary(fitRmax)
plot(rmax~LogLight,xlab="Log Light intensity (muE/m^2/s)", ylab="Maximum growth rate rmax (1/d)", main="Data from Fussmann et al. (2000) system")
abline(fitRmax,xlab="Log Light intensity (muE/m^2/s)", ylab="Maximum growth rate rmax (1/d)", main="Data from Fussmann et al. (2000) system")

#11.0.0.0.2 Exercise
download.file(paste0(course.url,"Intro2.R"),destfile="Intro2_2.R",mode="w")
plot(fitRmax)
?plot.lm

plot.lm(firRmax,xlab="Log Light intensity (muE/m^2/s)", ylab="Maximum growth rate rmax (1/d)", main="Data from Fussmann et al. (2000) system")

#11.0.0.0.3 Exercise
download.file(paste0(course.url,"Intro2.R"),destfile="Intro2_3.R",mode="w")
plot(rmax~Light,xlab="Light intensity (muE/m^2/s)", ylab="Maximum growth rate rmax (1/d)", main="Data from Fussmann et al. (2000) system",xlim=c(0,120), ylim=c(1,4))

#11.0.0.0.4 Exercise
download.file(paste0(course.url,"Intro2.R"),destfile="Intro2_4.R",mode="w")
par(mfcol=c(2,1))
plot(rmax~Light,xlab="Light intensity (muE/m^2/s)", ylab="Maximum growth rate rmax (1/d)", main="Data from Fussmann et al. (2000) system",xlim=c(0,120), ylim=c(1,4))

plot(log(rmax)~LogLight,xlab="Log Light intensity (muE/m^2/s)", ylab="Log Maximum growth rate rmax (1/d)", main="Data from Fussmann et al. (2000) system")

par(mfcol=c(1,2))
plot(rmax~Light,xlab="Light intensity (muE/m^2/s)", ylab="Maximum growth rate rmax (1/d)", main="Data from Fussmann et al. (2000) system",xlim=c(0,120), ylim=c(1,4))

plot(log(rmax)~LogLight,xlab="Log Light intensity (muE/m^2/s)", ylab="Log Maximum growth rate rmax (1/d)", main="Data from Fussmann et al. (2000) system")

#11.0.0.0.5 Exercise
?par
par(mfcol=c(2,2))

plot(rmax~Light,xlab="Light intensity (muE/m^2/s)", ylab="Maximum growth rate rmax (1/d)", main="Data from Fussmann et al. (2000) system",xlim=c(0,120), ylim=c(1,4))
