
open.sir.model <- function (t, x, params) { B <- params["B"]
                                            beta <- params["beta"]
                                            mu <- params["mu"]
                                            gamma <- params["gamma"]
                                            N <- x[1]+x[2]+x[3]
                                            dSdt <- B - beta*x[1]*x[2]/N
                                            dIdt <- beta*x[1]*x[2]/N-(mu+gamma)*x[2]
                                            dRdt <- gamma*x[2]-mu*x[3]
                                            list(c(dSdt,dIdt,dRdt))
}



xstart <- c(S=999,I=1,R=0)
params <- c(B=20,mu=1/50,beta=400,gamma=365/13)
times <- seq(from=0,to=25,by=1/365)
require(manipulate)
manipulate(
{
  xstart <- c(S=999,I=1,R=0)
  out <- as.data.frame(
  ode(
    func=open.sir.model,
    y=xstart,
    times=times,
    parms=c(beta=beta,gamma=gamma,mu=mu,B=B)
  )
)

R0<-beta/(mu+gamma)
print(R0)
p <- par(fig=c(0,1,0,1),mfrow=c(2,2), mar=c(3,3,1,1),mgp=c(2,1,0),) 
plot(S~time,data=out,type='l',log='y') 
plot(I~time,data=out,type='l',log='y') 
plot(R~time,data=out,type='l',log='y')
plot(I~S,data=out,log='xy',pch='.',cex=0.5) 
par(op)
},
B = slider(0,100,label="B",initial = 20),
mu=slider(0,1,label="mu",initial=1/50),
beta=slider(200,600,label="beta",initial=400),
gamma=slider(1,365,label="gamma",initial=365/13)
)

