# Set the number of simulations
n_simulations <- 10000

# Create a function to roll a die and then sample a coin X times
simulate_dice_coin <- function() {
  # Roll the die
  die_roll <- sample(1:6, 1)
  
  # Sample a fair coin die_roll times
  coin_samples <- sample(c("Heads", "Tails"), die_roll, replace = TRUE)
  
  # Count the number of heads
  num_heads <- sum(coin_samples == "Heads")
  
  # Return the number of heads
  return(num_heads)
}

# Run the simulation 1000 times
results <- replicate(n_simulations, simulate_dice_coin())


# Plot the distribution of the number of heads
hist(results, breaks = seq(-0.1, 6.1, 0.05), main = "Distribution of Number of Heads",
     xlab = "Number of Heads", ylab = "Frequency", col = "lightblue", border = "black")
