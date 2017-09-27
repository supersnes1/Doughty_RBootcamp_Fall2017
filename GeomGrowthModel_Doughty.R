#intialize function for growth model
geom.growthMod <- function(start.pop = 1, num.years = 1, Rval = 1)
{
  time.seq <- seq(1,num.years,1)
  NN <- rep(0,length.out = length(time.seq))
  NN[1] <- start.pop
  
#for loop through growth model
  #function for new population size
for(tt in time.seq)
{
  #growth model equation
#  if(tt+1 < max(time.seq))
#  {
    NN[tt+1]<- Rval*NN[tt]
#  }
  #else break
}

return(NN)
}

disc.logMod <- function(start.pop = 1, num.years = 2,rd = 0.5,K = 10)
{
  time.seq <- seq(1,num.years,1)
NN <- rep(0,length.out = length(time.seq))
NN[1] <- start.pop

#for loop through growth model
#function for new population size
for(tt in time.seq)
{
  #growth model equation
 
  #N(t+1)=N(t)(1+rd(1-N(t)/K))
  NN[tt+1] <- NN[tt]*(1+rd*(1-(NN[tt]/K)))
}

return(NN)
}


#initialize variables and global vector for storage
Rval <- 1.05
years <- 25
start.pop <- 100
KK = 10000 #must be greater than start.pop
rd=0.4
timeline <- seq(0,years,1)

#call function and assign result to vector
pop.growth <- geom.growthMod(start.pop = start.pop, num.years = years,Rval = Rval)

#print result and plot is desired
cat(pop.growth)
plot(pop.growth,timeline, #xlim = c(100,2000),
     xlab="Population (N)", ylab = "years (t)")

#Discrete Log Model
#N(t+1)=N(t)(1+rd(1-N(t)/K))
pop.growthDisc <- disc.logMod(start.pop = start.pop, num.years = years,rd = rd,K= KK)

#print result and plot is desired
cat(pop.growth)
plot(pop.growthDisc,timeline, #xlim = c(100,2000),
     xlab="Population (N)", ylab = "years (t)")
abline(v=KK,col="black",lty=3)
abline(a=pop.growth,b=timeline)

#plot of model summary output
#define parameter values
  #see how rd affects population at 5 years
Rval <- 1.05
years <- 5
start.pop <- 100
KK <- 10000 #must be greater than start.pop
timeline <- seq(0,years,1)

#for aprmeters of intrest make vector of values you want to consider
rdmin <- 0.01
rdmax <- 1
rdInterLeng <- 0.01
rd.vec <- seq(rdmin,rdmax,rdInterLeng)

#initialise vector to hold summary values
result.vec <- rep(0, length.out = length(rd.vec))

#use a for loop to repreatedly run model and plot ouput
  #loop over list of values you want to use for the param varying
#each time trhough the loop, run model with current parameter
#values andstore the summary values in the ith element of results vector
for(ii in seq(1,length(rd.vec),1))
{
  pop.growth <- disc.logMod(start.pop = start.pop, num.years = years,rd = rd.vec[ii],K= KK)
  result.vec[ii] <- pop.growth[years]
}

plot(rd.vec,result.vec, #xlim = c(100,2000),
     xlab="rd", ylab = "Population (N)")

#Continuous Time Models
#dN/dt = rN(1-N/K)
#lsoda()
install.packages("deSolve")
library(deSolve)

expGrowthODE <-function(tt,NN,parts)
{
  derivs <- pars['rr']*NN
  return(list(derivs))
}
init <- 1
tseq <- seq(0,20,by=0.01)
pars <- c(rr=0.1)
output <- lsoda(init, tseq, expGrowthODE,pars)

plot(output,tseq)
