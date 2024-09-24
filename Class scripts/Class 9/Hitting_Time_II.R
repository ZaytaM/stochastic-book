# Function to simulate a single random walk and calculate the first hitting time
simulate_random_walk <- function(horizon) {
  position <- 0  # Start at 0
  for (step in 1:horizon) {
    move <- sample(c(-1, 1), 1)  # Randomly choose -1 or 1
    position <- position + move  # Update position
    if (position == 1) {
      return(1)  # Return the position when hitting 1
    }
  }
  return(position)  # If horizon is reached without hitting return position
}

horizon=10
trials=10000
position <- numeric(trials)
for (i in 1:trials) {
  position[i] <- simulate_random_walk(horizon)
}
hist(position)




