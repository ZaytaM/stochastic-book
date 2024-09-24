# Set the number of simulations
nsim = 100000

# Define the joint distribution as a data frame
joint_distribution_long = data.frame(
  x = c(1, 1, 1, 2, 2, 2, 3, 3, 3),
  y = c(1, 2, 3, 1, 2, 3, 1, 2, 3)
)

# Define the probabilities corresponding to the (x, y) pairs
probabilities_long = c(0.1, 0.0, 0.3, 
                       0.1, 0.1, 0.0, 
                       0.0, 0.0, 0.4)

# Sample rows from the joint distribution based on the given probabilities
sampled_rows = sample(
  x = 1:nrow(joint_distribution_long),
  size = nsim,
  replace = TRUE,
  prob = probabilities_long
)

# Get the sampled data based on the sampled rows
samples = joint_distribution_long[sampled_rows, ]
