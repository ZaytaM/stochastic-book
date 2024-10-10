# Function to simulate a single random walk and calculate the first hitting time
simulate_random_walk <- function(horizon,p=0.5) {
  position <- 0  # Start at 0
  for (step in 1:horizon) {
    move <- sample(c(-1, 1), 1, prob=c(1-p,p))  # Randomly choose -1 or 1
    position <- position + move  # Update position
    if (position == 1) {
      return(step)  # Return the position when hitting 1
    }
  }
  return(horizon)  # If horizon is reached without hitting return position
}

l=4
p=0.4
E=numeric(l)
# E is the expecation of min(tau_1,horizon)
for (k in 1:l) {
  horizon=10^k
  trials=1000
  s=0
  for (i in 1:trials) {
    s <- s+simulate_random_walk(horizon,p)
  }
  E[k]=s/trials
}




