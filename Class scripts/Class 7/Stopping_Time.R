# Single trajectory
single_trajectory = function(T, p = 0.5) {
  delta = sample(c(-1, 1), size = T, replace = TRUE, prob = c(1 - p, p))
  x = cumsum(delta)
  return(x)
}
# Walk at stopping time X_tau
X_tau=function(x){
  tau=x[3]+6
  return(x[tau])
}
# Do a 1000 simulations
nsim=1000
results <- replicate(nsim,X_tau(single_trajectory(10)))


