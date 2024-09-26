single_trajectory = function(T, p = 0.6) {
  delta = sample(c(-1, 1), size = T, replace = TRUE, prob = c(1 - p, p))
  x = cumsum(delta)
  return(x)
} 
simulate_walk = function(nsim, T, p = 0.6) {
  return(
    data.frame(
      X0 = 0,
      t(replicate(nsim, single_trajectory(T, p)))
    ))
}
walk = simulate_walk(nsim = 1000000, T = 5, p = 0.6)
S = apply(walk, 1, sum)

S_2=function(x){
  q=0
  for(i in 1:length(x)){
    q=q+x[i]^2
  }
  return(q)
}
S2=apply(walk,1,S_2)
