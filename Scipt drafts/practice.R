nsim = 100000

joint_distribution_long = data.frame(
  x = c(1, 1, 1, 2, 2, 2, 3, 3, 3),
  y = c(1, 2, 3, 1, 2, 3, 1, 2, 3)
)
probabilities_long =
  c(0.1, 0.0, 0.3,
    0.1, 0.1, 0.0,
    0.0, 0.0, 0.4)

sampled_rows = sample(
  x = 1:nrow(joint_distribution_long),
  size = nsim,
  replace = TRUE,
  prob = probabilities_long
)
samples=joint_distribution_long[sampled_rows,]

EX=mean(samples$x)
cond_samples=samples[samples$x==1,]
EY_X=mean(cond_samples$y)