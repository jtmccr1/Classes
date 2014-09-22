
course.url <- "http://kinglab.eeb.lsa.umich.edu/480"
dataset.url <- paste0(course.url,"/data/seedpred.dat")
seeds <- read.table(dataset.url,header=TRUE,colClasses=c(species='factor',date="Date"))
########## Exercise 7 ############################
within(seeds,speed.taken <- taken/tcum)-> seeds

speed.station<-with(seeds,tapply(speed.taken,list(station),mean,na.rm=TRUE)) # the speed in days for which seeds were taken

speed.spec.dist<-with(seeds, tapply(speed.taken,list(species,dist),mean,na.rm=TRUE))

par(mfrow=c(1,2))
boxplot(speed.spec.dist,xlab="Distance")
boxplot(t(speed.spec.dist),xlab="Species")
title("Average speed of seed predation (days)", outer=TRUE)
par(mfrow=c(1,1))
## It seems like in general those seeds closest to the forest
# are taken fastest, while "abz" and "mmu" seeds are preferentially taken more quickly.

rm(list=ls())
########### Exercise 9 ###########################

# These are few plot I have used in my analysis.  The analysis to this point took some time, 
# and I think it would be too long to include here, so I am loading the R environment with the 
# needed variables.  I would be more than happy to provide my codes but I think it is beyond the scope of this assingment
# The data in question comes from a deep sequencing run of dilutions influenza strain WSN33 into PR8 ( another strain).  
rm(list=ls())
load("./lab3.RData") 


# The output of the initial alingment analysis yeilds a csv with segment,position,and sequencing coverage for all 8 segments the genome
# This is a plot of the coverage for the PB2 segment.  The lines refer to the different treaments of fragmentation used in sequencing
# Coverage.ls is a list of  data.frames where each item corresponds to the coverage data from a sample.
coverage_plots<-function(seg,data.ls=coverage.ls){ # This a function so I can make a different plot for each segment
  data.ls<-lapply(data.ls,function(x,segment=seg){ y<- x[x$Segment==segment,]; return(y)}) #Just get the segments of interest
  
  size<-max(vapply(data.ls,function(x){nrow(x)},FUN.VALUE = 1))
  
  data.ls<-lapply(data.ls,fill.in,endpoint=size,seg_name=seg)
  
  position<-vapply(X = data.ls,function(x){y<-x$Position;return(y)},numeric(size)) # one long vector
  coverage<-vapply(X = data.ls,function(x){y<-x$Coverage;return(y)},numeric(size))
  
  matplot(position,coverage,main=paste(seg), type="l", col=c('red','red','red','red','green','green','green','green','blue')) # color based on shearing treament
  legend(x="bottom",legend=c("Covaris","Fragmentase","Plasmid Control"), x.intersp = 0.5,cex = .9 ,pch = 20, col = c("red","green","blue"))
}

coverage_plots(seg = "PB2")


# After using the DeepSNV package to estimate true single nucleotide variants (snv)
# between WSN33 and PR8, I am left with a data frame of called (snv). Here I plot the frequency of snv versus the pvalue given 
#(The null here is that the snv is a sequencing error).

percent_5<-subset(summary.df,Id=="Covaris_5") # Just the summary information for the sample with were snv's should be at 5%



plot(percent_5$p.val~percent_5$freq.var,log="xy",xlab="frequency",ylab="P value",main="All called snv")

abline(v=0.05, col="red", lty=2) # add a line at the expected 5%


## Here is an ROC curve of the analysis.
#ROC.ls is a list of the ROC results where each sample is an item  in the list and named accordingly 
plot(type="n",xlim<-c(7.5e-5,.1),ylim<-c(0,1),xlab = "False Positive Rate", ylab = "True Positvie Rate", main="ROC",log="x",xaxt="n")
points(ROC.ls$Covaris_5[1,],ROC.ls$Covaris_5[2,],type='l',lwd=5, col="red")
points(ROC.ls$Covaris_125[1,],ROC.ls$Covaris_125[2,], type="l" ,lwd=5, col="black")
points(ROC.ls$Covaris_25[1,],ROC.ls$Covaris_25[2,],type='l',lwd=5, col="chartreuse4")
points(ROC.ls$Covaris_063[1,],ROC.ls$Covaris_063[2,], type='l',lwd=5, col="chocolate2")
points(ROC.ls$Covaris_016[1,],ROC.ls$Covaris_016[2,], type='l',lwd=5, col="azure4")
legend(x="bottomright",legend=c("5%","2.5%","1.25%","0.625%","0.16%"),x.intersp = 0.5,col=c("red","chartreuse4","black","chocolate2","azure4"), pch = 20)
axis(1,c(1e-4,1e-3,1e-2,1e-1))


