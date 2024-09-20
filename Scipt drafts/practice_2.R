# Number of simulations
nsim <- 10000

# Function to simulate rolling two dice and taking the maximum
roll_two_dice <- function() {
  die1 <- sample(1:6, size = 1, replace = TRUE)  # Roll first die
  die2 <- sample(1:6, size = 1, replace = TRUE)  # Roll second die
  return(max(die1, die2))  # Record the maximum of the two dice
}

# Perform Monte Carlo simulation by rolling two dice nsim times
max_values <- replicate(nsim, roll_two_dice())