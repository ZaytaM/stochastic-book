# Function to simulate the birthday problem
birthday_simulation <- function(n, simulations = 10000) {
  # Vector to store results of simulations
  shared_birthday_count <- 0
  for (i in 1:simulations) {
    # Randomly assign birthdays to n people (between 1 and 365)
    
    birthdays <- sample(1:365, n, replace = TRUE)
    # Check if any two people share the same birthday
    if (any(duplicated(birthdays))) {
      shared_birthday_count <- shared_birthday_count + 1
    }
  }
  
  # Estimated probability
  prob_shared_birthday <- shared_birthday_count / simulations
  return(prob_shared_birthday)
}

# Run the simulation for a group of 23 people with 10,000 simulations
n <- 23
simulations <- 10000
estimated_prob <- birthday_simulation(n, simulations)
cat("Estimated probability of at least one shared birthday in a group of", n, "people:", estimated_prob, "\n")
