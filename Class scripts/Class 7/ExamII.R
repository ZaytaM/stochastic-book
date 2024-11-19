# Single trajectory with p=1/4
single_trajectory = function(T, p = 0.25) {
  delta = sample(c(-1, 1), size = T, replace = TRUE, prob = c(1 - p, p))
  x = cumsum(delta)
  return(x)
}
# Gambler's ruin of a walk with boundary 2 and -1, 
stopping_time=function(x){
  for (k in 1:length(x)){
    if (x[k]>=2) {
      return(k-1)
    }
    if (x[k]<=-1) {
      return(k-1)
    }
  }
  return(length(x)-1)
}
# Do a 1000 simulations
nsim=10

walk <- data.frame(X0=0,t(replicate(nsim,single_trajectory(10))))
tau=apply(walk,1,stopping_time)