# Parameters
generations <- 10  # Number of generations
simulations <- 1000  # Number of simulations

# Function to simulate a single branching process
simulate_extinction <- function(p_0,p_1,p_2,p_3) {
  offspring_probs <- c(p_0, p_1, p_2,p_3)
  Z <- 1  # Start with one individual in generation 0
  for (gen in 1:generations) {
    Z <- sum(sample(0:3, size = Z, replace = TRUE, prob = offspring_probs))
    if (Z==0){
      return(1) # Extinction
    }
  }
  return(0)  # Return not extinction
}
# Run multiple simulations
results <- replicate(simulations, simulate_extinction(1/2,0,1/2,0))