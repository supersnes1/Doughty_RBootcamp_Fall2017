setwd("C:/Users/Evan/Documents/GitHub/Doughty_RBootcamp_Fall2017")
getwd()

###
#Exercise 1

###
#Exercise 2

###
#Exercise 3

#dogs will initiall be valued at 10 but will be incrimented to 15 once the loop is compelted.
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

  for (j in 1:5) {
    for (i in 1:length(bankAccounts)) {
      #step 1 modify bankAccounts so that amounts reflect income and expenses
      #step 2 get calculate interest and add to accounts from step 1
      #you can actually use the line you have already written if you
      #modify amounts in bankAccounts directly in step 1
    }
  }
###
#Exercise 7
  house <- c(4.8, 3.8, 5.7); 
  food<- c(3.5, 4.3, 5.0); 
  fun <- c(7.8, 2.1, 10.5); 
  
  #and incomes (through TAships) of 
  
  income <- c(21, 21, 21);
  
  
  
###
#Exercise 8
  
###
#Exercise 9