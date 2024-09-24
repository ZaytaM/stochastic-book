# Symmetric random walk simulation to estimate the expected first hitting time to 1 with horizon n

# Function to simulate a single random walk and calculate the first hitting time
simulate_random_walk <- function(horizon) {
  position <- 0  # Start at 0
  for (step in 1:horizon) {
    move <- sample(c(-1, 1), 1)  # Randomly choose -1 or 1
    position <- position + move  # Update position
    
    if (position == 1) {
      return(step)  # Return the step when hitting 1
    }
  }
  return(horizon)  # If horizon is reached without hitting 1
}

# Function to estimate the expected hitting time by averaging multiple trials
estimate_hitting_time <- function(horizon, trials) {
  hitting_times <- numeric(trials)  # Pre allocate vector for hitting times
  
  for (i in 1:trials) {
    hitting_times[i] <- simulate_random_walk(horizon)
  }
  hist(hitting_times)
  
  return(mean(hitting_times))  # Return the average hitting time
}

# Parameters
horizon <- 100  # Maximum number of steps
trials <- 1000  # Number of simulations

# Estimate the expected hitting time
expected_hitting_time <- estimate_hitting_time(horizon, trials)
cat("Estimated expected hitting time to 1 with horizon", horizon, ":", expected_hitting_time, "\n")
