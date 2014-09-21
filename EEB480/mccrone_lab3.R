########################### In class commands ############################
course.url <- "http://kinglab.eeb.lsa.umich.edu/480"
dataset.url <- paste(course.url,
                     "data/Thrips_imaginis_Davidson1948.csv",
                     sep="/")
download.file(url=dataset.url, destfile="thrips.csv")
file.show("thrips.csv")

thrips <- read.csv("thrips.csv",comment.char="#")

sapply(thrips,class)
summary(thrips)
str(thrips)
head(thrips)
#string vs. factor
dataset.url <- paste0(course.url,"/data/seedpred.dat")
seeds <- read.table(dataset.url,header=TRUE,as.is="species")
sapply(seeds,class)
seeds <- read.table(dataset.url,header=TRUE,as.is=3)
sapply(seeds,class)
# more control
seeds <- read.table(dataset.url,header=TRUE,
                    colClasses=c(species="character")) # note that species is the name of the column and is not a string here
# changing the class after the data is read in
seeds <- read.table(dataset.url,header=TRUE)
sapply(seeds,class)
seeds$species <- as.character(seeds$species)
sapply(seeds,class)

# Factor versus numerical

seeds <- read.table(dataset.url,header=TRUE,colClasses=c(tcum="factor"))
sapply(seeds,class)

f <- factor(1:10); levels(f)
f <- factor(as.character(1:10)); levels(f)
# Levels are inherited 
f<- factor(c("a","b","c","d"))
f2 <- f[1:2]; levels(f2)
f2 <- factor(as.character(f2)); levels(f2) # the factor to character transition "throws away" the level information
f2 <- factor(as.character(f2))


#Dates
as.Date(c("1989-05-15","1992-05-10","2009-05-12","1998-12-08"))
as.Date(c("1jan1960", "2jan1960", "31mar1960", "30jul1960"),format="%d%b%Y") # b is abbreviated month name
as.Date(c("02/27/92", "02/27/92", "01/14/92", "02/28/92", "02/01/92"),format="%m/%d/%y")

year <- c(2004,2004,2004,2005)
month <- c(10,11,12,1)
day <- c(20,18,28,17)
datestr <- paste(year,month,day,sep="-")
date <- as.Date(datestr)
date


install.packages(chron)
library(chron)

timevec1<- c("11:00:00","11:25:30","15:30:20")
times1 <- times(timevec1)

d1<- diff(times1); d1
as.numeric(d1)

timevec2<- c("11:00","11:25","15:30")
timevec2 <- paste(timevec2,":00",sep="")
times(timevec2)


dt <- chron(c("1999-12-31","2000-01-01","2000-02-28","2000-03-01"),
            c("23:59:59","00:00:01","12:00:00","12:00:00"),
            format=c(dates='y-m-d',times='h:m:s')); dt

diff(dt)

# getting meaningful dates
thrips$year  <- thrips$Sample.Date%/%1
thrips$month <- round((thrips$Sample.Date%%1)*100)
head(thrips)

thrips$Sample.Date <- NULL

thrips$time <- with(thrips,year+month/12) # with saves the hassel of all the bloddy $

# in one command

within(thrips,{
  year <- Sample.Date%/%1
  month <- round(100*(Sample.Date%%1)) time <- year+month/12
}) -> thrips

################# Graphics #######################
plot(thrips$time,thrips$Population,type='l')
plot(Population~time,data=thrips,type='l') # formula makes this more readible


plot(Population~time,data=thrips,type='l', log="y") # formula makes this more readible
points(Population~time,data=thrips)

x <- subset(thrips,select=c(year,month,Population))

library(reshape2)
acast(x,month~year,value.var="Population") -> x
class(x);x

matplot(x=as.numeric(rownames(x)),y=x,type="l",lty=1,log='y', xlab='month',ylab='population')

plot(Population~factor(month),data=thrips,log='y')



##### tabulation #########

t1 <- with(seeds,table(available,taken))

within(seeds,frac.taken <- taken/available) -> seeds
t2 <- with(seeds,tapply(frac.taken,list(species,dist),mean,na.rm=TRUE))
t3 <- with(seeds,tapply(frac.taken,list(species,available),mean,na.rm=TRUE)))

######### Visualizing distribution ##############

x <- subset(seeds,available==5&taken>0)
tt <- with(x,table(taken,species)) 
barplot(tt,beside=T,legend=T,xlab='species',ylab="no. observations")


############ UK data set ######################
rm(list=ls())


course.url <- "http://kinglab.eeb.lsa.umich.edu/480"
datafile <- paste0(course.url,"/data/ewcitmeas.csv")
meas <- read.csv(datafile,colClasses=c(date="Date"))

head(meas)
summary(meas)
str(meas)

require(reshape2)
meas.long <- melt(meas,id.vars='date') 
head(meas.long,n = 10)

meas.long <- melt(meas,id.vars='date',value.name="cases",variable.name="city") 
head(meas.long)

cityNames<-levels(meas.long$city)



legend('topright',legend=cityNames,lty=1,col=1:8)

################# Exercise 1 #############################
sapply(thrips,class)
summary(thrips)
str(thrips)
head(thrips)
################# Exercise 2 #############################

f <- factor(c(3,3,5,6,7,8,10))
par(mfrow=c(1,2))
plot(f, main = "intermediate levels")
plot(c(3,3,5,6,7,8,10), main = "no intermediate levels")
par(mfrow=c(1,1))

################ Exercise 3 ##############################

within(seeds,frac.taken <- taken/available) -> seeds
t2 <- with(seeds,tapply(frac.taken,list(species,dist),mean,na.rm=TRUE))
t3 <- with(seeds,tapply(frac.taken,list(species,available),mean,na.rm=TRUE))

################ Exercise 4 ##############################
################ Exercise 5 ##############################
barplot(tt,beside=T,legend=T,xlab='species',ylab="no. observations")

################ Exercise 6 ###############################
################ Exercise 7 ###############################
################ Exercise 8 ###############################
################ Exercise 9 ###############################