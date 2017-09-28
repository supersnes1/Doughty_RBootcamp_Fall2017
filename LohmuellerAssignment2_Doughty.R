setwd("C:/Users/Evan/Documents/GitHub/Doughty_RBootcamp_Fall2017")
getwd()

#1
#1A
source("AnalyzeSNPdata.2017.student.R")
# Apply the compute_chi_square function to each snp
pvals <- apply(snps,1,compute_chisquare)

#1B
#What proportion of P-values from the test are <0.05?
sum(pvals < 0.05)/length(pvals) #16.81614%
#What proportion are <0.01?
sum(pvals < 0.01)/length(pvals) #8.196313%
#What proportion are <0.001?
sum(pvals < 0.001)/length(pvals) #2.466368%

#1C
num_pval <- length(pvals) #4014

#1D
exp_pvals <- seq((1/num_pval),1,(1/num_pval))

#1E
sort_pvals <- sort(pvals)

#1F
log_exp_pvals <- -1*log10(exp_pvals)

log_sort_pvals <- -1*log10(sort_pvals)

#1G
min(sort_pvals)
max(sort_pvals)
plot(log_exp_pvals,log_sort_pvals, xlab="-log10(expected P-value", ylab="-log10(observed P-value")
abline(log_exp_pvals~log_sort_pvals)

#2
#2a
zz<-read.table("pheno.sim.2014.txt",header=T)

#2b
min(zz$glucose_mmolperL)
max(zz$glucose_mmolperL)

zz_quant <- quantile(zz$glucose_mmolperL, probs = seq(0,1,0.25))
zz_quant["25%"]

#2C
zz_quant["75%"]

#2D
plot(density(zz_quant),col="black",lwd=2,xlab="Blood Glucose Level",xlim=c(0,15),main="Distribution of Phenotypes")
abline(v=zz_quant["25%"],lty=2)
abline(v=zz_quant["75%"],lty=2)
