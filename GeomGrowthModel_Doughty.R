#intialize function for growth model
geom.growthMod <- function(start.pop, num.years, Rval){
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

disc.logMod <- function()


#initialize variables and global vector for storage
Rval <- 1.05
years <- 10
start.pop <- 100

#call function and assign result to vector
pop.growth <- geom.growthMod(start.pop = start.pop, num.years = years,Rval = Rval)

#print result and plot is desired
cat(pop.growth)
timeline <- seq(0,years,1)
plot(pop.growth,timeline, #xlim = c(100,2000),
     xlab="Population at time t", ylab = "years (t)")

#N(t+1)=N(t)(1+rd(1-N(t)/K))
