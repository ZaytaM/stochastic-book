# Set parameters
p_0 <- 0.1  # Probability of 0 offspring
p_1 <- 0.6  # Probability of 1 offspring
p_2 <- 0.3  # Probability of 2 offspring
offspring_probs <- c(p_0, p_1, p_2)
generations <- 10  # Number of generations
simulations <- 1000  # Number of simulations

# Function to simulate a single branching process
simulate_branching <- function() {
  values=numeric(generations) # Initialize output values as a vector with all zeros
  Z <- 1  # Start with one individual in generation 0
  for (gen in 1:generations) {
    Z <- sum(sample(0:2, size = Z, replace = TRUE, prob = offspring_probs))
    if (Z==0){
      return(values) # If extinction, stop simulating
    }
    values[gen]=Z
  }
  return(values)  # Return values
}
# Run multiple simulations
df <- data.frame(X0=1, t(replicate(simulations, simulate_branching())))
