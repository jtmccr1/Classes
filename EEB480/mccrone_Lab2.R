##############Exercise 1. What do the %% and %/% operators do?"#########################
10 %% 3
10 %/% 3

# The %% operator in x%%y returns the long division remainder of x/y while x %/% y returns the maximum z where y*z<x

###############Exercise 2. What happens when the length of the longer vector is not a multiple of that of the shorter?
x<-c(1,2,3)
y<-c(1,2,3,4)
z<-y-x

# R performs the oporation; however, it gives a warning stating the longer object is not a multiple of the shorter

#########################Exercise 3. Use seq to create the vector v=(1 5 9 13), and to create a vector going###########
#from 1 to 5 in increments of 0.2 .

x<-seq(from=1,to=13,by = 4)

########################Exercise 4. What happens when to is less than from in seq? ##############################
#This is one of the first “gotchas” R newbies run into.
x<-seq(13,1)
# If no by is given R uses -1 as a default "by" and the sequence is formed in reverse.  If a by is given then the error wrong sign in by argument is given.


#################Exercise 5. If you enter v <- z[seq(1,5,2)], ############################
#what will happen? Make sure you un- derstand why.
z <- c(1,3,5,7,9,11); z[3]
v<-z[seq(1,5,2)]
# v is c(1,5,9) because seq(1,5,2) yields c(1,3,5) and z[c(1,3,5)] is c(1,5,9)

########################Exercise 6. Write a one-line command to extract a vector consisting of the #####################
#second, first, and third elements of z in that order.

x<-z[c(2,1,3)];x

#####################Exercise 7. What happens when I set the value of an element that doesn’t exist? #####################
z[9]<-11

# The vector is expanded to include this index and the value is assinged.  Any additional positions that had to be created during the process are empty "NA".

##################Exercise 8. Write code that computes values of y = (x−1)/(x+1) for x = 1, 2, · · · , 10, and plots##############
#￼ y versus x with the points plotted and connected by a line.
x<-seq(1,10,1)

y<-(x-1)/(x+1)
plot(x,y,type="l")
points(x,y,pch=20)


##############Exercise 9. The sum of the geometric series 1 + r + r2 + r3 + ... + rn approaches the limit 1/(1−r)for r<1 as n→∞. 
#Take r=0.5 and n=10,and write a one-line command that creates the vector G = (r0, r1, r2, ..., rn). 
#Compare the sum (using sum()) of this vector to the limiting value 1/(1 − r). Repeat for n = 50.

r = 0.5
n=10
G<-rep(r,n+1)^(0:n);G
# Compare with the limit
1/(1-r) - sum(G)

# Take n to be 50
n = 50
G<-rep(r,n+1)^(0:n);G
# Compare with the limit
1/(1-r) - sum(G)

###################Exercise 10. runif(n) is a function (more on it soon) that generates a vector of n random,###################
#uniformly distributed numbers between 0 and 1. Create a vector of 20 numbers, then find the 
#subset of those numbers that is less than the mean.

x <- runif(20)
y<-x[x<mean(x)];y

#################*Exercise 11. Find the positions of the elements that are less than the mean of the vector you just 
#created (e.g. if your vector were (0.1 0.9 0.7 0.3) the answer would be (1 4)).

positions<-which(x<mean(x));positions

################*Exercise 12. Specify two ways to take only the elements in the odd positions (first, third, . . . ) ############
#of a vector of arbitrary length.

#Let x be our vector than the elements in the odd positions would be given by

# 1) x[seq(from=1,to=length(x),by=2)]
x[seq(from=1,to=length(x),by=2)]
# 2) x[which(which(x %in% x) %% 2==1)]
x[which(which(x %in% x) %% 2==1)]

################Exercise 13. Use a command of the form X <- matrix(v,nrow=2,ncol=4) #####################
#where v is a data vector, to create the following matrix X:

v<-c(1,2)
X<-matrix(v,nrow=2,ncol=4);X

##########Exercise 14. Use rnorm and matrix to create a 5×7 matrix of Gaussian random num- bers with mean 1 and standard deviation 2.
X<-matrix(rnorm(35,mean=1,sd=2),nrow = 5,ncol = 7);X

####################Exercise 15. Verify that rbind(C,D) works, cbind(C,C) works, but cbind(C,D) doesn’t. Why not?##############

C <- cbind(1:3,4:6,5:7); C
D <- rbind(1:3,4:6); D

rbind(C,D)
cbind(C,C)
cbind(C,D) # in this command R is combining the columns inot a larger matrix;however, the column lengths of C and D differ since there is a different number of rows in the matrices.  So this command fails.


#############Exercise 16. What happens when we set the dimension attribute on a vector? For example:###############################
x <- seq(1,27)
dim(x) <- c(3,9)
is.array(x)
is.matrix(x)

# Setting the dimensions on a vector transforms the vector into an arrary ( and matrix ) which is filled by row as if the vector was the data entry in the matrix command.


#########################Exercise 17. Look up the documentation on the sample function used above.######################
# Here's a cut of the documentation :

# Description

# sample takes a sample of the specified size from the elements of x using either with or without replacement.

#Usage

#sample(x, size, replace = FALSE, prob = NULL)


##################Exercise 18. Can I make a matrix or an array out of a factor variable?###################
# Yes

C <- cbind(1:3,4:6,5:7);factor(C)
X <- array(1:24,dim=c(3,4,2));factor(X)

###################*Exercise 19. What is the internal representation of factors in R? ###########################
#Try converting factors to integers using as.integer. Try converting an integer vector to a factor using factor.
trochee <- c("jetpack","ferret","pizza","lawyer")
trochee <- factor(trochee); trochee

trochee.int<-as.integer(trochee);trochee.int
integer.fac<-factor(c(1,4,3,4,2));integer.fac

# It seems like R stores factors as integers.  From the trochee example the integer factor records the index of the factor of each data entry from the ordered factor vector.

################# Exercise 20. Download the hurricanes.csv file from the above course URL. ##########################
#Examine the resulting data frame by printing it and using the str command. Note the class type of each variable.
course.url <- "http://kinglab.eeb.lsa.umich.edu/480/"
dat <- read.csv(file.path(course.url,"data/hurricanes.csv"),comment.char = '#')
print(dat)
str(dat)

################ Exercise 21 - see mccrone_intro2.R

################## Exercise 22 ###############
# plot(fit) - creates a number of plots describing how well the data used in intro2.R matches the statistical model created in the script.


############## Exercised 23 ###########################
#Create a plot of growth rate versus light intensity with the x-axis running from 0 to 120, and the y-axis running from 1 to 4.
source("mccrone_intro2.R")
plot(Light,rmax, xlim=c(0,120), ylim=c(1,4),xlab="light intensity (uE/m2/s)",ylab="maximum growth rate (1/d)",pch=16)


######### Exercise 24 - see mccrone_intro2.R 

######## Exercise 25 

x<-c(3:8)
y<-5*x+3


par(mfrow=c(2,2),col = c("red"),lty=1)
plot(x,y,type='l')
par(col="blue",lty=2)
plot(x,y,type="l")
par(col="green",lty=3)
plot(x,y,type="l")
par(col="black",lty=4)
plot(x,y,type="l")














