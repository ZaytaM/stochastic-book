# Set parameters
p_0 <- 0.125  # Probability of 0 offspring
p_1 <- 0.125  # Probability of 1 offspring
p_2 <- 0.25  # Probability of 2 offspring
p_3 <- 0.5 # Probability of 2 offspring
offspring_probs <- c(p_0, p_1, p_2,p_3)
generations <- 10  # Number of generations
simulations <- 100  # Number of simulations

# Function to simulate a single branching process
simulate_branching <- function(g,p) {
  Z <- 1  # Start with one individual in generation 0
  out=numeric(g)
  for (gen in 1:g) {
    Z <- sum(sample(0:3, size = Z, replace = TRUE, prob = p))
    out[gen]=Z
  }
  return(out)  # Return not extinction
}
branching_sample <- function(g,p){
  return(data.frame(X0=1,t(replicate(simulations, simulate_branching(g,p)))))
}
  
Z=branching_sample(generations,offspring_probs)
