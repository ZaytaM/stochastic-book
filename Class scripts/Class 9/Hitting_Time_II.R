# Function to simulate a single random walk and calculate the first hitting time
simulate_random_walk <- function(horizon,p=0.5) {
  position <- 0  # Start at 0
  for (step in 1:horizon) {
    move <- sample(c(-1, 1), 1, prob=c(1-p,p))  # Randomly choose -1 or 1
    position <- position + move  # Update position
    if (position == 1) {
      return(1)  # Return the 1 when hitting 1
    }
  }
  return(0)  # If horizon is reached without hitting return position
}
# This function is the indicator that tau_1 is less than the horizon
l=4
p=1/3
prob=numeric(l)
for (k in 1:l) {
horizon=10^k
trials=1000
s=0
for (i in 1:trials) {
  s <- s+simulate_random_walk(horizon,p)
}
prob[k]=s/trials
}





