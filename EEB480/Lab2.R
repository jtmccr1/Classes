##Exercise 1. What do the %% and %/% operators do?"
10 %% 3
10 %/% 3

# The %% operator in x%%y returns the long division remainder of x/y while x %/% y returns the maximum z where y*z<x

##Exercise 2. What happens when the length of the longer vector is not a multiple of that of the shorter?
x<-c(1,2,3)
y<-c(1,2,3,4)
z<-y-x

# R performs the oporation; however, it gives a warning stating the longer object is not a multiple of the shorter

##Exercise 3. Use seq to create the vector v=(1 5 9 13), and to create a vector going from 1 to 5 in increments of 0.2 .

x<-seq(from=1,to=13,by = 4)

##Exercise 4. What happens when to is less than from in seq? This is one of the first “gotchas” R newbies run into.
x<-seq(13,1)
# If no by is given R uses -1 as a default "by" and the sequence is formed in reverse.  If a by is given then the error wrong sign in by argument is given.


#Exercise 5. If you enter v <- z[seq(1,5,2)], what will happen? Make sure you un- derstand why.
z <- c(1,3,5,7,9,11); z[3]
v<-z[seq(1,5,2)]
# v is c(1,5,9) because seq(1,5,2) yields c(1,3,5) and z[c(1,3,5)] is c(1,5,9)

#Exercise 6. Write a one-line command to extract a vector consisting of the second, first, and third elements of z in that order.

x<-z[c(2,1,3)];x

#Exercise 7. What happens when I set the value of an element that doesn’t exist? For example, try
z[9]<-11

# The vector is expanded to include this index and the value is assinged.  Any additional positions that had to be created during the process are empty "NA".

#Exercise 8. Write code that computes values of y = (x−1)/(x+1) for x = 1, 2, · · · , 10, and plots
￼ y versus x with the points plotted and connected by a line.
x<-seq(1,10,1)

y<-(x-1)/(x+1)
plot(x,y,type="l")
points(x,y,pch=20)


#Exercise 9. The sum of the geometric series 1 + r + r2 + r3 + ... + rn approaches the limit 1/(1−r)for r<1 as n→∞. 
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

##Exercise 10. runif(n) is a function (more on it soon) that generates a vector of n random,
#uniformly distributed numbers between 0 and 1. Create a vector of 20 numbers, then find the 
#subset of those numbers that is less than the mean.

x <- runif(20)
y<-x[x<mean(x)];y

##*Exercise 11. Find the positions of the elements that are less than the mean of the vector you just 
#created (e.g. if your vector were (0.1 0.9 0.7 0.3) the answer would be (1 4)).

positions<-which(x<mean(x));positions

##*Exercise 12. Specify two ways to take only the elements in the odd positions (first, third, . . . ) 
#of a vector of arbitrary length.

#Let x be our vector than the elements in the odd positions would be given by

# 1) x[seq(from=1,to=length(x),by=2)]
# 2) x[which(which(x %in% x) %% 2==1)]


