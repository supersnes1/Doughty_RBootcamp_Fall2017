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

