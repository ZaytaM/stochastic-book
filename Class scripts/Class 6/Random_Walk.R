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
walk = simulate_walk(nsim = 100, T = 5)

# compute_M = function(x) {
#   M = max(x)
#   return(M)
# }
# M = apply(walk, 1, compute_M)
# hist(M, breaks = seq(-0.5, 10.5, 1), probability = TRUE)