# Set the seed for reproducibility
set.seed(123)

# Number of times to roll the die
num_rolls <- 10000

# Simulate rolling a fair six-sided die
rolls <- sample(1:6, size = num_rolls, replace = TRUE)

# Plot the histogram of the probabilities
hist(rolls, 
     breaks = seq(0.5, 6.5, by = 1), # Define breaks to center bars on integers
     main = "Histogram of Dice Rolls",
     xlab = "Dice Face",
     ylab = "Frequency",
     col = "skyblue",
     border = "black") 
