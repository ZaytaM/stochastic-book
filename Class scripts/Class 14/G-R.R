# state space
S = c(0, 1, 2, 3)

# transition matrix
P = matrix(c(1,   0,   0,   0,
             1/3, 0,   2/3, 0,
             0,   1/3, 0,   2/3,
             0,   0,   0,   1),
           byrow=T, ncol=4)

T = 100 # number of time periods
nsim = 1000 # number of simulations

# simulate the next position of the chain
draw_next = function(s) {
  i = match(s, S) # the row number of the state s
  sample(S, prob = P[i, ], size = 1)
}

# simulate a single trajectory of length T
# from the initial state
single_trajectory = function(initial_distribution) {
  path = numeric(T+1)
  path[1] =sample(S,prob=initial_distribution,size=1)
  for (n in 1:T) {
    path[n+1] = draw_next(path[n])
  }
  return(path)
}



# simulate the entire chain
simulate_chain = function(initial_distribution) {
  intial_state=
  data.frame(t(replicate(
               nsim, single_trajectory(initial_distribution)
             )))
}

in_d=c(1/4,1/4,1/4,1/4)
df = simulate_chain(in_d)
(p = mean(df$X100 == 3))