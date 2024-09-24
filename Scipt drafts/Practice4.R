single_draw = function() {
  x = sample(c("H", "S"), size = 1, prob = c(0.99, 0.01))
  if (x == "H") {
    y = sample(c("tH", "tS"), size = 1, prob = c(0.9, 0.1))
  } else {
    y = sample(c("tH", "tS"), size = 1, prob = c(0.05, 0.95))
  }
  return(c(x, y))
}

nsim = 100000
df = data.frame(t(replicate(nsim, single_draw())))
colnames(df) = c("status", "test_result")

cond = (df$test_result == "tS")
df_cond = df[cond, ]
print(mean(df_cond$status == "S"))