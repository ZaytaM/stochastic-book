
library(ggplot2)

# Set seed for reproducibility
set.seed(123)

# Number of steps
n_steps <- 10000

# Starting point
start <- 100

# Number of realizations
n_realizations <- 10

# Generate data for all realizations
random_walks <- data.frame(Step = integer(), Position = numeric(), Realization = factor())

for (i in 1:n_realizations) {
  # Generate symmetric random walk steps (+1 or -1)
  steps <- sample(c(-1, 1), n_steps, replace = TRUE)
  
  # Calculate the random walk path
  random_walk <- cumsum(c(start, steps))
  
  # Create a sequence for the x-axis (steps)
  x <- 0:n_steps
  
  # Combine data into the dataframe
  random_walks <- rbind(random_walks, data.frame(Step = x, Position = random_walk, Realization = factor(i)))
}

# Plot the realizations with horizontal lines at y = 150 and y = 0
plot(random_walks, aes(x = Step, y = Position, color = Realization)) +
  geom_line(size = 1) +
  facet_wrap(~ Realization, ncol = 5) +  # Arrange the plots side by side in a grid
  geom_hline(yintercept = 150, color = "red", linetype = "dashed", size = 1) +  # Add y = 150 line
  geom_hline(yintercept = 0, color = "red", linetype = "dashed", size = 1) +    # Add y = 0 line
  theme_minimal() +
  labs(title = "Symmetric Random Walk - 10 Independent Realizations with y = 150 and y = 0 Lines", 
       x = "Steps", y = "Position") +
  theme(legend.position = "none")
