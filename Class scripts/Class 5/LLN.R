library(ggplot2)

# Parameters for the binomial distribution
n_trials <- 1  # Number of trials per experiment
p <- 0.5       # Probability of success
max_copies <- 100  # Maximum number of copies

# Function to simulate the sample mean for different numbers of observations
simulate_binomial_lln <- function(num_copies, n_trials, p) {
  sample_means <- numeric(num_copies)
  
  for (i in 1:num_copies) {
    sample_means[i] <- mean(rbinom(i, size = n_trials, prob = p))
  }
  
  return(sample_means)
}

# Simulate sample means for a range of number of copies
sample_means <- simulate_binomial_lln(max_copies, n_trials, p)

# Expected value
expected_value <- p

# Create a data frame for plotting
df <- data.frame(
  num_copies = 1:max_copies,
  sample_mean = sample_means
)
# Compute the curve y =1/2+ 1 / (2 * sqrt(2 * x)) for the overlay
df$y_curve_1 <- 1/2+1 / (2 * sqrt(2 * df$num_copies))

# Compute the curve y =1/2- 1 / (2 * sqrt(2 * x)) for the overlay
df$y_curve_2 <- 1/2-1 / (2 * sqrt(2 * df$num_copies))
# Plot the convergence of the sample mean to the expected value with the curve
print(
  ggplot(df, aes(x = num_copies)) +
    geom_point(aes(y = sample_mean), color = "blue", size = 0.5) +
    geom_hline(yintercept = expected_value, color = "red", linetype = "dashed") +  # Expected value line
    geom_line(aes(y = y_curve_1), color = "purple") +   # y =1/2+ 1 / (2 * sqrt(2x)) curve
    geom_line(aes(y = y_curve_2), color = "purple") +   # y =1/2- 1 / (2 * sqrt(2x)) curve
    scale_x_continuous(name = "Number of Copies (n)", limits = c(0, max_copies)) +  # Fix X axis
    scale_y_continuous(name = "Sample Mean / y = 1/(2√2x)", limits = c(0, 1)) +     # Fix Y axis
    labs(title = "Convergence of Sample Mean and y = 1 / (2√2x)") +
    theme_minimal()
)
