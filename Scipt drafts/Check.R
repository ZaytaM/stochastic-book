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
      return(k)
    }
    if (x[k]<=-1) {
      return(k)
    }
  }
  return(length(x))
}
# Do a 1000 simulations
nsim=10000
tau <- replicate(nsim,stopping_time(single_trajectory(10)))
