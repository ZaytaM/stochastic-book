# Number of simulations
nsim <- 100000

# Function to simulate rolling two three sided dice
roll_two_dice <- function() {
  die1 <- sample(1:3, size = 1, replace = TRUE)  # Roll first die
  die2 <- sample(1:3, size = 1, replace = TRUE)  # Roll second die
  return(c(min(die1,die2),max(die1, die2),max(die1, die2)+min(die1, die2)))  # Record the min, max and the sum 
}
values <- data.frame(t(replicate(nsim, roll_two_dice())))