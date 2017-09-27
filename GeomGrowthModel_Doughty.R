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

disc.logMod <- function(start.pop = 1, num.years = 2, Rval = 1,rd = 0.5,K = 1)
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
years <- 10
start.pop <- 100
KK = 1000 #must be greater than start.pop
rd=0.75

#call function and assign result to vector
pop.growth <- geom.growthMod(start.pop = start.pop, num.years = years,Rval = Rval)

#print result and plot is desired
cat(pop.growth)
timeline <- seq(0,years,1)
plot(pop.growth,timeline, #xlim = c(100,2000),
     xlab="Population (N)", ylab = "years (t)")

#N(t+1)=N(t)(1+rd(1-N(t)/K))
pop.growthDisc <- disc.logMod(start.pop = start.pop, num.years = years,Rval = Rval,rd = rd,K= KK)
plot(pop.growthDisc,timeline, #xlim = c(100,2000),
     xlab="Population (N)", ylab = "years (t)")
