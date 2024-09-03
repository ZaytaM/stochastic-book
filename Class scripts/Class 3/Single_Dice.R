# Simulate a single dice and observe its histogram

Z=sample(1:6,1000,replace= TRUE)

hist(Z, breaks = seq(0.5, 6.5, 1), probability = TRUE,)