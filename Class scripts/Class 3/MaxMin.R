# Class 3

# Two dice max and min
# Set the number of simulations
n <- 10000

# Simulate two dice rolls
dice1 <- sample(1:6, n, replace = TRUE)
dice2 <- sample(1:6, n, replace = TRUE)

# Create random variables X = max(dice1, dice2) and Y = min(dice1, dice2)
X <- pmin(dice1, dice2)
Y <- pmax(dice1, dice2)

# Create a data frame to store the joint distribution
joint_distribution <- table(X, Y) / n

# Display the empirical joint distribution
print(joint_distribution)

# Extract the values of Y where X is equal to 2
Y_given_X2 <- Y[X == 2]

# Normalize the histogram by dividing by the length of Y_given_X2
hist(Y_given_X2, breaks = seq(0.5, 6.5, 1), probability = TRUE, 
     main = "Normalized Distribution of Y conditioned on X = 2", 
     xlab = "Y", ylab = "Relative Frequency", col = "lightblue", 
     border = "black", xlim = c(1, 6), xaxt = "n")

# Add custom x-axis labels
axis(1, at = 1:6)