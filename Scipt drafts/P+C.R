nsim=10
lambda=1
sample_flip= function(){
  N=rpois(1,lambda)
  p=1/(N+1)^2
  s=sample(c(1,0) , 1 ,replace=TRUE, prob = c(p,1-p))
  return(c(N,s))
}
samples=data.frame(t(replicate(nsim,sample_flip())))
