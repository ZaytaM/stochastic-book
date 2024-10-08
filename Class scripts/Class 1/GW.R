# Load necessary libraries
library(ggplot2)
library(dplyr)

# Define the simulation function
simulate_galton_watson <- function(initial_infected = 1, max_generations = 10) {
  # Initialize
  generations <- 1:max_generations
  num_individuals <- numeric(max_generations)
  num_individuals[1] <- initial_infected
  
  # Probabilities for number of offspring
  probabilities <- c(1/4, 1/4, 1/4, 1/4)
  
 
  # Simulation
  for (gen in 2:max_generations) {
    current_population <- num_individuals[gen - 1]
    new_population <- 0
    for (i in 1:current_population) {
      offspring <- sample(0:3, 1, prob = probabilities)
      new_population <- new_population + offspring
    }
    num_individuals[gen] <- new_population
  }
  
  # Return the results as a data frames
  data.frame(Generation = generations, NumberOfIndividuals = num_individuals)
}

# Parameters
initial_infected <- 1
max_generations <- 20

# Run simulation
simulation_results <- simulate_galton_watson(initial_infected, max_generations)

# # Print results
print(simulation_results)

# Plot the results
plot(simulation_results, col = "blue",xlim=c(1,20), ylim=c(1,(1.5)^20))
# Initialize Expectation
E=1:max_generations
for (gen in 2:max_generations) {
  E[gen]=1.5^(gen-1)
}
lines(1:max_generations, E, type = "o", col = "red")