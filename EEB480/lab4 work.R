a <- 1.1
b <- 0.001
T <- 200
N <- numeric(length(T)) # fills vector with 0
n <- 2
t<-1
while (t <= T) {
  n <- a*n/(1+b*n)
  N[t] <- n 
  t<-t+1}
plot(N)


sq <- function (x) x^2

sq(3); sq(9); sq(-2);

f <- function (x, y = 3) { a <- sq(x)
                           a+y
}
f(3,0); f(2,2); f(3);


hat <- "hat"
hattrick <- function (y) {
  hat <<- "rabbit"
  2*y }
hattrick(5); hat


f <- function (x) { y <- 2*x
                    print(x)
                    print(y)
                    print(z) }
f(3)
