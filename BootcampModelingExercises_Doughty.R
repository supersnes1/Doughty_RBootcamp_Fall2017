#Bootcamp Modeling Exercises

#1a
#write function for Ricker model
rickerModel <- function(start.pop=2,time = 2, rr=1,KK=10)
{
  #initialize variables
  timeline <- seq(0,time,1)
  nn <- rep(0, length.out = length(timeline))
  nn[1] <- start.pop
  
  #check K > 0
  if(KK <= 0)
  {
    cat("Input Value that is greater than 0 for K")
    return()
  }

  #Ricker model equation in for loop
  for(tt in seq(1,time,1))
  {
    nn[tt+1] <- nn[tt]*exp(rr*(1-(nn[tt])/KK))
  }
  #plots result
  
  plot(timeline, nn, xlab="Time (t)", ylab="Population (N)", type = "l", main = paste(paste("K=",KK),paste("r=",rr)))
  #abline(a=timeline, b=nn, col="black")
  abline(h=KK,col=2)
  
  #returns time series
  return(nn)
}

time.series <- rickerModel(start.pop=10,time = 100, rr=1.5,KK=1000)

#1b
#rickerModel(start.pop=10,time = 100, rr=1.5,KK=1000)

#Population decreases to n=0
time.series_to0 <- rickerModel(100,100,-0.5,1000)
time.series_to0_v2 <- rickerModel(10,100,10,1000)
#Population approaches stable equilibrium at n* = K, without oscillations
time.series_Stable <- rickerModel(10,100,1,1000)
#Decaying oscillations around n* = K. 
time.series_DecOc1.5 <- rickerModel(10,100,1.5,1000)
time.series_DecOc2 <- rickerModel(10,100,2,1000)
#Persistent, regulat oscillations
time.series_RegOc <- rickerModel(10,100,3,1000)
#Crazy, random-looking fluctuations
time.series_CrazyOc2 <- rickerModel(10,100,5,1000)

#Altering the values for r is key to driving patterns of fluctuation in the model.

#1C
rr.list <- c(-0.5,1,1.5,2,3,5)

series.mat<- matrix(0,nrow=6,ncol=100)
rownames(series.mat) <- rr.list

par(mfrow=c(3,2))
for(rr in rr.list)
{
  rickerModel(10,100,rr,1000)
}
dev.off

#1D 
#n0 = 20, K=1000
nn = 20
KK <- 1000
time <-100
timeline <- seq(0,time,1)
nVec <- rickerModel(nn,time,0.5,KK)
half.Cap <- min(which(nVec >= KK/2))
cat("First element that is >= K/2 is:",half.Cap)
cat("Population is >= K/2 at time(t) of:",timeline[half.Cap])

#1E
nn = 20
KK <- 1000
time <-100

iter.len <- 0.1
rlist <- seq(0.1,0.9,iter.len)

half.time <- rep(0,length.out= length(rlist))
ht <- 1 #count through half.time
for(rr in rlist)
{
  nVec <- rickerModel(nn,time,rr,KK)
  half.Cap <- min(which(nVec >= KK/2))
  
  half.time[ht] <-half.Cap
  ht <- ht + 1
}

plot(rlist,half.time, xlab="r Value", ylab=expression("Time t"["k/2"]))
lines(rlist,half.time)

#1F

  #initialize variables

  #intialize storage matrix

  #in a for loop run analysis using all combinations of K
    #in a for loop run analsis using all combinations of r
  
    #store results to matrix

  #set of array of plots to graph results


#1G
  #initialize variables
nn = 20
time <-100
timeline <- seq(0,time,1)

t.select <- 10

iter.lenR <- 0.1
rlist <- seq(0.1,0.9,iter.lenR)

iter.lenK <- 100
Klist <- seq(500,1000,iter.lenK)
  #intialize storage matrix

result.Mat <- matrix(0,nrow=length(rlist),ncol=length(Klist))
rownames(result.Mat) <- rlist
colnames(result.Mat) <- Klist
  #in a for loop run analysis using all combinations of K
    #in a for loop run analsis using all combinations of r
jj <- 1

for(KK in Klist)
{
  ii <- 1
   for(rr in rlist)
  {
    nVec <- rickerModel(nn,time,rr,KK)
    half.Cap <- min(which(nVec >= KK/2))
    
    #store results to matrix
    result.Mat[ii,jj] <- nVec[which(timeline == t.select)]
    
    if(rr < max(rlist)) ii <- ii + 1
    
  }
  if(KK < max(Klist)) jj <- jj + 1
}
  #set of array of plots to graph result 
image(result.Mat)

#contour Map
jj<-1
ii<-1
hh <- 1

flatMat <- matrix(0,nrow=(length(rlist)*length(Klist)),ncol=3)
for(jj in seq(1,length(Klist),1))
{
  for(ii in seq(1,length(rlist),1))
  {
    flatMat[hh,1] <- result.Mat[ii,jj]
    flatMat[hh,2] <- rlist[ii]
    flatMat[hh,3] <- Klist[jj]
    hh <- hh + 1
  }
  ii <- 1
}

#install.packages("ggplot2")
library(ggplot2)

colnames(flatMat) <- c("N","r","K")
plot1 <- ggplot(as.data.frame(flatMat), aes(x = r, y = K, z = N)) +
  stat_contour()

#Same Result but in single function
contour(result.Mat)

#Surface Plot
#install.packages("rgl")
library(rgl)
open3d()
par(mfrow=c(1,1))
#surface3d(x=rownames(result.Mat),y=colnames(result.Mat), z=result.Mat)
dim(result.Mat)

#https://www.packtpub.com/mapt/book/big_data_and_business_intelligence/9781849513067/8/ch08lvl1sec08/creating-three-dimensional-surface-plots
#also found in package information for rgl (https://cran.r-project.org/web/packages/rgl/rgl.pdf)
#

z <- result.Mat
x <- 100*(1:nrow(z))
y <- 100*(1:ncol(z))
zlim <- range(z)
zlen <- zlim[2] - zlim[1] + 1
colorlut <- terrain.colors(zlen)
col <- colorlut[ z-zlim[1]+1 ]
rgl.open()
rgl.surface(x, y, z, color=col, back="lines")

#1H
#Bifurcated Plot
matplot(result.Mat, ylab="Population (N)", xlab="r value (10^-1)")
