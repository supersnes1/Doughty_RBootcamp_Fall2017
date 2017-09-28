setwd("C:/Users/Evan/Documents/GitHub/Doughty_RBootcamp_Fall2017")
getwd()

#1
#1A

#################Code from AnalyseSNPdata.2017.student.R
# Load a data set
snpsDataFrame=read.table(file='hapmap_CEU_r23a_chr2_ld-2.txt',header=TRUE)

# Note:  If A is the more common allele and B is the more rare allele (i.e. major and minor alleles, repsectively)
#        Then, AA= 0,  AB= 1, BB = 2

# Because the data are really just a large numeric matrix, we convert the dataframe to a matrix:
snps=as.matrix(snpsDataFrame)

# Now, let's define functions that do this for a generic set of SNP data
calc_freq=function(x){
  return(sum(x,na.rm=TRUE)/(2.0*sum(!is.na(x))))
}

calc_het=function(x){
  return(sum(x==1,na.rm=TRUE)/(sum(!is.na(x))))
}

# And now let's apply the functions to each and every SNP
freq=apply(snps,1,calc_freq)
het=apply(snps,1,calc_het)

# And now we can make exploratory plots
plot(freq,het,xlab="Frequency",ylab="Heterozygosity")  # Scatter plot

# Let's add a line to show what relationship we'd expect under Hardy-Weinberg expectations
p=seq(0,0.5,by=0.05)   # Set-up a vector with a sequence of allele frequencies
points(p,2*p*(1-p),type="l",col=2) # Plot the HW expectation as a line in red

## APPYLING A CHI-SQUARE TEST TO EACH SNP TO FORMALLY LOOK FOR DEPARTURES FROM HARDY-WEINBERG EXPECTATIONS ###
compute_chisquare=function(x){
  freq=sum(x,na.rm=TRUE)/(2.0*sum(!is.na(x)))
  cnt0=sum(x==0,na.rm=TRUE)
  cnt1=sum(x==1,na.rm=TRUE)
  cnt2=sum(x==2,na.rm=TRUE)
  obscnts=c(cnt0,cnt1,cnt2)
  #print(obscnts)
  n=sum(obscnts)
  expcnts=c((1-freq)^2,2*freq*(1-freq),freq^2)*n
  chisq=sum((obscnts-expcnts)^2/expcnts)
  return(chisq)
}
#################End Code from AnalyseSNPdata.2017.student.R

# Apply the compute_chi_square function to each snp
pvals <- apply(snps,1,compute_chisquare)

#What proportion of P-values from the test are <0.05?
sum(pvals < 0.05)/length(pvals) #16.81614%
#What proportion are <0.01?
sum(pvals < 0.01)/length(pvals) #8.196313%
#What proportion are <0.001?
sum(pvals < 0.001)/length(pvals) #2.466368%

#1C
num_pval <- length(pvals) #4014

#1D
exp_pvals <- seq((1/num_pval),1,1/num_pval)

#1E
sort_pvals <- sort(pvals)

#1F
log_exp_pvals <- -1*log10(exp_pvals)

log_sort_pvals <- -1*log10(sort_pvals)

#1G
plot(log_sort_pvals,log_exp_pvals)
