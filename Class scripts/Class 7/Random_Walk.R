single_trajectory = function(T, p = 0.5) {
  delta = sample(c(-1, 1), size = T, replace = TRUE, prob = c(1 - p, p))
  x = cumsum(delta)
  return(x)
}

simulate_walk = function(nsim, T, p = 0.5) {
  return(
    data.frame(
      X0 = 0,
      t(replicate(nsim, single_trajectory(T, p)))
    ))
}
walk = simulate_walk(nsim = 10, T = 10)

M = apply(walk, 1, max)
hist(M, breaks = seq(-0.5, 11.5, 1), probability = TRUE)

hitting_time= function(x){
  for (i in 1:length(x)){
    if (x[i]==1) {return(i-1)}
  }
  return(length(x)-1)
}
tau_1=apply(walk,1,hitting_time)
hist(tau_1)

hitting_time_1= function(x){
  for (i in 1:length(x)){
    if (x[i]==1 | x[i]==-2) {return(i-1)}
  }
  return(length(x)-1)
}
tau_ab=apply(walk,1,hitting_time_1)
hist(tau_ab)



