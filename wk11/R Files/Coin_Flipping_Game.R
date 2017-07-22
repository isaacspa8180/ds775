# Coin-Flipping Game Simulation
# To run, click Source (or highlight everything and click Run from the menu above)

# set.seed(1) # optional - specify a seed to reproduce the simulation exactly
SimSize=1000 # set number of trials in the simulation

RequiredDifference <- 3
CashAtEnd <- 8

nn <- 0 # set simulation clock to 0 to begin simulation
Winnings <- rep(0,SimSize)

while (nn < SimSize) {

# Simulate one round of the coin-flipping game
heads <- 0 # number of heads observed
tails <- 0 # number of tails
Difference <- 0
Flips <- 0
while (Difference < RequiredDifference) {
  if (runif(1,0,1)<.5) {
    heads <- heads + 1
  } else {
    tails <- tails + 1
  }
  Difference <- abs(heads-tails)
  Flips <- heads + tails
}

# Summarize results for each round of the coin flipping game
Winnings[nn] <- CashAtEnd - Flips
nn <- nn + 1

}

# Summarize results for the simulation
mean(Winnings)
sd(Winnings)
summary(Winnings)
hist(Winnings,breaks=20)



