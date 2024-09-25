nsim=10
lambda=1
sample_flip= function(){
  N=rpois(1,lambda)
  p=1/(N+1)
  s=sample(c('H','T') , 1 ,replace=TRUE, prob = c(p,1-p))
  return(s)
}


samples=replicate(nsim,sample_flip())