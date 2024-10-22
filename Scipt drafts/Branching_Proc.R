# Set parameters
p_0 <- 0.1  # Probability of 0 offspring
p_1 <- 0.6  # Probability of 1 offspring
p_2 <- 0.3  # Probability of 2 offspring
offspring_probs <- c(p_0, p_1, p_2)
generations <- 11  # Number of generations (X_0 to X_10)
simulations <- 1000  # Number of simulations

# Function to simulate a single trajectory of the branching process
simulate_trajectory <- function(generations = 11, prob = offspring_probs) {
  Z <- 1  # Start with one individual in generation 0
  population_sizes <- numeric(generations)  # Vector to store population size in each generation
  population_sizes[1] <- Z
  for (gen in 2:generations) {
    if (Z == 0) {
      population_sizes[gen:generations] <- 0  # If extinct, set remaining generations to 0
      return(population_sizes)
    }
    Z <- sum(sample(0:2, size = Z, replace = TRUE, prob = prob))
    population_sizes[gen] <- Z
  }
  return(population_sizes)  # Return the population sizes for all generations
}

# Function to simulate multiple branching processes
simulate_process <- function(simulations = 100, generations = 11, prob = offspring_probs) {
  return(
    data.frame(
      t(replicate(simulations, simulate_trajectory(generations, prob)))
    ))
}

# Run multiple simulations
g <- simulate_process(simulations, generations, offspring_probs)
# Add a column to identify each simulation
g$Simulation <- 1:nrow(g)

# Reshape the data from wide format to long format
g_melted <- melt(g, id.vars = "Simulation", variable.name = "Generation", value.name = "Population")

# Convert the generation column to numeric (since it's treated as a factor after melting)
g_melted$Generation <- as.numeric(g_melted$Generation)

# # Plot all the rows (simulations) on the same plot
# print(ggplot(g_melted, aes(x = Generation, y = Population, group = Simulation, color = as.factor(Simulation))) +
#   geom_line(alpha = 0.3) +  # Make the lines semi-transparent
#   labs(title = "Population Trajectories of All Simulations",
#        x = "Generation",
#        y = "Population Size",
#        color = "Simulation") +
#   theme_minimal() +
#   theme(legend.position = "none"))  # Optionally hide the legend if there are many lines

# Calculate the values for the function 1.2^(column number)
function_data <- data.frame(
  Generation = 1:ncol(g),
  Value = 1.2^(1:ncol(g))
)

# Plot all rows (simulations) and the function on the same plot
print(ggplot() +
  # Plot all rows (simulations) as separate lines
  geom_line(data = g_melted, aes(x = Generation, y = Population, group = Simulation, color = as.factor(Simulation)), alpha = 0.3) +
  
  # Plot the function 1.2^(column number)
  geom_line(data = function_data, aes(x = Generation, y = Value), color = "red", size = 1.5, linetype = "dashed") +
  
  labs(title = "Simulations and Function 1.2^Generation",
       x = "Generation (Column Number)",
       y = "Population Size",
       color = "Simulation") +
  theme_minimal()+
  theme(legend.position = "none"))

# Check for extinction
m=apply(g,1,min)
