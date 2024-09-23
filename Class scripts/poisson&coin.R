# Set the parameter for Poisson distribution
lambda <- 3  # Example value for lambda, you can change it

# Number of iterations
n <- 100

# Initialize a vector to store the results
results <- numeric(n)

# Loop to repeat the process n times
for (i in 1:n) {
  
  # Step 1: Sample N from Poisson distribution with parameter lambda
  N <- rpois(1, lambda)
  
  # Step 2: Set the probability of heads based on the sampled N
  p_heads <- 1 / (N + 1)
  
  # Step 3: Toss the biased coin with probability of heads being p_heads
  coin_toss <- rbinom(1, 1, p_heads)  # 1 for heads, 0 for tails
  
  # Step 4: Determine the outcome
  if (coin_toss == 1) {
    results[i] <- 1  # Win
  } else {
    results[i] <- -1  # Lose
  }
}

# Print the results
print(results)

# Optional: Calculate and display the total winnings/losses
total_outcome <- sum(results)
cat("Total outcome after", n, "iterations:", total_outcome, "\n")