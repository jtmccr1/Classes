
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
course.url <- "http://kinglab.eeb.lsa.umich.edu/480"
datafile <- paste0(course.url,"/data/ewcitmeas.csv")
meas <- read.csv(datafile,colClasses=c(date="Date"))













