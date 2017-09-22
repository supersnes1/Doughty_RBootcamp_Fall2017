#Plotting and genetic variation data analysis exercises, Assignment 1
#Evan Doughty
#9/22/2017

setwd("C:/Users/Evan/Documents/GitHub/Doughty_RBootcamp_Fall2017")
getwd()

#1
get_heights <- function(sample = 100,mean.height=50,sdev.height=10)
{
  heights <- rnorm(n=sample,mean=mean.height,sd=sdev.height)
#2 
  ave.height <- mean(heights)
#3  
  return(ave.height)
}

#4
iter <- 1000
mean_heights_100 <- rep(0,length.out = iter)

for(i in seq(1,iter))
{
  mean_heights_100[i] <- get_heights(100, 69, 10)
}

#5
iter <- 1000
mean_heights_1000 <- rep(0,length.out = iter)

for(i in seq(1,iter))
{
  mean_heights_1000[i] <- get_heights(1000, 69, 10)
}

#6
min(mean_heights_100)
max(mean_heights_100)
min(mean_heights_1000)
max(mean_heights_1000)

bins <- seq(64,74,0.5)
count_100<-hist(mean_heights_100,breaks=bins, plot=FALSE)$counts
count_1000<- hist(mean_heights_1000,breaks=bins, plot=FALSE)$counts

bin.label <- bins[-21]

par(mfrow=c(1,1))
barplot(rbind(count_100,count_1000),beside=TRUE, col=c("red","blue"), ylim=c(0,500),names.arg=bin.label, xlab ="Average Height (Inches)",ylab = "Count", main="Simulated Average Height of Humans at 100 and 1000 iterations")
legend(0,450, legend= c("n=100",'n=1000'), col=c("red","blue"),pch=19)

png(filename="SimulatedAveHeight_Barplot_Doughty.png")
dev.off()
