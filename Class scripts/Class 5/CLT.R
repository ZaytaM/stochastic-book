# Load necessary library
library(ggplot2)

# Number of samples
q_samples <- 100  # Maximum number of copies

# Function to simulate the sample mean for different numbers of observations
simulate_binomial_CLT <- function(num_copies) {
  samples <- numeric(num_copies)
  
  for (i in 1:num_copies) {
    samples[i] <- mean(rbinom(100, size = 1, prob = 1/2))  # Fix variable name
  }
  
  return(samples)
}

# Simulate for q_samples
samples <- simulate_binomial_CLT(q_samples)

# Create a data frame for plotting
df <- data.frame(
  sample = samples
)

# Draw a histogram of the sample means with a normal distribution overlay
plot(print(ggplot(df, aes(x = sample)) +
  geom_histogram(aes(y = ..density..), binwidth = 0.02, fill = "lightblue", color = "black", alpha = 0.7) +
  geom_vline(xintercept = expected_value, color = "blue", linetype = "dashed", size = 1) +
  labs(title = "Histogram of Sample Means with Normal Distribution",
       x = "Sample Mean",
       y = "Density") +
  theme_minimal()
)
)