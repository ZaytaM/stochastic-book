<<<<<<< HEAD
# Parameters
generations <- 10  # Number of generations
=======
# Set parameters
p_0 <- 0.1  # Probability of 0 offspring
p_1 <- 0.6  # Probability of 1 offspring
p_2 <- 0.3  # Probability of 2 offspring
offspring_probs <- c(p_0, p_1, p_2)
generations <- 13  # Number of generations
>>>>>>> 52f7fa20b173cbf4f89db2ec5472043787db2824
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
<<<<<<< HEAD
# Run multiple simulations
results <- replicate(simulations, simulate_extinction(1/2,0,1/2,0))
=======
results <- replicate(simulations,simulate_extinction())
>>>>>>> 52f7fa20b173cbf4f89db2ec5472043787db2824
