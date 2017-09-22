setwd("C:/Users/Evan/Documents/GitHub/Doughty_RBootcamp_Fall2017")
getwd()

#Evan Doughty
#9/22/2017

###
#Exercise 1
for(i in 1:9)
{
  if(i == 9)
  {
    cat("*", fill=TRUE)
  }
  else 
  {
    cat(" ", fill=TRUE)
  }
}

###
#Exercise 2
for(i in 1:10)
{
  cat("*", fill=FALSE)
  if(i < 10)
  {
    cat("&", fill=FALSE) 
  }
}

###
#Exercise 3

#dogs will initially be valued at 10 but will be incrimented to 15 once the loop is completed.
#meatloaf will be assigned be be 0 initially.  After the for loop meatloaf is set to -30.
#bubbles is initally assigned to the value 12 but is reassigned to -4 at the end of the for loop.

###
#Exercise 4
###you can use the if statement with the modulus operator to conditionally perform operations
years <- c( 2015, 2016, 2018, 2020, 2021)
for(ii in 1:length(years)){
  if(years[ii] %% 2 == 0){
    cat(years[ii], 'Hooray, congressional elections!', sep = '\t', fill = TRUE)
    }
   if(years[ii] %% 4 == 0){
      cat(years[ii], 'Hooray, presidential elections!', sep = '\t', fill = TRUE)
    }
}

###
#Exercise 5
bankAccounts <- c(10, 9.2, 5.6, 3.7, 8.8, 0.5);

#Now look at the error message the following lines of code produce. Can you think of a way to modify this loop so that the loop will compund the interest?

interestRate <- 0.0125;
compounded <- rep(0,length.out=length(bankAccounts))

for (i in 1:length(bankAccounts)) {
  compounded[i] <- interestRate*bankAccounts[i] + bankAccounts[i]; }

compounded

#HINT: variables must be initialized before you can perform operations on them
#HINT 2: look at the rep() function and see if you can use that to initialize a variable that will help you.

###
#Exercise 6
  bankAccounts <- c(10, 9.2, 5.6); #define bank accounts here
  interestRate <- 0.0525;   
  house <- c(4.8, 3.8, 5.7); #deduct
  food<- c(3.5, 4.3, 5.0);    #deduct
  fun <- c(7.8, 2.1, 10.5);  #deduct
  #and incomes (through TAships) of 
  income <- c(21, 21, 21); #add this
  
  num.years <- 5
  bankAnnual <- matrix(0,num.years,length(bankAccounts))

  for (j in 1:num.years) {
    for (i in 1:length(bankAccounts)) {
      bankAccounts[i] <- bankAccounts[i]-(house[i]+food[i]+fun[i])+income[i]
      bankAccounts[i] <- interestRate*bankAccounts[i] + bankAccounts[i]
    }
    bankAnnual[j,]<-bankAccounts
  }
  bankAnnual
  
###
#Exercise 7
  
  house <- c(4.8, 3.8, 5.7); 
  food<- c(3.5, 4.3, 5.0); 
  fun <- c(7.8, 2.1, 10.5); 
  #and incomes (through TAships) of
  income <- c(21, 21, 21);
  
  bankAccounts <- c(10, 9.2, 5.6); #define bank accounts here
  interestRate <- 0.0525;   
  trust.recip <- c(1,3)
  start.year <- 2015
  end.year <- 2020
  
  #track the initial and final values in each account at the start and end of each year
  count.year <- 1
  bankAnnualstart <- matrix(0,(end.year-start.year)+1,length(bankAccounts))
  bankAnnualend <- matrix(0,(end.year-start.year)+1,length(bankAccounts))
  
  for (j in start.year:end.year) {
    print(j)
    bankAnnualstart[count.year,]<-bankAccounts #track accounts at begining of year
    if(j %% 2 != 0){
      bankAccounts[trust.recip] <- bankAccounts[trust.recip]+5
      
    }
    for (i in 1:length(bankAccounts)) {
      bankAccounts[i] <- bankAccounts[i]-(house[i]+food[i]+fun[i])+income[i]
      bankAccounts[i] <- interestRate*bankAccounts[i] + bankAccounts[i]
    }
   bankAnnualend[count.year,]<-bankAccounts #track accounts at end of year after compounding of interest
   count.year <- count.year+1
  }
  rownames(bankAnnualstart) <- c(start.year:end.year)
  rownames(bankAnnualend) <- c(start.year:end.year)
  bankAnnualstart
  bankAnnualend
 
###
#Exercise 8: use a while loop to sum all numbers from 1:17. You will need to use a counter variable (like index seen in class).

summed.series <- 0
i <- 1

while(i <= 17) 
{
  summed.series <- summed.series + i
  
  i <- i + 1
}  
  summed.series
  
  sum(1:17)

###
#Exercise 9

nom.Size  <- function(user.input = 0)
{
  x <- as.integer(user.input)

  if(x <= -1)
  {
    print("small")
  }

  if(x > -1 & x < 1)
  {
    print("medium")
  }

  if(x >= 1)
  {
    print("big")
  }
}

result <- nom.Size(user.input=readline(prompt="Enter whole integer: "))
