require(plyr)
require(ggplot2)
require(reshape2)

################# Exercise 1 ###########

n <- 50 
p <- 0.3

x <- seq.int(-2,n+2)
binom <- x
binom<-mutate(as.data.frame(binom),
       pdf = dbinom(x=x,size=n,prob=p),
       cdf = pbinom(q=x,size=n,prob=p))


pl <- ggplot(binom,aes(x=x))+geom_bar(aes(y=pdf),stat='identity')+geom_point(aes(y=cdf),color='red')+geom_line(aes(y=cdf),color='red'); pl

################### Exercise 2 ###############

labs<-200   # The number of labs
N<-matrix(data=NA,nrow=200,ncol=labs)
N[1,]<-rep(x=100,times=labs)     # We begin with 100 test tubes

t<-1  # We set t =1 above
while(any(N[t,]>0)){
  t<-t+1
N[t,]<-rbinom(n=labs,size=N[t-1,],prob=0.95)
}


matplot(N,type='l',lty=1)

 

# what is left is to do the mean(min(which(min(eachcolumn)))
maxsize <- 100
pois <- data.frame(x=seq(0,maxsize))
prob<-10
manipulate(
{
  pois <- mutate(pois,
                  pdf=dpois(x=x,lambda=prob),
                  cdf=ppois(q=x,lambda=prob)
  )
  ggplot(pois,aes(x=x))+theme_bw()+
    geom_bar(aes(y=pdf),stat='identity',color=NA,fill=gray(0.4))+
    expand_limits(x=c(0,maxsize))#+
    #geom_point(aes(y=cdf),color='red')+
    #geom_line(aes(y=cdf),color='red')
},
size=slider(0,maxsize,init=10,step=1,label='size'),
prob=slider(0,10,init=0.5,label='prob')

)

#### Exercise 4

pois<-binom <- data.frame(x=seq(0,maxsize))
maxsize <- 100


manipulate(
{
  pois <- mutate(pois,
                 pdf=dpois(x=x,lambda=prob),
                 cdf=ppois(q=x,lambda=prob)
  )
  
  binom <- mutate(binom,
                  pdf=dbinom(x=x,size=size,prob=prob/size),
                  cdf=pbinom(q=x,size=size,prob=prob/size)
  )
ggplot()+geom_point(data=pois,aes(x=x,y=pdf),color='red')+ geom_line(data=pois, aes(x=x,y=pdf),color='red')+geom_point(data=binom,aes(x=x,y=pdf),color='green')+geom_line(data=binom,aes(x=x,y=pdf),color='green')+expand_limits(x=c(0,maxsize)) 
  },
size=slider(0,maxsize,init=10,step=1,label='size'),
prob=slider(0,20,init=0.5,label='prob')
)
















