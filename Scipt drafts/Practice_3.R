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

walk = simulate_walk(nsim = 1000, T = 100, p = 0.5)
M = apply(walk, 1, max)